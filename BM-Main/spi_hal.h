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

			using tmp = typename MicroController::template SPI_Port<0>::Port;
			using Port = BMCPP::Hal::Port<tmp,MicroController>;

		public:
			static inline constexpr auto Number = number;

			static volatile typename MicroController::mem_width& spdr() {
				return *spi()->Spdr;
			}

			static volatile typename MicroController::mem_width& spiDDR() {
				return Port::ddr();
			}

			static typename MicroController::mem_width spcr() {
				return spi()->Spcr.raw();
			}

			//template<typename... T>
			static void setSpcr(typename MicroController::mem_width spcrVal) {
				spi()->Spcr.setRegister(spcrVal);
			}

			static void setSpcr(typename MicroController::SPI::spcr value) {
				spi()->Spcr.set(value);
			}

			static volatile auto spsr() {
				return spi()->Spsr.raw();
			}
		};
	}
}