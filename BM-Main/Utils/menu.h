#pragma once
#include "../uart.h"
#include <avr\pgmspace.h>
#include "Utils.h"

namespace BMCPP {
	namespace Utils {
		
		template<typename display>
		class Menu {
			struct MenuSpot {
				const char* name = "---";
				void(* ptr)(void);
			};
			static uint8_t selected_item;
			static MenuSpot spots[display::MAX_CHAR_HEIGHT];

			static void reDrawSelectedLine() {
				display::clearLine(selected_item);
				display::printStr(spots[selected_item].name);
			}

		public:
			static void init() {
				display::init();
			}

			template<uint8_t position>
			static void create_entry(const char* name, void (* function)(void)) {
				static_assert(position < display::MAX_CHAR_HEIGHT);
				spots[position].name = name;
				spots[position].ptr = function;
			}

			static void select_next() {
				if (selected_item < display::MAX_CHAR_HEIGHT - 1) {
					reDrawSelectedLine();
					selected_item++;
				}
			}

			static void select_prev() {
				if (selected_item > 0) {
					reDrawSelectedLine();
					selected_item--;
				}
			}



			static void execute_selected() {
				(*spots[selected_item].ptr)();
			}

			static void show() {
				for (int i = 0; i < display::MAX_CHAR_HEIGHT; i++) {
					if (i == selected_item) display::printStr("-> ");
					display::printStr(spots[i].name);
					if(i != display::MAX_CHAR_HEIGHT - 1) display::newLine();
				}
			}

			static void updateCursor() {
				display::clearLine(selected_item);
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