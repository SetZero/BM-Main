#pragma once
#include "uc_select.h"
#include "hal\port.h"


namespace BMCPP {
	namespace Hal {

		struct clkRateDiv4 {};
		struct clkRateDiv16 {};
		struct	clkRateDiv64 {};
		struct	clkRateDiv128 {};

		namespace spi {
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
			template<typename, uint8_t> typename PIN,
			bool Master = true,
			bool SPI_Interrupt = false,
			typename word_size = uint8_t,
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

				/*
				* Description: initializes the SPI Component, have to be called before every other method.
				*/
				static void init() {
					//required Pins	 
					Mosi::on();
					Miso::off();
					SS::on();
					SCK::on();
					//set Spcr to zero
					clearSpcr();

					//enable SPI - - - - set SPI Interrupt enable on request - - - - set Device to 
					if (Master) {
						setSpcr(MicroController::SPI::spcr::SPE0, 
							MicroController::SPI::spcr::MSTR0);
						if (SPI_Interrupt)
							setSpcr(MicroController::SPI::spcr::SPIE0);
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
				}

				/*
				* Description: writes a whole array to the target device and saves the input from the device in de datain array
				*/
				void writeRead(const word_size* dataout, word_size* datain,const word_size len) {
					for (word_size i = 0; i < len; i++) {
						setSPDR(dataout[i]);
						while ((readSPSR() & static_cast<word_size>(MicroController::SPI::spsr::SPIF0)) == 0);
						datain[i] = readSPDR();
					}
				}

				/*
				* Description: writes a whole array to the target device and dont receive
				*/
				void write(const word_size* dataout,const word_size len) {
					for (word_size i = 0; i < len; i++) {
						setSPDR(dataout[i]);
						while ((readSPSR() & static_cast<typename MicroController::mem_width>(MicroController::SPI::spsr::SPIF0)) == 0);
					}
				}

				/*
				* Description: writes a single word to the target device and returns the input from the device
				*/
				static word_size readWriteSingle(word_size data) {
					setSPDR(data);
					while ((readSPSR() & static_cast<word_size>(MicroController::SPI::spsr::SPIF0)) == 0);
					return readSPDR();
				}
		};
	}
}