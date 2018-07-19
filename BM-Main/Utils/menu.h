#pragma once
#include "../uart.h"
#include <avr\pgmspace.h>

namespace BMCPP {
	namespace Utils {
		template<typename display>
		class Menu {
			struct MenuSpot {
				const char* name = "---";
				//auto function;
			};
			static MenuSpot spots[display::CHAR_HEIGHT];
		public:
			static void init() {
				display::init();
			}

			template<uint8_t position>
			static void create_entry(const char* name) {
				static_assert(position < display::CHAR_HEIGHT);
				MenuSpot tmp;
				tmp.name = name;
				spots[position] = tmp;
			}

			static void show() {
				display::clear();
				for (int i = 0; i < display::CHAR_HEIGHT; i++) {
					//char buffer[display::CHAR_WIDTH];
					//strcpy_P(buffer, (PGM_P)pgm_read_word(&(spots[i].name)));
					//uart_puts("Value: ");
					//uart_puts(spots[i].name);
					//uart_puts("\n\r");
					display::printStr(spots[i].name);
					display::newLine();
				}
			}
		};
	}
}
template<typename display>
typename BMCPP::Utils::Menu<display>::MenuSpot BMCPP::Utils::Menu<display>::spots[display::CHAR_HEIGHT];