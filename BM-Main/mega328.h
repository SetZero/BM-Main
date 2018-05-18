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
		//modelling ports and pins: use tl for used pins
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
				DataRegister<Port, ReadOnly, uint8_t> in;
                DataRegister<Port, ReadWrite, uint8_t> ddr;
                DataRegister<Port, ReadWrite, uint8_t> out;
                template<typename L> 
				struct address;
            };

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
        
        
        } __attribute__((packed));
        
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
		enum class ATmega328_SPI_DataDirectionRegister : uintptr_t
		{
			ddrb = 0x24
		};

		template<typename L, uint8_t number>
		struct PINS
		{
			static constexpr bool used = true;
			static constexpr uint8_t num = number;
			using port = L;
		};
		enum class ATmega328_SPI_DataRegister : uintptr_t
		{
			portb = 0x25
		};
        //Timer0
        template<>
        struct ATMega328::Timer8Bit::address<0> {
            static constexpr uint8_t value = 0x44;
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

