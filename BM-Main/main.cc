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
	volatile uintptr_t* PortB = (uintptr_t*)0x25;
	while (true) {
		volatile uintptr_t* pbadr = (uintptr_t*)BMCPP::AVR::getAddress<BMCPP::AVR::ATMega328::Port, BMCPP::AVR::B>();
		//using outB = BMCPP::Hal::Port<BMCPP::Hal::Output,BMCPP::AVR::ATMega328::Port>;
		*pbadr ^= (1 << 3);
		_delay_ms(500);
	}
	return 0;
}															   