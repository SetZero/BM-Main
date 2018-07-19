#pragma once
#include "mega328.h"

//currently the only available MMCU in this great library
#ifdef __AVR_ATmega328P__
#define __DEFAULT_MMCU__ BMCPP::AVR::ATMega328
#else
#define	 __DEFAULT_MMCU__ void
#endif // __AVR_ATmega328P__