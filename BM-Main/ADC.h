#pragma once
#include "adc_hall.h"
#include "Utils/Utils.h"
#include <avr/interrupt.h>

namespace BMCPP
{
	namespace Hal
	{
		enum ADCMeasurementType {
			CONTINUOUS,
			SINGLE_RUN
		};

		template<uint8_t prescaler_value = 8, uint8_t adc_number = 0, ADCMeasurementType measurement_type = CONTINUOUS, typename UC = __DEFAULT_MMCU__ >
		class ADConverter final
		{
			static_assert(prescaler_value >= 2 && prescaler_value <= 128, "Prescaler value has to be between 2 and 128!");
			static_assert((prescaler_value & (prescaler_value - 1)) == 0, "Prescaler value has to be a power of 2!");
			static_assert(adc_number <= UC::ADConverter::count, "The ADC number is exceeding the amount of ADCs available!");

			constexpr uint8_t get_prescaler_value() {
				switch (prescaler_value) {
					case 2:		return 0;
					case 4:		return (static_cast<uint8_t>(UC::ADConverter::adcsra::adps1));
					case 8:		return (static_cast<uint8_t>(UC::ADConverter::adcsra::adps1) | static_cast<uint8_t>(UC::ADConverter::adcsra::adps0));
					case 16:	return (static_cast<uint8_t>(UC::ADConverter::adcsra::adps2));
					case 32:	return (static_cast<uint8_t>(UC::ADConverter::adcsra::adps2) | static_cast<uint8_t>(UC::ADConverter::adcsra::adps0));
					case 64:	return (static_cast<uint8_t>(UC::ADConverter::adcsra::adps2) | static_cast<uint8_t>(UC::ADConverter::adcsra::adps1));
					case 128:	return (static_cast<uint8_t>(UC::ADConverter::adcsra::adps2) | static_cast<uint8_t>(UC::ADConverter::adcsra::adps1) | static_cast<uint8_t>(UC::ADConverter::adcsra::adps0));
				}
			}

			static constexpr uint8_t maximum_active_adcs = 0;
			static constexpr uint8_t adcsra = (
				(static_cast<uint8_t>(UC::ADConverter::adcsra::aden)) |
				(static_cast<uint8_t>(UC::ADConverter::adcsra::adie)) |
				(static_cast<uint8_t>(UC::ADConverter::adcsra::adsc)) |
				get_prescaler_value()
			);

			static volatile uint16_t adc_result[maximum_active_adcs];

		public:
			template<uint8_t... ADCChannels>
			static void startChannels() {
				static_assert(sizeof...(ADCChannels) <= 8, "There are a Maximum of 8 ADCs!");
				if constexpr(maximum_active_adcs < sizeof...(ADCChannels)) {
					maximum_active_adcs = sizeof...(ADCChannels);
				}

				volatile typename UC::Mem_Width* adcsra_adr = (typename UC::Mem_Width*)BMCPP::Hal::Hardware_Adc<adc_number>::adcsra();
				*adcsra_adr = adcsra;
			}
			static void stop() {

			}
			//TODO
			template<uint8_t Channel>
			static uint16_t getValue() {
				return adc_result[Channel];
			}
		};
	}
}

ISR(ADC_vect)
{
}