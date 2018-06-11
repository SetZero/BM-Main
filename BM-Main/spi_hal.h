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
			using Port = typename MicroController::template SPI_Port<0>::Port;
			static inline constexpr auto Number = number;

			static volatile typename MicroController::mem_width& spdr() {
				return *spi()->Spdr;
			}

			static typename MicroController::mem_width spcr() {
				return spi()->Spcr.raw();
			}

			//template<typename... T>
			//static void setSpcr(typename MicroController::mem_width spcrVal) {
				//spi()->Spcr.setRegister(spcrVal);
			//}

			
			static void setSpcr(typename MicroController::SPI::spcr value...) {
				spi()->Spcr.set(value);
			}
			static void clearSpcr() {
				spi()->Spcr.clear();
			}

			static void setDoubleSpeed() {
				return spi()->Spsr.set(MicroController::SPI::spsr::SPI2X0);
			}

			static volatile typename MicroController::mem_width& readSPDR() {
				return *spi()->Spdr;
			}

			static void setSPDR(typename MicroController::mem_width value) {
				*spi()->Spdr = value;
			}

			static volatile typename MicroController::mem_width& readSPSR() {
				spi()->Spsr.raw();
			}
		};
	}
}