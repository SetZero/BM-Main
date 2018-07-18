#pragma once
#include "uc_select.h"
#include "hal\port.h"

namespace BMCPP {
	namespace Hal {

		namespace spi {
			enum class Mode : uint8_t {
				m0 = 0,
				m1 = 1,
				m2 = 2,
				m3 = 3
			};

			enum class ClkRate : uint8_t {
				clkRateDiv4 = 0,
				clkRateDiv16 = 1,
				clkRateDiv64 = 2,
				clkRateDiv128 = 3
			};
		}

		template<uint8_t number, spi::ClkRate clockRate, bool Master = true, typename MicroController = __DEFAULT_MMCU__>
		class SPI {

			static_assert(!utils::isEqual<void, __DEFAULT_MMCU__>::value, "no default MMCU defined");
			static_assert(AVR::isUC<MicroController>(), "type MicroController does not match the requirements");

			SPI() = delete;

			static inline constexpr auto spi = AVR::getAddress<typename MicroController::SPI, number>;

		private:
			
			using port_name = typename MicroController::SPI::template SPI_Port<number>::Port;
			using spi_port = BMCPP::Hal::Port<port_name, MicroController>;
			using Mosi = BMCPP::Hal::Pin<spi_port, static_cast<typename MicroController::mem_width>(MicroController::SPI::template SPI_Port<number>::Pins::Mosi)>;
			using Miso = BMCPP::Hal::Pin<spi_port, static_cast<typename MicroController::mem_width>(MicroController::SPI::template SPI_Port<number>::Pins::Miso)>;
			using SS = BMCPP::Hal::Pin<spi_port, static_cast<typename MicroController::mem_width>(MicroController::SPI::template SPI_Port<number>::Pins::SS)>;
			using SCK = BMCPP::Hal::Pin<spi_port, static_cast<typename MicroController::mem_width>(MicroController::SPI::template SPI_Port<number>::Pins::SCK)>;

			static inline constexpr auto Number = number;

			static volatile typename MicroController::mem_width& spdr() {
				return *spi()->Spdr;
			}

			static typename MicroController::mem_width spcr() {
				return spi()->Spcr.raw();
			}
			
			template<typename... T>
			static void setSpcr(T... value) {
				spi()->Spcr.set(value...);
			}

			static void clearSpcr() {
				spi()->Spcr.setRegister(0x00);
			}

			static void setDoubleSpeed() {
				spi()->Spsr.set(MicroController::SPI::spsr::SPI2X0);
			}

			static volatile typename MicroController::mem_width& readSPDR() {
				return *spi()->Spdr;
			}

			static void setSPDR(typename MicroController::mem_width value) {
				*spi()->Spdr = value;
			}

			static volatile auto readSPSR() {
				return spi()->Spsr.raw();
			}
			
		public:

			static void spi0_init()
				// Initialize pins for spi communication
			{
				//required Pins	 
				Mosi::on();
				Miso::off();
				SS::on();
				SCK::on();
				//BMCPP::Hal::SPI<0>::spiDDR() &= static_cast<uint8_t>(UC::SPI::Pins::Mosi, UC::SPI::Pins::Miso, UC::SPI::Pins::SS ,(1 << DD_SCK)));
				// Define the following pins as output
				//BMCPP::Hal::SPI<0>::spiDDR() |= ((1 << DD_MOSI) | (1 << DD_SS) | (1 << DD_SCK));

				//set Spcr to zero
				clearSpcr();

				//enable SPI - - - - set SPI Interrupt enable - - - - set Device to 
				if (Master)
					setSpcr(MicroController::SPI::spcr::SPE0, /*MicroController::SPI::spcr::SPIE0,*/ MicroController::SPI::spcr::MSTR0);
				else
					setSpcr(MicroController::SPI::spcr::SPE0, MicroController::SPI::spcr::SPIE0);

				//set Clockrate
				switch (clockRate)
				{
				case spi::ClkRate::clkRateDiv4:
					break;
				case spi::ClkRate::clkRateDiv16:
					setSpcr(MicroController::SPI::spcr::SPR00);
					break;
				case spi::ClkRate::clkRateDiv64:
					setSpcr(MicroController::SPI::spcr::SPR01);
					break;
				case spi::ClkRate::clkRateDiv128:
					setSpcr(MicroController::SPI::spcr::SPR00, MicroController::SPI::spcr::SPR01);
					break;
				default:
					break;
				}
				//set doubleSpeed
				setDoubleSpeed();
				/*
				//SPCR = /((1 << SPE) |               // SPI Enable
				(1 << SPIE) |              // SPI Interupt Enable
				(0 << DORD) |              // Data Order (0:MSB first / 1:LSB first)
				(1 << MSTR) |              // Master/Slave select
				(0 << SPR1) | (1 << SPR0) |    // SPI Clock Rate
				(0 << CPOL) |              // Clock Polarity (0:SCK low / 1:SCK hi when idle)
				(0 << CPHA)));             // Clock Phase (0:leading / 1:trailing edge sampling)

				SPSR = (1 << SPI2X);              // Double Clock Rate	   */

			}

			void writeRead(uint8_t * dataout, uint8_t * datain, uint8_t len)
				// Shift full array through target device
			{
				for (uint8_t i = 0; i < len; i++) {
					setSPDR(dataout[i]);
					while ((readSPSR() & static_cast<typename MicroController::mem_width>(MicroController::SPI::spsr::SPIF0)) == 0);
					datain[i] = readSPDR();
				}
			}

			void write(uint8_t * dataout, uint8_t len)
				// Shift full array to target device without receiving any byte
			{
				for (uint8_t i = 0; i < len; i++) {
					setSPDR(dataout[i]);
					while ((readSPSR() & static_cast<typename MicroController::mem_width>(MicroController::SPI::spsr::SPIF0)) == 0);
				}
			}

			static typename MicroController::mem_width readWriteSingle(typename MicroController::mem_width data)
				// Clocks only one byte to target device and returns the received one
			{
				setSPDR(data);
				while ((readSPSR() & static_cast<typename MicroController::mem_width>(MicroController::SPI::spsr::SPIF0)) == 0);
				return readSPDR();
			}
		};
	}
}