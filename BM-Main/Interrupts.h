#pragma once

#include "ADC.h"

class interrupts {
	template<uint8_t prescaler_value, uint8_t adc_number, ADCMeasurementType measurement_type, typename UC>
	static BMCPP::Hal::ADConverter<prescaler_value, adc_number, measurement_type, UC> *adc;

	static void handler1() __asm__("__vector_21") __attribute__((__signal__, __used__, __externally_visible__)) 
public:
	template<uint8_t prescaler_value, uint8_t adc_number, ADCMeasurementType measurement_type, typename UC>
	static void record(int interruptNumber, BMCPP::Hal::ADConverter<prescaler_value, adc_number, measurement_type, UC> *a) {
		adc = a;
	}
};