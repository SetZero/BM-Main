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
#include "4X4_KeyPad.h"
//#include "ADC.h"
//#include "uart.c"
#include <stdlib.h>


using hardware_adc = BMCPP::Hal::Hardware_Adc<0>;
using adc = BMCPP::Hal::ADConverter<hardware_adc>;

//using namespace BMCPP;
//using namespace AVR;

char getkey();
unsigned char KEYPAD_ScanKey();
int main(){
	using keypadPort = BMCPP::Hal::Port<D>;
	using keypad = KeyPad<keypadPort>;
	//constexpr int x = static_cast<uint8_t>(~16) & 16;
	// START DEBUG
	keypad::init();
	using display = PCD_8544<0,rst_pin,ce_pin,dc_pin, BMCPP::Hal::SPI, BMCPP::Hal::Port, BMCPP::Hal::Pin>;
	display::init();
	display::printChar(yPtr+32);
	display::newLine();
	display::printChar(yPtr+32);
	display::newLine();
	display::printChar(yPtr + 32);
	display::newLine();
	display::printChar(yPtr + 32);
	display::newLine();
	display::printChar(yPtr + 32);
	display::newLine();
	display::printChar(yPtr + 32);
	display::newLine();
	display::printChar(yPtr + 32);
	display::clear();
	display::LcdRect();
	constexpr int zzzz = 'P';

	/*LcdChr(LcdFontSize::FONT_2X, 'A');
	LcdUpdate();
	LcdChr(LcdFontSize::FONT_2X, 'B');*/
	uart_init(UART_BAUD_SELECT(9600, F_CPU));
	sei();
	//initADC();
	//adc c;
	//BMCPP::Hal::ADConverter* t = BMCPP::Hal::ADConverter::create<>();
	uart_puts("Test");
	//c.startChannels<1>();
	adc::init();
	adc::create<0>();

	char xy,prevkey = -1;
	bool firstKey = true; //awkward things happening -> 1 is always pressed when first entered
	int a = 0;
	while (true) {
			
		xy = keypad::getKey();
		if ( xy != 'z' && xy != prevkey && !firstKey) {
			prevkey = xy;
			display::clear();
			display::printChar(xy);
		}		
		firstKey = false;
		//a = c.getValue<1>();
		//a = t.getValue<0>();
		//itoa(a, str, 10);
		//uart_puts(str);
		//uart_puts("\n\r");
		uint16_t a = adc::getValue<0>();//static_cast<uint8_t>(sra::adsc);
		uint16_t b = adc::getValue<1>();//static_cast<uint8_t>(sra::adsc);
		char str[32];
		itoa(a, str, 10);
		uart_puts(str);
		uart_puts(" | ");
		itoa(b, str, 10);
		uart_puts(str);
		uart_puts("\n\r");
		
		//a = c.getValue<1>();
		//a = adc::getValue<0>();
		//uart_puts(reinterpret_cast<char*>(a));
		//itoa(a, str, 10);
		//uart_puts(str);
		//uart_puts("\n\r");
		//spi0::readWriteSingle(22);
		//spi::spi_transmit_sync(&tesst, 1);
		//spi0::spi_send('a');
		//spi0::spi_send('\n');
		
		//pinb3::on();  

		//uart_puts(reinterpret_cast<char*>(serialOut));
		//uart_puts("\n\r");
		//_delay_ms(500);

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

ISR(ADC_vect)
{
	adc::writeResults();

	//ADCSRA |= (1 << ADSC);
}