#pragma once
#include "adc_hall.h"
#include "Utils/Utils.h"
#include "uart.h"
#include <avr/interrupt.h>
#include <stdlib.h>

namespace BMCPP
{
	//	
	namespace Hal
	{
		enum ADCMeasurementType {
			CONTINUOUS,
			SINGLE_RUN
		};

		template<typename Hardware_Adc>
		class ADConverter final
		{
			static constexpr uint8_t maximum_adc = 8;
			static volatile uint16_t adc_result[maximum_adc];

			
		public:
			template<uint8_t prescaler_value = 8>
			static void init() {
				static_assert(prescaler_value >= 2 && prescaler_value <= 128, "Prescaler value has to be between 2 and 128!");
				static_assert((prescaler_value & (prescaler_value - 1)) == 0, "Prescaler value has to be a power of 2!");
				Hardware_Adc::create_adcsra(prescaler_value);
			}

			template<uint8_t Channel, ADCMeasurementType measurement_type = CONTINUOUS>
			static void create() {
				Hardware_Adc::startConversion();
			}
			static void stop() {

			}
			//TODO
			template<uint8_t Channel>
			static uint16_t getValue() {
				return adc_result[Channel];
			}

			static void writeResults() {
				adc_result[0] = ADC;//(Hardware_Adc::adch() << 8) | Hardware_Adc::adcl();
				Hardware_Adc::startConversion();

			}
		};
		template<typename Hardware_Adc>
		volatile uint16_t ADConverter<Hardware_Adc>::adc_result[ADConverter<Hardware_Adc>::maximum_adc];
	}
}


/*ISR(ADC_vect)
{
	// Start the next conversion.
	ADCSRA |= (1 << ADSC);
}*/
/*namespace BMCPP
{
	//	
	namespace Hal
	{
		enum ADCMeasurementType {
			CONTINUOUS,
			SINGLE_RUN
		};
		

		//template<uint8_t prescaler_value = 8, uint8_t adc_number = 0, ADCMeasurementType measurement_type = CONTINUOUS, typename UC = __DEFAULT_MMCU__ >

		class ADConverter {
			static const uint8_t maximum_adc = 8;
			volatile uint16_t adc_result[maximum_adc];

			class adcInterrupt {
				static ADConverter *ownerAdc;
				static void serviceRoutine() __asm__("__vector_21") __attribute__((__signal__, __used__, __externally_visible__));

			public:
				static void record(ADConverter *t) {
					ownerAdc = t;
				}
			};
			friend adcInterrupt;

			template<uint8_t prescaler_value = 8, uint8_t adc_number = 0, ADCMeasurementType measurement_type = CONTINUOUS, typename UC = __DEFAULT_MMCU__>
			struct internalADC {

				static_assert(prescaler_value >= 2 && prescaler_value <= 128, "Prescaler value has to be between 2 and 128!");
				static_assert((prescaler_value & (prescaler_value - 1)) == 0, "Prescaler value has to be a power of 2!");
				static_assert(adc_number <= UC::ADConverter::count, "The ADC number is exceeding the amount of ADCs available!");

				static constexpr uint8_t get_prescaler_value() {
					switch (prescaler_value) {
					case 2:		return 0;
					case 4:		return (static_cast<uint8_t>(UC::ADConverter::ADCsra::adps1));
					case 8:		return (static_cast<uint8_t>(UC::ADConverter::ADCsra::adps1) | static_cast<uint8_t>(UC::ADConverter::ADCsra::adps0));
					case 16:	return (static_cast<uint8_t>(UC::ADConverter::ADCsra::adps2));
					case 32:	return (static_cast<uint8_t>(UC::ADConverter::ADCsra::adps2) | static_cast<uint8_t>(UC::ADConverter::ADCsra::adps0));
					case 64:	return (static_cast<uint8_t>(UC::ADConverter::ADCsra::adps2) | static_cast<uint8_t>(UC::ADConverter::ADCsra::adps1));
					case 128:	return (static_cast<uint8_t>(UC::ADConverter::ADCsra::adps2) | static_cast<uint8_t>(UC::ADConverter::ADCsra::adps1) | static_cast<uint8_t>(UC::ADConverter::ADCsra::adps0));
					}
				}

				static constexpr uint8_t adcsra = (
					(static_cast<uint8_t>(UC::ADConverter::ADCsra::aden)) |
					(static_cast<uint8_t>(UC::ADConverter::ADCsra::adie)) |
					(static_cast<uint8_t>(UC::ADConverter::ADCsra::adsc)) |
					get_prescaler_value()
					);
			};
		public:
			ADConverter(uint8_t prescaler_value = 8, uint8_t adc_number = 0, ADCMeasurementType measurement_type = CONTINUOUS)
			{
				adcInterrupt::record(this);
				sei();

				int a = internalADC<>::adcsra;
				char str[16];
				itoa(a, str, 10);
				uart_puts(str);
				uart_puts("\n");
			}

			template<uint8_t Channel>
			uint16_t getValue() {
				return adc_result[Channel];
			}
		};
		ADConverter *ADConverter::adcInterrupt::ownerAdc = nullptr;

		void ADConverter::adcInterrupt::serviceRoutine() {
			if (ownerAdc != nullptr)
				ownerAdc->adc_result[0] = ADC;
			ADCSRA |= (1 << ADSC);
		}
	}
}*/

