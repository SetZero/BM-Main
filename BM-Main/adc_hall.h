#pragma once
#include "hal/port.h"

namespace BMCPP {
	namespace Hal {
		template<uint8_t adc_number, typename MicroController = __DEFAULT_MMCU__>
		class Hardware_Adc {
			static_assert(!utils::isEqual<void, __DEFAULT_MMCU__>::value, "no default MMCU defined");
			static_assert(AVR::isUC<MicroController>(), "type MicroController does not match the requirements");
			Hardware_Adc() = delete;

			static inline constexpr auto adc = AVR::getAddress<typename MicroController::ADConverter, adc_number>;
		public:
			static volatile uint8_t& adch() {
				return *adc()->adch.raw();
			}
			static volatile uint8_t& adcl() {
				return *adc()->adcl.raw();
			}
			static volatile uint8_t& adcsra() {
				return *adc()->adcsra;
			}
			static volatile uint8_t& adcsrb() {
				return *adc()->adcsrb;
			}
			static volatile uint8_t& admux() {
				return *adc()->admux;
			}
		};
	}
}