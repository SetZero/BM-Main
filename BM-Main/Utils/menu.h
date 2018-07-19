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
			static uint8_t selected_item;
			static MenuSpot spots[display::MAX_CHAR_HEIGHT];
		public:
			static void init() {
				display::init();
			}

			template<uint8_t position>
			static void create_entry(const char* name) {
				static_assert(position < display::MAX_CHAR_HEIGHT);
				spots[position].name = name;
			}

			static void select_next() {
				if (selected_item < display::MAX_CHAR_HEIGHT - 1) {
					selected_item++;
				}
				else {
					//selected_item = 0;
				}
			}

			static void select_prev() {
				if (selected_item > 0) {
					selected_item--;
				}
				else {
					//selected_item = display::MAX_CHAR_HEIGHT - 1;
				}
			}

			static void execute_selected() {
				//spots[selected_item]
			}

			static void show() {
				//display::clear();
				for (int i = 0; i < display::MAX_CHAR_HEIGHT; i++) {
					if (i == selected_item) display::printStr("-> ");
					display::printStr(spots[i].name);
					if(i != display::MAX_CHAR_HEIGHT - 1) display::newLine();
				}
			}

			static void updateCursor() {
				display::gotoRowColumn(0, selected_item);
				display::printStr("-> ");
				display::printStr(spots[selected_item].name);
			}
		};
	}
}
template<typename display>
typename BMCPP::Utils::Menu<display>::MenuSpot BMCPP::Utils::Menu<display>::spots[display::MAX_CHAR_HEIGHT];
template<typename display>
uint8_t BMCPP::Utils::Menu<display>::selected_item = 0;