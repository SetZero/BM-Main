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
#include "adc/ADC.h"
//#include "uart.c"
#include "Utils/literals.h"
#include "Utils/menu.h"
#include <stdlib.h>

using namespace BMCPP;
using namespace AVR;
using namespace Hal;
using namespace BMCPP::literals;

using rst_pin = typename BMCPP::Hal::Pin<typename BMCPP::Hal::Port<typename BMCPP::AVR::B>, 2>;
using ce_pin = typename BMCPP::Hal::Pin<typename BMCPP::Hal::Port<typename BMCPP::AVR::B>, 1>;
using dc_pin = typename BMCPP::Hal::Pin<typename BMCPP::Hal::Port<typename BMCPP::AVR::B>, 0>;


using hardware_adc = BMCPP::Hal::Hardware_Adc<0>;
using adc = BMCPP::Hal::ADConverter<hardware_adc>;

//using namespace BMCPP;
//using namespace AVR;

void print_num(int i)
{
	__asm("nop");
}

int main(){
	using keypadPort = BMCPP::Hal::Port<D>;
	using keypad = Hal::KeyPad<keypadPort>;
	//constexpr int x = static_cast<uint8_t>(~16) & 16;
	// START DEBUG
	keypad::init();
	using display = PCD_8544<0,rst_pin,ce_pin,dc_pin, BMCPP::Hal::SPI, BMCPP::Hal::Port, BMCPP::Hal::Pin>;
	using menu = BMCPP::Utils::Menu<display>;

	//menu::init();
	/*menu::create_entry<0>("Hello World!");
	menu::create_entry<1>("Test World!");
	menu::create_entry<2>("Welcome World!");
	menu::create_entry<3>("Tea World!");
	menu::create_entry<4>("Lambda World!");*/
	

	//uart_init(UART_BAUD_SELECT(9600, F_CPU));




	/*display::printStr("B");
	display::init();
	uart_init(UART_BAUD_SELECT(9600, F_CPU));
	sei();
	display::printStr("B");
	display::newLine();
	display::printStr("M");
	display::newLine();
	display::printStr("C");
	display::newLine();
	display::printStr("P");
	display::newLine();
	display::printStr("P");
	display::newLine();
	display::printStr(":)");
	display::newLine();*/


	display::init();
	menu::create_entry<0>("One!");
	menu::create_entry<1>("Two!");
	menu::create_entry<2>("Three!");
	menu::create_entry<3>("Four!");
	menu::create_entry<4>("Five!");
	menu::create_entry<5>("Six!");
	sei();


	//uart_puts("Test");
	//display::newLine();

	//initADC();
	//adc c;
	//BMCPP::Hal::ADConverter* t = BMCPP::Hal::ADConverter::create<>();
	//uart_puts("Test");
	//c.startChannels<1>();
	adc::init();
	adc::create<0>();
	adc::create<1>();

	char xy,prevkey = -1;
	int a = 0;
	auto test = [](int i) { return i + 4; };
	bool first = true; //awkward things happening -> 1 is always pressed when first entered	  (should be nothing -> 'z')
	//int a = 0;
	menu::show();
	while (true) {
		display::gotoCharPos(0, 0);
		uint16_t a = adc::getValue<1>();
		if (a > 600) {
			menu::select_prev();
			//menu::show();
			menu::updateCursor();
		}
		else if (a < 400) {
			menu::select_next();
			menu::updateCursor();
		}
	}
	return 0;
}				

ISR(ADC_vect)
{
	// Save conversion result.
	adc::writeResults();
}