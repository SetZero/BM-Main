#pragma once
#ifndef __AVR_ATmega328P__
	#define __AVR_ATmega328P__
#endif // !__AVR_ATmega328P__
#include <avr/io.h>
#include "mega328.h"

using namespace BMCPP;
using namespace AVR;

//TODO get PORT via the UC class
uintptr_t* port = (uintptr_t*)(ATmega328_SPI_DataRegister::portb); //0x25
uintptr_t* ddr = (uintptr_t*)(ATmega328_SPI_DataDirectionRegister::ddrb);
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
void spi_init(uint8_t lsbfirst,
	uint8_t master,
	uint8_t mode,
	uint8_t clkrate,
	uint8_t dblclk) {
	//set outputs
	*ddr |= ((1 << MOSI) | (1 << SCK));
	//set inputs
	*ddr &= ~(1 << MISO);
	*port |= (1 << MISO); //turn on pull-up resistor
									 //set SPI control register
	SPCR = (
		(1 << SPE) | //enable SPI
		((lsbfirst & LSBFIRST_MASK) << DORD) | //set msb/lsb ordering
		((master & MASTER_MASK) << MSTR) | //set master/slave mode
		((mode & MODE_MASK) << CPHA) | //set mode
		(clkrate & SPEED_MASK << SPR0) //set speed
		);
	//set double speed bit
	SPSR = ((dblclk&DBLCLK_MASK) << SPI2X);
}


struct SPI
{
//shifts out 8 bits of data
//  uint8_t data - the data to be shifted out
//  returns uint8_t - the data received during sending
uint8_t spi_send(uint8_t value) {
	uint8_t result;

	//shift the first byte of the value
	SPDR = value;
	//wait for the SPI bus to finish
	while (!(SPSR & (1 << SPIF)));
	//get the received data
	result = SPDR;

	return result;
}

};