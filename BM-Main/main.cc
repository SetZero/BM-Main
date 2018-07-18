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

using hardware_adc = BMCPP::Hal::Hardware_Adc<0>;
using adc = BMCPP::Hal::ADConverter<hardware_adc>;
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


int main(){
	
	//constexpr int x = static_cast<uint8_t>(~16) & 16;
	// START DEBUG
	using display = PCD_8544<0,rst_pin,ce_pin,dc_pin, BMCPP::Hal::SPI, BMCPP::Hal::Port, BMCPP::Hal::Pin>;
	display::init();
	display::printStr("Display");
	display::newLine();
	display::printStr("Working");

	uart_init(UART_BAUD_SELECT(9600, F_CPU));
	//initADC();
	//adc c;
	//BMCPP::Hal::ADConverter* t = BMCPP::Hal::ADConverter::create<>();
	uart_puts("Test");
	//c.startChannels<1>();
	adc::init();
	adc::create<0>();

	//LcdClear();
	//printChar(2);
	//printStr("FAM");
	//printStr("scheiss Lyroit");
	//newLine();
	//printStr("Neises Nokia");
	//newLine();
	//newLine();
	//printStr("101010");
	int a = 0;

	while (true) {
		uint16_t a = adc::getValue<0>();//static_cast<uint8_t>(sra::adsc);
		char str[32];
		itoa(a, str, 10);
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

		//volatile uintptr_t* pbadr = ((uintptr_t*)getAddress<ATMega328::Port,B>());
		//test ^= (1 << 5);
		//*pbadr ^= (1 << 5);

		//_delay_ms(500);
	}
	return 0;
}				

ISR(ADC_vect)
{
	adc::writeResults();
	ADCSRA |= (1 << ADSC);
	//adc::create<0>();
}