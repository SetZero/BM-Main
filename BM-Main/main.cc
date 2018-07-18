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
#include "ADC.h"
//#include "uart.c"
#include <stdlib.h>

using namespace BMCPP;
using namespace AVR;
using namespace Hal;

using rst_pin = typename BMCPP::Hal::Pin<typename BMCPP::Hal::Port<typename BMCPP::AVR::B>, 2>;
using ce_pin = typename BMCPP::Hal::Pin<typename BMCPP::Hal::Port<typename BMCPP::AVR::B>, 1>;
using dc_pin = typename BMCPP::Hal::Pin<typename BMCPP::Hal::Port<typename BMCPP::AVR::B>, 0>;

//using namespace BMCPP;
//using namespace AVR;
volatile uint16_t adc_result[2];

uint8_t currentChannel = 0;
uint8_t channel_sel = 0;
void initADC(void) {
	ADMUX |= (1 << REFS0);					//REF voltage
	ADCSRA |= (1 << ADPS1) | (1 << ADPS0);	//ADC clockprescale /8
	ADCSRA |= (1 << ADEN) | (1 << ADIE);		//Enable + Interrupt
	sei();									//be sure to enable interrupts
	ADCSRA |= (1 << ADSC);					//Start 1st conversion
}

uint16_t getAdcValue(void) {
	return adc_result[currentChannel];
}


char getkey();

int main(){

	//constexpr int x = static_cast<uint8_t>(~16) & 16;
	// START DEBUG
	using display = PCD_8544<0,rst_pin,ce_pin,dc_pin, BMCPP::Hal::SPI, BMCPP::Hal::Port, BMCPP::Hal::Pin>;
	display::init();
	display::LcdRect();
	display::printStr(" first menue");
	display::newLine();
	display::printStr(" second menue");

	//uart_init(UART_BAUD_SELECT(9600, F_CPU));
	//initADC();
	//adc c;
	//BMCPP::Hal::ADConverter* t = BMCPP::Hal::ADConverter::create<>();
	//int a;
	//char str[16];

	//c.startChannels<1>();
	//BMCPP::Hal::ADConverter t;

	char xy;
	while (true) {
		DDRD = 0xF0;//taking column pins as input and row pins as output

		_delay_ms(1);

		PORTD = 0x0F;// powering the row ins

		_delay_ms(1);
		xy = getkey();
		if ( xy != 0) {
			display::clear();
			display::printChar(xy);
		}
		//a = c.getValue<1>();
		//a = t.getValue<0>();
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

		//volatile uintptr_t* pbadr = ((uintptr_t*)getAddress<ATMega328::Port,B>());
		//test ^= (1 << 5);
		//*pbadr ^= (1 << 5);

		//_delay_ms(500);
	}
	return 0;
}				

char getkey() {
	if (PIND != 0b11110000)//in any of column pins goes high execute the loop
	{

		_delay_ms(5);

		auto keypressed = PIND;//taking the column value into integer

		DDRD ^= 0b11111111;//making rows as inputs and columns as ouput

		_delay_ms(1);

		PORTD ^= 0b11111111;//powering columns

		_delay_ms(1);



		keypressed |= PIND; //taking row value and OR ing it to column value



		if (keypressed == 0xed)

		{

			return '1';

		}

		if (keypressed == 0b00010010)

		{

			return '4';

		}

		if (keypressed == 0b00010100)

		{

			return '7';

		}

		if (keypressed == 0b00011000)

		{

			return '*';

		}



		if (keypressed == 0b00100001)

		{

			return '2';

		}

		if (keypressed == 0b00100010)

		{

			return '5';

		}

		if (keypressed == 0b00100100)

		{

			return '8';

		}

		if (keypressed == 0b00101000)

		{

			return '0';

		}

		if (keypressed == 0b01000001)

		{

			return '3';

		}

		if (keypressed == 0b01000010)

		{

			return '6';

		}

		if (keypressed == 0b01000100)

		{

			return '9';

		}

		if (keypressed == 0b01001000)

		{

			return '#';;

		}

		if (keypressed == 0b10000001)

		{

			return 'A';

		}

		if (keypressed == 0b10000010)

		{

			return 'B';

		}

		if (keypressed == 0b10000100)

		{

			return 'C';

		}

		if (keypressed == 0b10001000)

		{

			return 'D';

		}

		DDRD ^= 0b11111111;//shifting input and power port

		_delay_ms(1);

		PORTD ^= 0b11111111;//powering row pins of keypad

		_delay_ms(110);
		return keypressed;

	}
	return 0;
}

/*ISR(ADC_vect) {
	// Save conversion result.
	adc_result[channel_sel] = ADC;

	if (channel_sel == 1) {
		ADMUX &= ~(1 << MUX0);
		channel_sel = 0;
	}
	else {
		ADMUX |= (1 << MUX0);
		channel_sel = 1;
	}

	// Start the next conversion.
	ADCSRA |= (1 << ADSC);
}*/