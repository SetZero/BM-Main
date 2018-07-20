
#ifndef __AVR_ATmega328P__
	#define __AVR_ATmega328P__
#endif 


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
#include "Utils/literals.h"
#include "Utils/menu.h"
#include <stdlib.h>
#include "JoyStick.h"

using namespace BMCPP;
using namespace AVR;
using namespace Hal;

//setting up pins for the Display
using rst_pin = typename BMCPP::Hal::Pin<typename BMCPP::Hal::Port<typename BMCPP::AVR::B>, 2>;
using ce_pin = typename BMCPP::Hal::Pin<typename BMCPP::Hal::Port<typename BMCPP::AVR::B>, 1>;
using dc_pin = typename BMCPP::Hal::Pin<typename BMCPP::Hal::Port<typename BMCPP::AVR::B>, 0>;
//setup display
using display = PCD_8544<0, rst_pin, ce_pin, dc_pin, BMCPP::Hal::SPI, BMCPP::Hal::Port, BMCPP::Hal::Pin>;
//setup pin for powering the coffee machine
using brew_pin = typename BMCPP::Hal::Pin<typename BMCPP::Hal::Port<typename BMCPP::AVR::C>, 3>;
//setup port for the KeyPad
using keypadPort = BMCPP::Hal::Port<D>;
//setup the KeyPad
using keypad = BMCPP::Hal::KeyPad<keypadPort>;
//setup adc
using hardware_adc = BMCPP::Hal::Hardware_Adc<0>;
using adc = BMCPP::Hal::ADConverter<hardware_adc>;
//setup JoyStick
using joystick = JoyStick<adc, 0, 1>;


using menu = BMCPP::Utils::Menu<display>;
void reset();
void brew_coffee();
void cancel_brew();
void show_useful();
void type_something();

int main(){
	brew_pin::dir<brew_pin::Output>();
	keypad::init();
	display::init();
	menu::create_entry<0>("Reset", &reset);
	menu::create_entry<1>("Brew Coffee", &brew_coffee);
	menu::create_entry<2>("Cancel Brew", &cancel_brew);
	menu::create_entry<3>("Show Useful", &show_useful);
	menu::create_entry<4>("type something", &type_something);

	sei();
	adc::init();
	adc::create<0>();
	adc::create<1>();

	menu::show();
	while (true) {
		display::gotoCharPos(0, 0);
		if (joystick::isUp()) {
			menu::select_prev();
			menu::updateCursor();
		}
		else if (joystick::isDown()) {
			menu::select_next();
			menu::updateCursor();
		}
		if (joystick::isRight()) {
			menu::execute_selected();
		}
		
	}
	return 0;
}				

//Cancel every action and returns to the start screen
void reset() {
	display::clear();
	cancel_brew();
	menu::show();
}

//get your free coffee today
void brew_coffee() {
	brew_pin::on();
}

//stop the machine :(
void cancel_brew() {
	brew_pin::off();
}

//shows very useful hints
void show_useful() {
	display::clear();
	display::printStr("Chuck Norris chews bees");
	display::newLine();
	display::printStr("Coffee is the most healthy :)");
	display::newLine();
	display::printStr("101010");
	reset();
}

//you can type something with your keypad (maybe because you are bored?)
void type_something() {
	display::clear();
	while (!joystick::isLeft()) {
		uint8_t chr = keypad::getKey();
		if (chr != 'z') {
			display::printChar(chr);
		}
	}
	reset();
}

ISR(ADC_vect)
{
	// Save conversion result.
	adc::writeResults();
}