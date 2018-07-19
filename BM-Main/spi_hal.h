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

		template<
			uint8_t number, 
			typename clockRate,
			template<typename, typename> typename PORT, 
			template<typename , uint8_t> typename PIN, 
			bool Master = true, 
			typename MicroController = __DEFAULT_MMCU__>
		class SPI {

			static_assert(!utils::isEqual<void, __DEFAULT_MMCU__>::value, "no default MMCU defined");
			//concept definition moved to external header and concept moved to static assert for syntax highlighting 
			static_assert(AVR::isUC<MicroController>(), "type MicroController does not match the requirements");

			SPI() = delete;

			static inline constexpr auto spi = AVR::getAddress<typename MicroController::SPI, number>;
			
			using port_name = typename MicroController::SPI::template SPI_Port<number>::Port;
			using spi_port = PORT<port_name, MicroController>;
			static_assert(AVR::isPort<spi_port>(), " template parameter PORT was not e port template");
			using Mosi = PIN<spi_port, static_cast<typename MicroController::mem_width>(MicroController::SPI::template SPI_Port<number>::Pins::Mosi)>;
			static_assert(AVR::isPin<Mosi>(), " template parameter PIN was not e pin template");
			using Miso = PIN<spi_port, static_cast<typename MicroController::mem_width>(MicroController::SPI::template SPI_Port<number>::Pins::Miso)>;
			using SS = PIN<spi_port, static_cast<typename MicroController::mem_width>(MicroController::SPI::template SPI_Port<number>::Pins::SS)>;
			using SCK = PIN<spi_port, static_cast<typename MicroController::mem_width>(MicroController::SPI::template SPI_Port<number>::Pins::SCK)>;

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

			static void init()
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
				if (Master) {
					setSpcr(MicroController::SPI::spcr::SPE0, MicroController::SPI::spcr::SPIE0,
						MicroController::SPI::spcr::MSTR0);
					Mosi::template dir<typename Mosi::Output>();
					Miso::template dir<typename Miso::Input>();
					SS::template dir<typename SS::Output>();
					SCK::template dir<typename SCK::Output>();
				}
				else {
					setSpcr(MicroController::SPI::spcr::SPE0, MicroController::SPI::spcr::SPIE0);
					Mosi::template dir<typename Mosi::Input>();
					Miso::template dir<typename Miso::Output>();
					SS::template dir<typename SS::Input>();
					SCK::template dir<typename SCK::Input>();
				}

				//set Clockrate
					if constexpr(utils::isEqual<clockRate, clkRateDiv4>::value); //stays 0
					else if constexpr(utils::isEqual<clockRate, clkRateDiv16>::value)
						setSpcr(MicroController::SPI::spcr::SPR00);
					else if constexpr(utils::isEqual<clockRate, clkRateDiv64>::value)
						setSpcr(MicroController::SPI::spcr::SPR01);
					else if constexpr(utils::isEqual<clockRate, clkRateDiv128>::value)
						setSpcr(MicroController::SPI::spcr::SPR00, MicroController::SPI::spcr::SPR01);

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

			void writeRead(typename MicroController::mem_width * dataout, typename MicroController::mem_width * datain, typename MicroController::mem_width len)
				// Shift full array through target device
			{
				for (uint8_t i = 0; i < len; i++) {
					setSPDR(dataout[i]);
					while ((readSPSR() & static_cast<typename MicroController::mem_width>(MicroController::SPI::spsr::SPIF0)) == 0);
					datain[i] = readSPDR();
				}
			}

			void write(typename MicroController::mem_width * dataout, typename MicroController::mem_width len)
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