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
#include "Utils\Utils.h"

namespace BMCPP
{
    namespace AVR
    {
        struct A {};
        struct B {};
        struct C {};
        struct D {};
        struct E {};

		struct ADMultiplexer {};
		struct ADCStatusRegisterA {};
		struct ADCStatusRegisterB {};
		
        struct ATMega328 final
        {
            ATMega328() = delete;

			static constexpr utils::minRequiredUnsigned<16000000>::type ClkRate = 16000000;
			using mem_width = uint8_t;

            struct Port final
            {
                Port() = delete;
				DataRegister<Port, ReadOnly, mem_width> in;
                DataRegister<Port, ReadWrite, mem_width> ddr;
                DataRegister<Port, ReadWrite, mem_width> out;
                template<typename L> 
				struct address;
            };

			template<uint8_t number>
			struct SPI_Port;

			struct SPI
			{
				SPI() = delete;
				//0 wegen define names 
				enum class spcr : mem_width {
					SPIE0 = (1 << SPIE), 
					SPE0 = (1 << SPE),
					DORD0 = (1 << DORD),
					MSTR0 = (1 << MSTR),
					CPOL0 = (1 << CPOL),
					CPHA0 = (1 << CPHA),
					SPR01 = (1 << SPR1),
					SPR00 = (1 << SPR0)
				};

				enum class spsr : mem_width {
					SPIF0  = (1 << SPIF),
					WCOL0  = (1 << WCOL),
					SPI2X0 = (1 << SPI2X)
				};

				enum class Pins : mem_width {
					SS = 2,
					Mosi = 3,
					Miso = 4,
					SCK = 5
				};

				ControlRegister<SPI, spcr, mem_width> Spcr;
				ControlRegister<SPI, spsr, mem_width> Spsr;
				DataRegister<SPI, ReadWrite, mem_width> Spdr;
				template<mem_width N> struct address;
			};


            struct Timer8Bit {
                static constexpr const mem_width count = 2;
                typedef mem_width value_type;
                enum class TCCRA : mem_width {
                    coma0 = (1 << COM0A0),
                    coma1 = (1 << COM0A1),
                    comb0 = (1 << COM0B0),
                    comb1 = (1 << COM0B1),
                    wgm0 = (1 << WGM00),
                    wgm1 = (1 << WGM01)
                };
                ControlRegister<Timer8Bit, TCCRA> tccra;
                enum class TCCRB : mem_width {
                    foca = (1 << FOC0A),
                    focb = (1 << FOC0B),
                    wgm2 = (1 << WGM02),
                    cs2 = (1 << CS02),
                    cs1 = (1 << CS01),
                    cs0 = (1 << CS00),
                };
                
                ControlRegister<Timer8Bit, TCCRB> tccrb;
                DataRegister<Timer8Bit, ReadWrite, mem_width> tcnt;
                DataRegister<Timer8Bit, ReadWrite, mem_width> ocra;
				DataRegister<Timer8Bit, ReadWrite, mem_width> ocrb;
                template<int N> struct address;
            };

			struct ADConverter {
				static constexpr const mem_width count = 1;
				typedef mem_width value_type;

				DataRegister<ADConverter, ReadOnly, mem_width> adch;
				DataRegister<ADConverter, ReadOnly, mem_width> adcl;

				enum class ADCsra : mem_width {
					aden = (1 << ADEN),
					adsc = (1 << ADSC),
					adfr = (1 << ADATE),
					adif = (1 << ADIF),
					adie = (1 << ADIE),
					adps2 = (1 << ADPS2),
					adps1 = (1 << ADPS1),
					adps0 = (1 << ADPS0),
				};

				ControlRegister<ADConverter, ADCsra> adcsra;

				enum class ADCsrb : mem_width {
					acme = (1 << ACME),
					adts2 = (1 << ADTS2),
					adts1 = (1 << ADTS1),
					adts0 = (1 << ADTS0),
				};

				ControlRegister<ADConverter, ADCsrb> adcsrb;

				enum class ADMux : mem_width {
					refs1 = (1 << REFS1),
					refs0 = (1 << REFS0),
					adlar = (1 << ADLAR),
					mux3 = (1 << MUX3),
					mux2 = (1 << MUX2),
					mux1 = (1 << MUX1),
					mux0 = (1 << MUX0),
				};
				ControlRegister<ADConverter, ADMux> admux;

				DataRegister<ADConverter, UnUsed, mem_width> reserved;

				enum class DigitalInputDisable : mem_width {
					adc7d = (1 << 7),
					adc6d = (1 << 6),
					adc5d = (1 << 5),
					adc4d = (1 << 4),
					adc3d = (1 << 3),
					adc2d = (1 << 2),
					adc1d = (1 << 1),
					adc0d = (1 << 0),
				};

				ControlRegister<ADConverter, ADMux> didr0;

				template<int N> struct address;
			};
        
        } __attribute__((packed));	  // -> elemente bleiben geordnet
        

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

		//SPI
		template<>
		struct ATMega328::SPI::address<0>
		{
			static constexpr uintptr_t value = 0x4C;
		};

		template<>
		struct ATMega328::SPI_Port<0>{
			using Port = B;
		};

		//ADC
		template<>
		struct ATMega328::ADConverter::address<0> {
			static constexpr uintptr_t value = 0x78;
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

