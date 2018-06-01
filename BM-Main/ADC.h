#pragma once
#include "adc_hall.h"

namespace BMCPP
{
	namespace Hal
	{
		enum ADCMeasurementType {
			CONTINUOUS,
			SINGLE_RUN
		};

		template<int N> struct adcMUX;

		template<> 
		struct adcMUX<0>
		{
			static constexpr uintptr_t value = 0x0;
		};
		template<>
		struct adcMUX<1>
		{
			static constexpr uintptr_t value = 0x1;
		};
		template<>
		struct adcMUX<2>
		{
			static constexpr uintptr_t value = 0x2;
		};
		template<>
		struct adcMUX<3>
		{
			static constexpr uintptr_t value = 0x3;
		};
		template<>
		struct adcMUX<4>
		{
			static constexpr uintptr_t value = 0x4;
		};
		template<>
		struct adcMUX<5>
		{
			static constexpr uintptr_t value = 0x5;
		};
		template<>
		struct adcMUX<6>
		{
			static constexpr uintptr_t value = 0x6;
		};
		template<>
		struct adcMUX<7>
		{
			static constexpr uintptr_t value = 0x7;
		};

		template<ADCMeasurementType measurement_type, uint8_t prescaler_value, typename UC = __DEFAULT_MMCU__ >
		class ADConverter final
		{
			static_assert(prescaler_value >= 2 && prescaler_value <= 128, "Prescaler value has to be between 2 and 128!");
			static_assert((prescaler_value & (prescaler_value - 1)) == 0, "Prescaler value has to be a power of 2!");

			static constexpr uint8_t adcsra = (
				(static_cast<uint8_t>(UC::ADConverter::adcsra::aden)) |
				(static_cast<uint8_t>(UC::ADConverter::adcsra::adie))
				);

			constexpr uint8_t get_prescaler_value(uint8_t i) {
				switch (i) {
					case 2:		return 0;
					case 4:		return (static_cast<uint8_t>(UC::ADConverter::adcsra::adps1));
					case 8:		return (static_cast<uint8_t>(UC::ADConverter::adcsra::adps1) | static_cast<uint8_t>(UC::ADConverter::adcsra::adps0));
					case 16:	return (static_cast<uint8_t>(UC::ADConverter::adcsra::adps2));
					case 32:	return (static_cast<uint8_t>(UC::ADConverter::adcsra::adps2) | static_cast<uint8_t>(UC::ADConverter::adcsra::adps0));
					case 64:	return (static_cast<uint8_t>(UC::ADConverter::adcsra::adps2) | static_cast<uint8_t>(UC::ADConverter::adcsra::adps1));
					case 128:	return (static_cast<uint8_t>(UC::ADConverter::adcsra::adps2) | static_cast<uint8_t>(UC::ADConverter::adcsra::adps1) | static_cast<uint8_t>(UC::ADConverter::adcsra::adps0));
				}
			}
		public:
			template<typename... ADCChannels>
			static void start() {
				static_assert(sizeof...(ADCChannels) <= 8, "There are a Maximum of 8 ADCs!");
				volatile typename UC::Mem_Width* adcsra_adr = (typename UC::Mem_Width*)BMCPP::Hal::Hardware_Adc<0>::adcsra();
				*adcsra_adr = adcsra;
			}
			static void stop() {

			}
			//TODO
			template<typename Channel>
			uint16_t getValue();
		};
	}
}