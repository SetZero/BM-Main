//#include "PortB.h"
#ifndef __AVR_ATmega328P__
	#define __AVR_ATmega328P__
#endif // !__AVR_ATmega328P__

#include <avr\io.h>
#include <util\delay.h>
#include "Utils\Utils.h"
#include "mega328.h"
#include "SPI.h"


using namespace BMCPP;
using namespace AVR;

int main(){
	constexpr bool x = utils::isEqual<int, int>::value;
	using s = utils::conditional<x, long, double>::type;
	static_assert(utils::isEqual<s, long>::value, "?");
	constexpr double c1 = utils::integralConstant<int, 3>::value;
	constexpr double c2 = utils::integralConstant<int, 4>::value;
	constexpr bool t = c1 < c2;
	static_assert(t, "c1 was >= c2");
	using erg = utils::minRequired<420>::type;
	using spiComp = SPI<Mode::m0, ClkRate::clkRateDiv4,0x2b,0x2C>;
	constexpr bool tttt = utils::isEqual<erg, short>::value;
	static_assert(tttt, "??");
	return 0;
}															   