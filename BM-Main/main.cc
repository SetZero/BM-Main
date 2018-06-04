//#include "PortB.h"
#ifndef __AVR_ATmega328P__
	#define __AVR_ATmega328P__
#endif // !__AVR_ATmega328P__


#include <avr\io.h>
#include <util\delay.h>
#include <avr/interrupt.h>
#include "Utils\Utils.h"
#include "mega328.h"
#include "hal\port.h"
#include "SPI.h"
#include "Mfrc522.h"
#include "uart.c"
#include "ADC.h"

using namespace BMCPP;
using namespace AVR;

int main(){
	// START DEBUG
	uart_init(UART_BAUD_SELECT(9600, F_CPU));
	sei();
	// END DEBUG
	//using spi0 = spi::SPI<spi::Mode::m0, spi::ClkRate::clkRateDiv4>;
	//spi0::init<BMCPP::Hal::Port<BMCPP::AVR::B>>();
	//MFRC522<>::mfrc522_init<BMCPP::Hal::Port<BMCPP::AVR::B>>();
	DDRB |= (1 << PB5);
	using outB = BMCPP::Hal::Port<AVR::B>;
	//volatile uint8_t& test = outB::get();
	using pinb5 = BMCPP::Hal::Pin<outB, 5>;
	pinb5::dir<BMCPP::Hal::Input>();
	using pinb4 = BMCPP::Hal::Pin<outB, 4>;
	pinb4::dir<BMCPP::Hal::Output>();
	using pinb3 = BMCPP::Hal::Pin<outB, 3>;
	pinb3::dir<BMCPP::Hal::Output>();
	//auto x = BMCPP::Hal::SPI<0>::spcr();
	MFRC522<>::mfrc522_init<outB>();
	uint8_t serialOut[4]{0,0,0,0};
	while (true) {

		pinb3::on();

		if (MFRC522<>::mfrc522_get_card_serial<RFID::MifareOne>(serialOut) != ErrorType::ERROR && (serialOut[0] > 0 || serialOut[1] > 0 || serialOut[2] > 0 || serialOut[3] > 0)) {
			uart_puts(reinterpret_cast<char*>(serialOut));
		}

		//uart_puts(reinterpret_cast<char*>(serialOut));
		//uart_puts("test");
		//uart_puts("TEST");
		//volatile uintptr_t* pbadr = ((uintptr_t*)getAddress<ATMega328::Port,B>());
		//test ^= (1 << 5);
		//*pbadr ^= (1 << 5);

		//_delay_ms(500);
		//spi0::spi_send(0);
		pinb3::off();
	}
	return 0;
}															   