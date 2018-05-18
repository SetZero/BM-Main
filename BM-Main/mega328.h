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

#ifndef __AVR_ATmega328P__
	#define __AVR_ATmega328P__
#endif // !__AVR_ATmega328P__

#if __has_include(<avr/io.h>)
	# include <avr/io.h>
#endif

#include "register.h"

namespace BMCPP
{
    namespace AVR
    {
		//////////////////////////////////////////////////////////////////////////////////////
		////PROTOTYP
		template<typename... pins>
		struct setUsedPins {
			static_assert(utils::sameTypes(pins...) && utils::isEqual<utils::front<pins...>::type,PIN>::value,"wrong parameters, only PIN allowed");
			using type = utils::list<pins>;
		};

		template<auto num, typename Port>
		struct PIN {
			constexpr auto number = num;
			using port = Port;
		};
		template<typename AccessType, uintptr_t address, typename firstPin, typename... pins>
		struct DataReg {
			static_assert(utils::isEqual<firstPin, PIN>::value && utils::sameTypes(pins), "use Pin struct!");
			using BitType = AccessType;
			constexpr auto regAddress = address;
			using Pins = utils::list<pins...>::type;
		};
		//////////////////////////////////////////////////////////////////////////////////////////////////////////
        struct A {};
        struct B {};
        struct C {};
        struct D {};
        struct E {};
		
        struct ATMega328 final
        {
            ATMega328() = delete;
            struct Port final
            {
                Port() = delete;
				using in = DataRegister<Port, ReadOnly, uint8_t> ;
                using ddr = DataRegister<Port, ReadWrite, uint8_t> ;
                using out = DataRegister<Port, ReadWrite, uint8_t> ;
                template<typename L> 
				struct address;
            };
			/////////////////////////////////////////////////////////////////////////////////////////////////////////////
			////    PROTOTYP
			struct PortB final {
				//PORTB
				using out = DataReg <ReadWrite, 0x05, PIN<0,B>, PIN<1,B>, PIN<2,B>, PIN<3,B>, PIN<4,B>, PIN<5,B>, PIN<6,B>, PIN<7,B>>;
				//PINB
				using in = DataReg <ReadOnly, 0x03, PIN<0, B>, PIN<1, B>, PIN<2, B>, PIN<3, B>, PIN<4, B>, PIN<5, B>, PIN<6, B>, PIN<7, B>>;
				//DDRB
				using ddr = DataReg <ReadWrite, 0x04, PIN<0, B>, PIN<1, B>, PIN<2, B>, PIN<3, B>, PIN<4, B>, PIN<5, B>, PIN<6, B>, PIN<7, B>>;
				//functions constexpr get pin..... no setpin(runtime)
				//set usedPin
			};
			////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            struct Timer8Bit {
                static constexpr const uint8_t count = 2;
                typedef uint8_t value_type;
                enum class TCCRA : uint8_t {
                    coma0 = (1 << COM0A0),
                    coma1 = (1 << COM0A1),
                    comb0 = (1 << COM0B0),
                    comb1 = (1 << COM0B1),
                    wgm0 = (1 << WGM00),
                    wgm1 = (1 << WGM01)
                };
                ControlRegister<Timer8Bit, TCCRA> tccra;
                enum class TCCRB : uint8_t {
                    foca = (1 << FOC0A),
                    focb = (1 << FOC0B),
                    wgm2 = (1 << WGM02),
                    cs2 = (1 << CS02),
                    cs1 = (1 << CS01),
                    cs0 = (1 << CS00),
                };
                
                ControlRegister<Timer8Bit, TCCRB> tccrb;
                DataRegister<Timer8Bit, ReadWrite, uint8_t> tcnt;
                DataRegister<Timer8Bit, ReadWrite, uint8_t> ocra;
				DataRegister<Timer8Bit, ReadWrite, uint8_t> ocrb;
                template<int N> struct address;
            };
			struct ADC {
				static constexpr const uint8_t count = 5;

				template<uint8_t adc> struct channel_select;
			};
        
        } __attribute__((packed));
        
		template<typename ATMega328>
		struct setPin {
			using type = A
		};

        template<>
        struct ATMega328::Port::address<B>
        {
             static constexpr uintptr_t value = 0x23;
        };
        template<>
        struct ATMega328::Port::address<C>
        {
             static constexpr uintptr_t value = 0x26;
        };
        template<>
        struct ATMega328::Port::address<D>
        {
             static constexpr uintptr_t value = 0x29;
        };
        //Timer0
        template<>
        struct ATMega328::Timer8Bit::address<0> {
            static constexpr uint8_t value = 0x44;
        };
        
        //ADC
		template<>
		struct ATMega328::ADC::channel_select<0> {
			static constexpr uint8_t value = 0b0000;
		};

		template<>
		struct ATMega328::ADC::channel_select<1> {
			static constexpr uint8_t value = 0b0001;
		};

		template<>
		struct ATMega328::ADC::channel_select<2> {
			static constexpr uint8_t value = 0b0010;
		};

		template<>
		struct ATMega328::ADC::channel_select<3> {
			static constexpr uint8_t value = 0b0011;
		};

		template<>
		struct ATMega328::ADC::channel_select<4> {
			static constexpr uint8_t value = 0b0100;
		};

		template<>
		struct ATMega328::ADC::channel_select<5> {
			static constexpr uint8_t value = 0b0101;
		};
        
        template<typename Component, uint8_t N>
        constexpr Component* getAddress()
        {
            return reinterpret_cast<Component*>(Component::template address<N>::value);
        }
        template<typename Component, typename Letter>
        constexpr Component* getAddress()
        {
            return reinterpret_cast<Component*>(Component::template address<Letter>::value);
        }
        template<typename Component>
        constexpr Component* getAddress()
        {
            return reinterpret_cast<Component*>(Component::address);
        }
    }
}

