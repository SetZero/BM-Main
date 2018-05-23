#pragma once
#ifndef __AVR_ATmega328P__
	#define __AVR_ATmega328P__
#endif // !__AVR_ATmega328P__
#include <avr/io.h>
#include <stdint.h>
#include "mega328.h"
#include "AVR_concepts.h"

using namespace BMCPP;
using namespace AVR;

constexpr uint8_t MOSI = 5;
constexpr uint8_t MISO = 6;
constexpr uint8_t SCK = 7;
constexpr uint8_t LSBFIRST_MASK = 0b00000001;
constexpr uint8_t MASTER_MASK = 0b00000001;
constexpr uint8_t MODE_MASK = 0b00000011;
constexpr uint8_t SPEED_MASK = 0b00000011;
constexpr uint8_t DBLCLK_MASK = 0b00000001;

//initialize the SPI bus
//  uint8_t lsbfirst - if 0: most significant bit is transmitted first
//  uint8_t master - if 1: use master mode, if 0: slave mode is used
//  uint8_t mode - sets the transfer mode:
//                 mode   leading clock edge   trailing clock edge
//                 -----------------------------------------------
//                 0      sample (rising)      setup  (falling)
//                 1      setup  (rising)      sample (falling)
//                 2      sample (falling)     setup  (rising)
//                 3      setup  (falling)     sample (rising)
//  uint8_t clkrate - spi bus clock rate, valid speeds are 0-3
//                    rate   speed
//                    ------------
//                    0      CPUCLK/4
//                    1      CPUCLK/16
//                    2      CPUCLK/64
//                    3      CPUCLK/128
//  uint8_t dblclk - if 1: doubles the SPI clock rate in master mode
//  EXAMPLE: spi_init(0, 1, 0, 3, 0)


namespace spi {
	enum class Mode : uint8_t {
		m0 = 0,
		m1 = 1,
		m2 = 2,
		m3 = 3
	};

	enum class ClkRate : uint8_t {
		clkRateDiv4 = 0,
		clkRateDiv16 = 1,
		clkRateDiv64 = 2,
		clkRateDiv128 = 3
	};


	//maybe: another template as parameter -> containing port and constants informations (remove defines)
	template<typename MicroController,Mode mode, ClkRate clockRate, uintptr_t portAddress, uintptr_t ddrAddress, bool Master = true, bool lsbfirst = true, bool doubleSpeed = true >
	struct SPI
	{
		using UC = MicroController;
		static_assert(isUC<UC>(),"typename UC is not a Microcontroller");
		inline static constexpr  uintptr_t port = portAddress | (1 << MISO);
		inline static constexpr uintptr_t ddr = (ddrAddress | (((1 << MOSI) | (1 << SCK)))) 	  // set outputs
			& ~(1 << MISO);			 //set inputs
		static constexpr uint8_t master = Master ? 1 : 0;
		static constexpr uint8_t lsbFirst = lsbfirst ? 1 : 0;
		static constexpr uint8_t dblclk = doubleSpeed ? 1 : 0;
		static constexpr uint8_t modeB = static_cast<uint8_t> (mode);
		static constexpr uint8_t clockRateB = static_cast<uint8_t> (clockRate);
		static constexpr uint8_t spcr = (
			(static_cast<uint8_t>(UC::SPI::spcr::SPE0)) | //enable SPI
			((lsbFirst & LSBFIRST_MASK) | static_cast<uint8_t>(UC::SPI::spcr::DORD0)) | //set msb/lsb ordering
			((master & MASTER_MASK) | static_cast<uint8_t>(UC::SPI::spcr::MSTR0)) | //set master/slave mode
			((modeB & MODE_MASK) | static_cast<uint8_t>(UC::SPI::spcr::CPHA0)) | //set mode
			(clockRateB & SPEED_MASK | static_cast<uint8_t>(UC::SPI::spcr::SPR00)) //set speed
			);
		static constexpr uint8_t clockspeed = ((dblclk&DBLCLK_MASK) | static_cast<uint8_t>(UC::SPI::spsr::SPI2X0));
		//static volatile constexpr auto spcr = SPCR
		//set outputs
		//constexpr ddr |= ((1 << MOSI) | (1 << SCK));
		//set inputs
		//constexpr ddr &= ~(1 << MISO);
		//constexpr port |= (1 << MISO); //turn on pull-up resistor
							  //set SPI control register

		static void init() {
			volatile uintptr_t* spcr_adr = (uintptr_t*)getAddress<typename UC::SPI, Spcr<0>>();
			*spcr_adr = spcr;
			volatile uintptr_t* spsr_adr = (uintptr_t*)getAddress<typename UC::SPI, Spsr<0>>();
			//set double speed bit
			*spsr_adr = clockspeed;
		}

		//shifts out 8 bits of data
		//  uint8_t data - the data to be shifted out
		//  returns uint8_t - the data received during sending
		static uintptr_t spi_send(uintptr_t value) {
			volatile uintptr_t* spdr_adr = (uintptr_t*)getAddress<typename UC::SPI, Spdr<0>>();
			uintptr_t result;
			volatile uintptr_t* spsr_adr = (uintptr_t*)getAddress<typename UC::SPI, Spsr<0>>();
			//shift the first byte of the value
			*spdr_adr = value;
			//wait for the SPI bus to finish
			while (!(*spsr_adr | (static_cast<uint8_t>(UC::SPI::spsr::SPIF0))));
			//get the received data
			result = *spdr_adr;

			return result;
		}
	};
}