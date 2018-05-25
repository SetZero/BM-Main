/*
 * ++C - C++ introduction
 * Copyright (C) 2013, 2014, 2015, 2016, 2017 Wilhelm Meier <wilhelm.meier@hs-kl.de>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

#include <stdint.h>
#include "../Utils/Utils.h"
#include "../meta/meta.h"
#include "../AVR_concepts.h"


namespace BMCPP {
    namespace Hal {

        struct Output {};
        struct Input {};

		//currently the only available MMCU in this great library
	#ifdef __AVR_ATmega328P__
		#define __DEFAULT_MMCU__ AVR::ATMega328
	#else
		#define	 __DEFAULT_MMCU__ void
	#endif // __AVR_ATmega328P__


		template<uint8_t number, typename MicroController = __DEFAULT_MMCU__>
		class SPI {
			static_assert(!utils::isEqual<void, __DEFAULT_MMCU__>::value, "no default MMCU defined");
			static_assert(AVR::isUC<MicroController>(), "type MicroController does not match the requirements");
			SPI() = delete;
			static inline constexpr auto spi = AVR::getAddress<typename MicroController::SPI, number>;
		public:
			static inline constexpr auto Number = number;

			static volatile uintptr_t& spdr() {
				return *spi()->Spdr;
			}
			static volatile auto spcr() {
				return spi()->Spcr.raw();
			}
			static volatile auto spsr() {
				return spi()->Spsr.raw();
			}
		};

        template<typename PortName, typename MicroController = __DEFAULT_MMCU__>
        class Port {
			static_assert(AVR::isUC<MicroController>(), "type MicroController does not match the requirements");
            Port() = delete;
           static inline constexpr auto port = AVR::getAddress<typename MicroController::Port, PortName>;
        public:
            typedef PortName portname_type;
            
            static volatile uint8_t& ddr() {
                return *port()->ddr;
            }
            static volatile uint8_t& get() {
                return *port()->out;
            }
            static volatile uint8_t& read() {
                return *port()->in;
            }
        };
        
        template<typename Port, uint8_t Number>
        class Pin {
            Pin() = delete;
            static_assert(Number < 8);
        public:
            static inline constexpr uint8_t mask{1 << Number};
            static inline constexpr uint8_t number = Number;
            typedef Port port_type;
        
            template<typename Dir>
            static void dir() {
                if constexpr(std::is_same<Dir, Output>::value) {
                    Port::ddr() |= mask;
                }
                else if constexpr(std::is_same<Dir, Input>::value) {
                    Port::ddr() &= ~mask;
                }
                else {
                    static_assert(sizeof(Port) == 0, "Only Input or Output allowed");
                }
            }
            static void on() {
                Port::get() |= mask;
            }
            static void off() {
                Port::get() &= ~mask;
            }
        };
        
		template<typename T>
		concept bool isPin() {
			return requires(T t) {
				typename T::port_type;
				T::on();
				T::off();
				T::number;
				T::template dir<Output>();
			};
		}

        template<typename... Pins>
        requires 
			(sizeof...(Pins) >= 1) && 
			(sizeof...(Pins) <= 8) && 
			(std::is_same<typename Meta::front<Meta::List<Pins...>>::port_type, typename Pins::port_type>::value && ...) &&
			(isPin<Pins>() && ...)
        class PinSet {
            PinSet() = delete;
            static_assert(sizeof...(Pins) >= 1);
            static_assert(sizeof...(Pins) <= 8);
            
            using pinList = Meta::List<Pins...>;
            using firstPin = Meta::front<pinList>;
            using port_type = typename firstPin::port_type;
            static_assert((std::is_same<port_type, typename Pins::port_type>::value && ...), "all pins must use the same port");
            
        public:
            template<typename Dir>
            static void dir() {
                (Pins::template dir<Dir>(), ...);
            }
            static void allOn() {
                (Pins::on(), ...);
            }
            static void allOff() {
                (Pins::off(), ...);
            }
        private:
        };
    }
}
