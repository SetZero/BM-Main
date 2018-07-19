#pragma once
#include "../hal/port.h"
#include "../uart.h"
#include <stdlib.h>

namespace BMCPP {
	namespace Hal {
		template<uint8_t adc_number, typename MicroController = __DEFAULT_MMCU__>
		class Hardware_Adc {
			static_assert(adc_number <= MicroController::ADConverter::count, "The ADC number is exceeding the amount of ADCs available!");
			static_assert(!utils::isEqual<void, __DEFAULT_MMCU__>::value, "no default MMCU defined");
			static_assert(AVR::isUC<MicroController>(), "type MicroController does not match the requirements");
			Hardware_Adc() = delete;

			static inline constexpr auto adc = AVR::getAddress<typename MicroController::ADConverter, adc_number>;
			static uint8_t activeADCs;
			using sra = typename MicroController::ADConverter::ADCsra;
			using mux = typename MicroController::ADConverter::ADMux;


			static typename MicroController::mem_width adch() {
				return *adc()->adch;
			}
			static typename MicroController::mem_width adcl() {
				return *adc()->adcl;
			}

			static typename MicroController::mem_width adcsra() {
				return adc()->adcsra.raw();
			}
			template<typename... T>
			static void setAdcsra(T... value) {
				adc()->adcsra.set(value...);
			}
			template<typename... T>
			static void addAdcsra(T... value) {
				adc()->adcsra.add(value...);
			}
			static void clearAdcsra() {
				adc()->adcsra.setRegister(0x00);
			}
			static volatile typename MicroController::mem_width adcsrb() {
				return adc()->adcsrb;
			}

			static volatile typename MicroController::mem_width admux() {
				return adc()->admux;
			}
			template<typename... T>
			static void setAdmux(T... value) {
				adc()->admux.set(value...);
			}
			template<typename... T>
			static void addAdmux(T... value) {
				adc()->admux.add(value...);
			}
			static void clearAdmux() {
				adc()->admux.setRegister(0x00);
			}

			static constexpr void set_prescaler_value(typename MicroController::mem_width prescaler_value) {
				switch (prescaler_value) {
				case 2:		break;
				case 4:		setAdcsra(sra::adps1); break;
				case 8:		setAdcsra(sra::adps1, sra::adps0); break;
				case 16:	setAdcsra(sra::adps1); break;
				case 32:	setAdcsra(sra::adps2, sra::adps0); break;
				case 64:	setAdcsra(sra::adps2, sra::adps1); break;
				case 128:	setAdcsra(sra::adps2, sra::adps1, sra::adps0); break;
				}
			}
		public:
			static constexpr uint8_t maximum_adc = 8;

			static uint16_t getADCValue() {
				return adcl() | (adch() << 8);
			}

			//static constexpr uint8_t maximum_active_adcs = 8;
			static void start_adc(typename MicroController::mem_width prescaler_value)
			{
				clearAdcsra();
				set_prescaler_value(prescaler_value);
				addAdcsra(sra::aden, sra::adie);
			}

			static void startConversion() {
				addAdcsra(sra::adsc);
			}

			static void activateChannel(typename MicroController::mem_width Channel) {
				activeADCs = static_cast<typename MicroController::mem_width>(activeADCs | (1 << Channel));
			}

			static void deactivateChannel(typename MicroController::mem_width Channel) {
				activeADCs &= ~(1 << Channel);
			}

			static bool  isActiveChannel(typename MicroController::mem_width Channel) {
				return (activeADCs >> Channel) & 0x01;
			}
			static bool isAnyChannelActive() {
				return activeADCs != 0;
			}

			static void changeADCMux(typename MicroController::mem_width adc) {
				clearAdmux();
				switch (adc) {
				case 0:		break;
				case 1:		setAdmux(mux::mux0); break;
				case 2:		setAdmux(mux::mux1); break;
				case 3:		setAdmux(mux::mux0, mux::mux1); break;
				case 4:		setAdmux(mux::mux2); break;
				case 5:		setAdmux(mux::mux2, mux::mux0); break;
				case 6:		setAdmux(mux::mux2, mux::mux1); break;
				case 7:		setAdmux(mux::mux2, mux::mux1, mux::mux0); break;
				}

			}
		};
		template<uint8_t adc_number, typename MicroController>
		uint8_t Hardware_Adc<adc_number, MicroController>::activeADCs = 0;

	}
}