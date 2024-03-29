#pragma once
#include "adc_hal.h"
#include "../Utils/Utils.h"
//#include "../uart.h"
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
			static constexpr uint8_t maximum_adc = Hardware_Adc::maximum_adc;
			static volatile uint16_t adc_result[maximum_adc];
			static ADCMeasurementType m_measurement_type;
			static uint8_t currentADC;
			
		public:
			template<uint8_t prescaler_value = 8, ADCMeasurementType measurement_type = CONTINUOUS>
			static void init() {
				static_assert(prescaler_value >= 2 && prescaler_value <= 128, "Prescaler value has to be between 2 and 128!");
				static_assert((prescaler_value & (prescaler_value - 1)) == 0, "Prescaler value has to be a power of 2!");
				Hardware_Adc::start_adc(prescaler_value);
				m_measurement_type = measurement_type;
			}

			template<uint8_t Channel>
			static void create() {
				static_assert(Channel < maximum_adc, "This Channel doesn't exist!");
				Hardware_Adc::startConversion();
				Hardware_Adc::activateChannel(Channel);
				
			}

			template<uint8_t Channel>
			static void stop() {
				static_assert(Channel < maximum_adc, "This Channel doesn't exist!");
				Hardware_Adc::deactivateChannel(Channel);
			}

			template<uint8_t Channel>
			static uint16_t getValue() {
				return adc_result[Channel];
			}

			static void writeResults() {
				if (!Hardware_Adc::isAnyChannelActive()) return;
				while (!Hardware_Adc::isActiveChannel(currentADC) || currentADC > maximum_adc) currentADC++;
				adc_result[currentADC++] = Hardware_Adc::getADCValue();
				if (currentADC > maximum_adc) currentADC = 0;
				Hardware_Adc::changeADCMux(currentADC);

				if (m_measurement_type == CONTINUOUS) {
					Hardware_Adc::startConversion();
				}
			}
		};
		template<typename Hardware_Adc>
		volatile uint16_t ADConverter<Hardware_Adc>::adc_result[ADConverter<Hardware_Adc>::maximum_adc];
		template<typename Hardware_Adc>
		ADCMeasurementType ADConverter<Hardware_Adc>::m_measurement_type = CONTINUOUS;
		template<typename Hardware_Adc>
		uint8_t ADConverter<Hardware_Adc>::currentADC = 0;
	}
}
