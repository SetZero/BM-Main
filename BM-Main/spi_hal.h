#pragma once
#include "uc_select.h"
#include "hal\port.h"

namespace BMCPP {
	namespace Hal {
		template<uint8_t number, typename MicroController = __DEFAULT_MMCU__>
		class SPI {

			static_assert(!utils::isEqual<void, __DEFAULT_MMCU__>::value, "no default MMCU defined");
			static_assert(AVR::isUC<MicroController>(), "type MicroController does not match the requirements");

			SPI() = delete;

			static inline constexpr auto spi = AVR::getAddress<typename MicroController::SPI, number>;

		public:
			
			using port_name = typename MicroController::SPI::template SPI_Port<0>::Port;
			using spi_port = BMCPP::Hal::Port<port_name, MicroController>;
			using Mosi = BMCPP::Hal::Pin<spi_port, static_cast<typename MicroController::mem_width>(MicroController::SPI::template SPI_Port<0>::Pins::Mosi)>;
			using Miso = BMCPP::Hal::Pin<spi_port, static_cast<typename MicroController::mem_width>(MicroController::SPI::template SPI_Port<0>::Pins::Miso)>;
			using SS = BMCPP::Hal::Pin<spi_port, static_cast<typename MicroController::mem_width>(MicroController::SPI::template SPI_Port<0>::Pins::SS)>;
			using SCK = BMCPP::Hal::Pin<spi_port, static_cast<typename MicroController::mem_width>(MicroController::SPI::template SPI_Port<0>::Pins::SCK)>;

			static inline constexpr auto Number = number;

			static volatile typename MicroController::mem_width& spdr() {
				return *spi()->Spdr;
			}

			static typename MicroController::mem_width spcr() {
				return spi()->Spcr.raw();
			}
			
			static void setSpcr(typename MicroController::SPI::spcr value...) {
				spi()->Spcr.set(value);
			}
			static void clearSpcr() {
				spi()->Spcr.clear();
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
		};
	}
}