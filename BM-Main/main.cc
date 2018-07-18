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
#include "uart.c"
#include <stdlib.h>

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

int main(){
	
	//constexpr int x = static_cast<uint8_t>(~16) & 16;
	// START DEBUG
	//LcdInit();
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
	//using adc = BMCPP::Hal::ADConverter<>;
	
	//spi0::init<outB>();
	//uint8_t tesst = 'a';
	//spi0::init<outB>();

	/*LcdChr(LcdFontSize::FONT_2X, 'A');
	LcdUpdate();
	LcdChr(LcdFontSize::FONT_2X, 'B');*/
	uart_init(UART_BAUD_SELECT(9600, F_CPU));
	initADC();
	//adc c;
	//BMCPP::Hal::ADConverter* t = BMCPP::Hal::ADConverter::create<>();
	int a;
	char str[16];

	//c.startChannels<1>();
	BMCPP::Hal::ADConverter t;

	LcdClear();
	//printChar(2);
	//printStr("FAM");
	printStr("scheiss Lyroit");
	newLine();
	printStr("Neises Nokia");
	newLine();
	newLine();
	printStr("101010");

	while (true) {
		//a = c.getValue<1>();
		a = t.getValue<0>();
		itoa(a, str, 10);
		uart_puts(str);
		uart_puts("\n\r");
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

/*ISR(ADC_vect)
{
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