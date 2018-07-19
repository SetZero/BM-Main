#pragma once
#include <avr\pgmspace.h>

namespace BMCPP {
	namespace Utils {
		class Menu {
			struct MenuSpot {
				const char* PROGMEM name;
				auto function;
			};
		};
	}
}