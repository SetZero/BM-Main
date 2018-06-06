#pragma once
#ifndef __AVR_ATmega328P__
	#define __AVR_ATmega328P__
#endif // !__AVR_ATmega328P__
#include <avr/io.h>
#include <stdint.h>
#include "mega328.h"
#include "AVR_concepts.h"
#include "hal\port.h"
#include "uart.h"

using namespace BMCPP;
using namespace AVR;

constexpr uint8_t MOSI = (1<<5);
constexpr uint8_t MISO = (1<<6);
constexpr uint8_t SCK = (1<<7);
constexpr uint8_t LSBFIRST_MASK = 0b00000001;
constexpr uint8_t MASTER_MASK = 0b00000001;
constexpr uint8_t MODE_MASK = 0b00000011;
constexpr uint8_t SPEED_MASK = 0b00000011;
constexpr uint8_t DBLCLK_MASK = 0b00000001;

static volatile uint8_t data = 0;

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

#define PORT_SPI    PORTB
#define DDR_SPI     DDRB
#define DD_MISO     DDB4
#define DD_MOSI     DDB3
#define DD_SS       DDB2
#define DD_SCK      DDB5


	void spi0_init()
		// Initialize pins for spi communication
	{
		DDR_SPI &= ~((1 << DD_MOSI) | (1 << DD_MISO) | (1 << DD_SS) | (1 << DD_SCK));
		// Define the following pins as output
		DDR_SPI |= ((1 << DD_MOSI) | (1 << DD_SS) | (1 << DD_SCK));

		SPCR = ((1 << SPE) |               // SPI Enable
			(1 << SPIE) |              // SPI Interupt Enable
			(0 << DORD) |              // Data Order (0:MSB first / 1:LSB first)
			(1 << MSTR) |              // Master/Slave select   
			(0 << SPR1) | (1 << SPR0) |    // SPI Clock Rate
			(0 << CPOL) |              // Clock Polarity (0:SCK low / 1:SCK hi when idle)
			(0 << CPHA));             // Clock Phase (0:leading / 1:trailing edge sampling)

		SPSR = (1 << SPI2X);              // Double Clock Rate
	}

	void spi_transfer_sync(uint8_t * dataout, uint8_t * datain, uint8_t len)
		// Shift full array through target device
	{
		uint8_t i;
		for (i = 0; i < len; i++) {
			SPDR = dataout[i];
			while ((SPSR & (1 << SPIF)) == 0);
			datain[i] = SPDR;
		}
	}

	void spi_transmit_sync(uint8_t * dataout, uint8_t len)
		// Shift full array to target device without receiving any byte
	{
		uint8_t i;
		for (i = 0; i < len; i++) {
			SPDR = dataout[i];
			while ((SPSR & (1 << SPIF)) == 0);
		}
	}

	uint8_t spi_fast_shift(uint8_t data)
		// Clocks only one byte to target device and returns the received one
	{
		SPDR = data;
		while ((SPSR & (1 << SPIF)) == 0);
		return SPDR;
	}
	//
	template<Mode mode, ClkRate clockRate, bool Master = true, bool lsbfirst = true, bool doubleSpeed = true, typename MicroController = __DEFAULT_MMCU__ >
	//requires isUC<MicroController>()	-> moved to static assert (syntax highlighting)
	struct SPI {
		using UC = MicroController;
		static_assert(isUC<UC>(),"typename MicroController is not a Microcontroller");
		static constexpr volatile uint8_t& scr_adr = Hal::Port<B>::get();
		static constexpr uint8_t master = Master ? 1 : 0;
		static constexpr uint8_t lsbFirst = lsbfirst ? 1 : 0;
		static constexpr uint8_t dblclk = doubleSpeed ? 1 : 0;
		static constexpr uint8_t modeB = static_cast<uint8_t> (mode);
		static constexpr uint8_t clockRateB = static_cast<uint8_t> (UC::ClkRate);
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

		template<typename Port, uint8_t spiNumber = 0>
		static void init() {
			static_assert(BMCPP::AVR::isPort<Port>(), "typename Port is not a Port!");
			
			Port::get() |= MISO;
			Port::ddr() |= (MOSI | SCK) 	  // set outputs
						& ~(MISO);			 //  set inputs
			using Spcr = BMCPP::Hal::SPI<spiNumber>;
			volatile typename UC::mem_width* spcr_adr = 
				(typename UC::mem_width*)BMCPP::Hal::SPI<0>::spcr();
			Spcr::setSpcr(spcr);
			volatile typename UC::mem_width* spsr_adr = (typename UC::mem_width*)BMCPP::Hal::SPI<0>::spsr();
			//set double speed bit
			SPSR = clockspeed;
		}

		//shifts out 8 bits of data
		//  uint8_t data - the data to be shifted out
		//  returns uint8_t - the data received during sending
		static typename UC::mem_width spi_send(typename UC::mem_width value) {
			//volatile typename UC::mem_width& spdr_adr = (typename UC::mem_width*)/*BMCPP::Hal::SPI<0>::spdr()*/SPDR;
			//uart_putc(static_cast<char>(value));
			//uart_putc(static_cast<char>(value));
			//uart_putc(spcr);
			typename UC::mem_width result;
			//volatile typename UC::mem_width* spsr_adr = (typename UC::mem_width*)/*BMCPP::Hal::SPI<0>::spsr()*/SPSR;
			//shift the first byte of the value
			SPDR = value;
			//wait for the SPI bus to finish
			while (!(SPSR | (static_cast<uint8_t>(UC::SPI::spsr::SPIF0))));
			//get the received data
			result = SPDR;
			return result;
		}
	};
}