//#include "PortB.h"
#ifndef __AVR_ATmega328P__
	#define __AVR_ATmega328P__
#endif // !__AVR_ATmega328P__


#include <avr\io.h>
#include <util\delay.h>
#include "Utils\Utils.h"
#include "mega328.h"
#include "hal\port.h"
#include "SPI.h"
#include "Mfrc522.h"


using namespace BMCPP;
using namespace AVR;

int main(){
	using spi0 = spi::SPI<spi::Mode::m0, spi::ClkRate::clkRateDiv4>;
	spi0::init<BMCPP::Hal::Port<BMCPP::AVR::B>>();
	MFRC522<>::mfrc522_init<BMCPP::Hal::Port<BMCPP::AVR::B>>();
	DDRB |= (1 << PB5);
	using outB = BMCPP::Hal::Port<AVR::B>;
	volatile uint8_t& test = outB::get();
	using pinb3 = BMCPP::Hal::Pin<outB, 3>;
	pinb3::dir<BMCPP::Hal::Output>();
	auto x = BMCPP::Hal::SPI<0>::spcr();
	
	while (true) {
		//volatile uintptr_t* pbadr = ((uintptr_t*)getAddress<ATMega328::Port,B>());
		test ^= (1 << 5);
		//*pbadr ^= (1 << 5);
		_delay_ms(500);
		//spi0::spi_send(0);
	}
	return 0;
}															   