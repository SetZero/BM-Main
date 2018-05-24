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


using namespace BMCPP;
using namespace AVR;


int main(){
	/*
	constexpr bool x = utils::isEqual<int, int>::value;
	using s = utils::conditional<x, long, double>::type;
	static_assert(utils::isEqual<s, long>::value, "?");
	constexpr double c1 = utils::integralConstant<int, 3>::value;
	constexpr double c2 = utils::integralConstant<int, 4>::value;
	constexpr bool t = c1 < c2;
	static_assert(t, "c1 was >= c2");

	using erg = utils::minRequired<420>::type;
	static_assert(utils::sameTypes<int, int, int>(), "");
	using spiComp = SPI<Mode::m0, ClkRate::clkRateDiv4,0x2b,0x2C>;
	constexpr bool tttt = utils::isEqual<erg, short>::value;
	static_assert(tttt, "??");	 */
	//volatile uintptr_t* PortB = (uintptr_t*)0x25;
	//using spi0 = spi::SPI<BMCPP::AVR::ATMega328,spi::Mode::m0, spi::ClkRate::clkRateDiv4>;
	//spi0::init((uintptr_t*)0x25, (uintptr_t*)0x26);
	DDRB |= (1 << PB5);
	while (true) {
		//volatile uintptr_t* pbadr = ((uintptr_t*)getAddress<ATMega328::Port,B>());
		using outB = BMCPP::Hal::Port<AVR::B>;
	    outB::get();
		//*pbadr ^= (1 << 5);
		_delay_ms(500);
		//spi0::spi_send(0);
	}
	return 0;
}															   