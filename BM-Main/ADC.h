#pragma once
#include "mega328.h"

namespace BMCPP
{
	namespace AVR
	{
		enum ADCMeasurementType {
			CONTINUOUS,
			SINGLE_RUN
		};

		template<typename... ADCChannels, ADCMeasurementType measurement_type, uint8_t prescaler_value>
		struct ADConverter final
		{
			static inline constexpr auto port = BMCPP::AVR::getAddress<BMCPP::AVR::ATMega328::Port, PortName>;
			//TODO
			template<typename Channel>
			uint16_t getValue();

			constexpr uint8_t get_prescaler_value() {
				static_assert(prescaler_value >= 2 && prescaler_value <= 128, "Prescaler value has to be between 2 and 128!");
				static_assert((prescaler_value & (prescaler_value - 1)) == 0, "Prescaler value is not a power of 2!");
				switch (i) {
					case 2:		return 0b001;
					case 4:		return 0b010;
					case 8:		return 0b011;
					case 16:	return 0b100;
					case 32:	return 0b101;
					case 64:	return 0b110;
					case 128:	return 0b111;
				}
			}
		};
	}
}