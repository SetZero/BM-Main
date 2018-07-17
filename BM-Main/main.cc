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
#include "spi_hal.h"
#include "pcd8544.h"

using namespace BMCPP;
using namespace AVR;

int main(){
	
	//constexpr int x = static_cast<uint8_t>(~16) & 16;
	// START DEBUG
	LcdInit();
	//LcdContrast(0x3A);
	// END DEBUG
	//using spi0 = Hal::SPI<0,Hal::spi::ClkRate::clkRateDiv4>;
	//spi0::init<BMCPP::Hal::Port<BMCPP::AVR::B>>();
	//MFRC522<>::mfrc522_init<BMCPP::Hal::Port<BMCPP::AVR::B>>();
	//DDRB |= (1 << PB5);
	//volatile uint8_t& test = outB::get();
	/*
	using pinb5 = BMCPP::Hal::Pin<outB, 5>;
	pinb5::dir<BMCPP::Hal::Input>();
	using pinb4 = BMCPP::Hal::Pin<outB, 4>;
	pinb4::dir<BMCPP::Hal::Output>();
	using pinb3 = BMCPP::Hal::Pin<outB, 3>;
	pinb3::dir<BMCPP::Hal::Output>();
	//auto x = BMCPP::Hal::SPI<0>::spcr();
	MFRC522<>::mfrc522_init<outB>();	*/
	
	//spi0::init<outB>();
	//uint8_t tesst = 'a';
	//spi0::init<outB>();

	LcdChr(LcdFontSize::FONT_2X, 'A');
	LcdUpdate();
	LcdChr(LcdFontSize::FONT_2X, 'B');
	LcdClear();
	loop();
	while (true) {
		
		//spi0::readWriteSingle(22);
		//spi::spi_transmit_sync(&tesst, 1);
		//spi0::spi_send('a');
		//spi0::spi_send('\n');
		
		//pinb3::on();  

		//uart_puts(reinterpret_cast<char*>(serialOut));
		//uart_puts("test");
		//uart_puts("TEST");
		//volatile uintptr_t* pbadr = ((uintptr_t*)getAddress<ATMega328::Port,B>());
		//test ^= (1 << 5);
		//*pbadr ^= (1 << 5);

		//_delay_ms(500);
		//spi0::spi_send(0);
		//pinb3::off();
	}
	return 0;
}															   