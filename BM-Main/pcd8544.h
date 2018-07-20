/*
*
* Name         :  pcd8544.c
*
* Description  :  This is a driver for the PCD8544 graphic LCD.
*                 Based on the code written by Sylvain Bissonette
*                 This driver is buffered in 504 bytes memory be sure
*                 that your MCU having bigger memory
*
* Author       :  Fandi Gunawan <fandigunawan@gmail.com>
* Website      :  http://fandigunawan.wordpress.com
*
* Credit       :  Sylvain Bissonette (2003)
*
* License      :  GPL v. 3
*
* Compiler     :  WinAVR, GCC for AVR platform
*                 Tested version :
*                 - 20070525 (avr-libc 1.4)
*                 - 20071221 (avr-libc 1.6)
*                 - 20081225 tested by Jakub Lasinski
*                 - other version please contact me if you find out it is working
* Compiler note:  Please be aware of using older/newer version since WinAVR
*                 is under extensive development. Please compile with parameter -O1
*
* History      :
* Version 0.2.6 (March 14, 2009) additional optimization by Jakub Lasinski
* + Optimization using Memset and Memcpy
* + Bug fix and sample program reviewed
* + Commented <stdio.h>
* Version 0.2.5 (December 25, 2008) x-mas version :)
* + Boundary check is added (reported by starlino on Dec 20, 2008)
* + Return value is added, it will definitely useful for error checking
* Version 0.2.4 (March 5, 2008)
* + Multiplier was added to LcdBars to scale the bars
* Version 0.2.3 (February 29, 2008)
* + Rolled back LcdFStr function because of serious bug
* + Stable release
* Version 0.2.2 (February 27, 2008)
* + Optimizing LcdFStr function
* Version 0.2.1 (January 2, 2008)
* + Clean up codes
* + All settings were migrated to pcd8544.h
* + Using _BV() instead of << to make a better readable code
* Version 0.2 (December 11-14, 2007)
* + Bug fixed in LcdLine() and LcdStr()
* + Adding new routine
*    - LcdFStr()
*    - LcdSingleBar()
*    - LcdBars()
*    - LcdRect()
*    - LcdImage()
* + PROGMEM used instead of using.data section
* Version 0.1 (December 3, 2007)
* + First stable driver
*
* Note         :
* Font will be displayed this way (16x6)
* 1 2 3 4 5 6 7 8 9 0 1 2 3 4
* 2
* 3
* 4
* 5
* 6
*
* Contributor :
* + Jakub Lasinski
*/

#include <avr\pgmspace.h>
#include <avr/io.h>
#include <string.h>
#include <avr/interrupt.h>
#include "spi_hal.h"
#include "uc_select.h"
#include "Utils\Utils.h"
#include "AVR_concepts.h"

namespace BMCPP {
	namespace Hal {

		static const uint8_t FontLookup[][5] PROGMEM =
		{
			{ 0x00, 0x00, 0x00, 0x00, 0x00 },   /* space */
		{ 0x00, 0x00, 0x2f, 0x00, 0x00 },   /* ! */
		{ 0x00, 0x07, 0x00, 0x07, 0x00 },   /* " */
		{ 0x14, 0x7f, 0x14, 0x7f, 0x14 },   /* # */
		{ 0x24, 0x2a, 0x7f, 0x2a, 0x12 },   /* $ */
		{ 0xc4, 0xc8, 0x10, 0x26, 0x46 },   /* % */
		{ 0x36, 0x49, 0x55, 0x22, 0x50 },   /* & */
		{ 0x00, 0x05, 0x03, 0x00, 0x00 },   /* ' */
		{ 0x00, 0x1c, 0x22, 0x41, 0x00 },   /* ( */
		{ 0x00, 0x41, 0x22, 0x1c, 0x00 },   /* ) */
		{ 0x14, 0x08, 0x3E, 0x08, 0x14 },   /* * */
		{ 0x08, 0x08, 0x3E, 0x08, 0x08 },   /* + */
		{ 0x00, 0x00, 0x50, 0x30, 0x00 },   /* , */
		{ 0x10, 0x10, 0x10, 0x10, 0x10 },   /* - */
		{ 0x00, 0x60, 0x60, 0x00, 0x00 },   /* . */
		{ 0x20, 0x10, 0x08, 0x04, 0x02 },   /* / */
		{ 0x3E, 0x51, 0x49, 0x45, 0x3E },   /* 0 */
		{ 0x00, 0x42, 0x7F, 0x40, 0x00 },   /* 1 */
		{ 0x42, 0x61, 0x51, 0x49, 0x46 },   /* 2 */
		{ 0x21, 0x41, 0x45, 0x4B, 0x31 },   /* 3 */
		{ 0x18, 0x14, 0x12, 0x7F, 0x10 },   /* 4 */
		{ 0x27, 0x45, 0x45, 0x45, 0x39 },   /* 5 */
		{ 0x3C, 0x4A, 0x49, 0x49, 0x30 },   /* 6 */
		{ 0x01, 0x71, 0x09, 0x05, 0x03 },   /* 7 */
		{ 0x36, 0x49, 0x49, 0x49, 0x36 },   /* 8 */
		{ 0x06, 0x49, 0x49, 0x29, 0x1E },   /* 9 */
		{ 0x00, 0x36, 0x36, 0x00, 0x00 },   /* : */
		{ 0x00, 0x56, 0x36, 0x00, 0x00 },   /* ; */
		{ 0x08, 0x14, 0x22, 0x41, 0x00 },   /* < */
		{ 0x14, 0x14, 0x14, 0x14, 0x14 },   /* = */
		{ 0x00, 0x41, 0x22, 0x14, 0x08 },   /* > */
		{ 0x02, 0x01, 0x51, 0x09, 0x06 },   /* ? */
		{ 0x32, 0x49, 0x59, 0x51, 0x3E },   /* @ */
		{ 0x7E, 0x11, 0x11, 0x11, 0x7E },   /* A */
		{ 0x7F, 0x49, 0x49, 0x49, 0x36 },   /* B */
		{ 0x3E, 0x41, 0x41, 0x41, 0x22 },   /* C */
		{ 0x7F, 0x41, 0x41, 0x22, 0x1C },   /* D */
		{ 0x7F, 0x49, 0x49, 0x49, 0x41 },   /* E */
		{ 0x7F, 0x09, 0x09, 0x09, 0x01 },   /* F */
		{ 0x3E, 0x41, 0x49, 0x49, 0x7A },   /* G */
		{ 0x7F, 0x08, 0x08, 0x08, 0x7F },   /* H */
		{ 0x00, 0x41, 0x7F, 0x41, 0x00 },   /* I */
		{ 0x20, 0x40, 0x41, 0x3F, 0x01 },   /* J */
		{ 0x7F, 0x08, 0x14, 0x22, 0x41 },   /* K */
		{ 0x7F, 0x40, 0x40, 0x40, 0x40 },   /* L */
		{ 0x7F, 0x02, 0x0C, 0x02, 0x7F },   /* M */
		{ 0x7F, 0x04, 0x08, 0x10, 0x7F },   /* N */
		{ 0x3E, 0x41, 0x41, 0x41, 0x3E },   /* O */
		{ 0x7F, 0x09, 0x09, 0x09, 0x06 },   /* P */
		{ 0x3E, 0x41, 0x51, 0x21, 0x5E },   /* Q */
		{ 0x7F, 0x09, 0x19, 0x29, 0x46 },   /* R */
		{ 0x46, 0x49, 0x49, 0x49, 0x31 },   /* S */
		{ 0x01, 0x01, 0x7F, 0x01, 0x01 },   /* T */
		{ 0x3F, 0x40, 0x40, 0x40, 0x3F },   /* U */
		{ 0x1F, 0x20, 0x40, 0x20, 0x1F },   /* V */
		{ 0x3F, 0x40, 0x38, 0x40, 0x3F },   /* W */
		{ 0x63, 0x14, 0x08, 0x14, 0x63 },   /* X */
		{ 0x07, 0x08, 0x70, 0x08, 0x07 },   /* Y */
		{ 0x61, 0x51, 0x49, 0x45, 0x43 },   /* Z */
		{ 0x00, 0x7F, 0x41, 0x41, 0x00 },   /* [ */
		{ 0x55, 0x2A, 0x55, 0x2A, 0x55 },   /* "Yen" */
		{ 0x00, 0x41, 0x41, 0x7F, 0x00 },   /* ] */
		{ 0x04, 0x02, 0x01, 0x02, 0x04 },   /* ^ */
		{ 0x40, 0x40, 0x40, 0x40, 0x40 },   /* _ */
		{ 0x00, 0x01, 0x02, 0x04, 0x00 },   /* ' */
		{ 0x20, 0x54, 0x54, 0x54, 0x78 },   /* a */
		{ 0x7F, 0x48, 0x44, 0x44, 0x38 },   /* b */
		{ 0x38, 0x44, 0x44, 0x44, 0x20 },   /* c */
		{ 0x38, 0x44, 0x44, 0x48, 0x7F },   /* d */
		{ 0x38, 0x54, 0x54, 0x54, 0x18 },   /* e */
		{ 0x08, 0x7E, 0x09, 0x01, 0x02 },   /* f */
		{ 0x0C, 0x52, 0x52, 0x52, 0x3E },   /* g */
		{ 0x7F, 0x08, 0x04, 0x04, 0x78 },   /* h */
		{ 0x00, 0x44, 0x7D, 0x40, 0x00 },   /* i */
		{ 0x20, 0x40, 0x44, 0x3D, 0x00 },   /* j */
		{ 0x7F, 0x10, 0x28, 0x44, 0x00 },   /* k */
		{ 0x00, 0x41, 0x7F, 0x40, 0x00 },   /* l */
		{ 0x7C, 0x04, 0x18, 0x04, 0x78 },   /* m */
		{ 0x7C, 0x08, 0x04, 0x04, 0x78 },   /* n */
		{ 0x38, 0x44, 0x44, 0x44, 0x38 },   /* o */
		{ 0x7C, 0x14, 0x14, 0x14, 0x08 },   /* p */
		{ 0x08, 0x14, 0x14, 0x18, 0x7C },   /* q */
		{ 0x7C, 0x08, 0x04, 0x04, 0x08 },   /* r */
		{ 0x48, 0x54, 0x54, 0x54, 0x20 },   /* s */
		{ 0x04, 0x3F, 0x44, 0x40, 0x20 },   /* t */
		{ 0x3C, 0x40, 0x40, 0x20, 0x7C },   /* u */
		{ 0x1C, 0x20, 0x40, 0x20, 0x1C },   /* v */
		{ 0x3C, 0x40, 0x30, 0x40, 0x3C },   /* w */
		{ 0x44, 0x28, 0x10, 0x28, 0x44 },   /* x */
		{ 0x0C, 0x50, 0x50, 0x50, 0x3C },   /* y */
		{ 0x44, 0x64, 0x54, 0x4C, 0x44 }    /* z */
		};

		template<uint8_t SPI_number, typename rst_pin, typename ce_pin, typename dc_pin,
			template<uint8_t, typename clockRate, template<typename, typename> typename, template<typename, uint8_t> typename, bool, bool, typename,typename> typename spi_template,
			template<typename, typename> typename port_template,
			template<typename, uint8_t> typename pin_template,
			typename MicroController = __DEFAULT_MMCU__>
			class PCD_8544 {
			inline static unsigned char xPtr = 0;
			inline static unsigned char yPtr = 0;

			static_assert(BMCPP::AVR::isUC<MicroController>(), " template parameter MicroController is not a MicroController");
			static_assert(AVR::isPin<rst_pin>(), "template Parameter rst_pin is not a Pin");
			static_assert(AVR::isPin<ce_pin>(), "template Parameter rst_pin is not a Pin");
			static_assert(AVR::isPin<dc_pin>(), "template Parameter rst_pin is not a Pin");

			using spi = spi_template<SPI_number, clkRateDiv4, port_template, pin_template, true, false,uint8_t, MicroController>;


			PCD_8544() = delete;

			static void inline YPtrIncr() {
				yPtr < (HEIGHT - CHAR_HEIGHT) ?
					yPtr = static_cast<unsigned char>(yPtr + CHAR_HEIGHT) :
					yPtr = 0;
			}

			static void inline XPtrIncr() {
				if (xPtr < WIDTH)
					xPtr++;
				else {
					xPtr = 0;  // new line
					YPtrIncr();
				}
			}

			/*
			* Description  :   delay for LCD init routine, no interrupt necessary.
			*/
			static void Delay() {
				for (typename utils::minRequiredUnsigned<MicroController::ClkRate /
					1000>::type i = 0; i < MicroController::ClkRate / 1000; i++)
					__asm("nop");
			}

			/*
			* Description  :  Sends data to display controller.
			* Argument(s)  :  data -> Data to be sent
			*                 cd   -> Command or data (see enum in pcd8544.h)
			*/
			static void send(char data, bool isData) {
				/*  Enable display controller (active low). */
				ce_pin::off();

				if (isData) {
					dc_pin::on();
					XPtrIncr();
				}
				else
					dc_pin::off();

				spi::readWriteSingle(data);

				ce_pin::on();
			}

			public:
				static unsigned const char WIDTH = 84;
				static unsigned const char HEIGHT = 48;
				static unsigned const char CHAR_WIDTH = 5;
				static unsigned const char CHAR_HEIGHT = 8;
				static unsigned const char MAX_CHAR_WIDTH = WIDTH / CHAR_WIDTH;
				static unsigned const char MAX_CHAR_HEIGHT = HEIGHT / CHAR_HEIGHT;
				/*
				* Name         :  LcdRect
				* Description  :  Display a rectangle in char size.
				*/
				static void rect()
				{
					send(0xff, true);
					send(0xff, true);
					send(0xff, true);
					send(0xff, true);
					send(0xff, true);
				}

				/*
				* Description  :  Performs LCD controller initialization.
				*/
				static void init()
				{
					/* Pull-up on reset pin. */
					rst_pin::on();

					/* Set output bits on LCD Port. */
					dc_pin::template dir<typename dc_pin::Output>();
					ce_pin::template dir<typename ce_pin::Output>();

					Delay();

					/* Toggle display reset pin. */
					rst_pin::off();
					Delay();
					rst_pin::on();

					spi::init();
					/* Disable LCD controller */
					ce_pin::on();

					send(0x21, false); /* LCD Extended Commands. */
					send(0xC8, false); /* Set LCD Vop (Contrast).*/
					send(0x06, false); /* Set Temp coefficent. */
					send(0x13, false); /* LCD bias mode 1:48. */
					send(0x20, false); /* LCD Standard Commands,Horizontal addressing mode */
					send(0x0C, false); /* LCD in normal mode. */

									   /* Clear display on first time use */
					clear();
				}


				/*
				* Description  :  Prints a single Character on the screen.
				*/
				static void printChar(unsigned char ch) {
					//err -> no printable Char below 32
					if (ch < 32) {
						clear();
						printChar('4');
						printChar('2');
						return;
					}

					spi::readWriteSingle(1);

					for (uint8_t i = 0; i < 5; i++)
					{

						/* Copy lookup table from Flash ROM to temporary c */
						uint8_t c = static_cast<uint8_t>(pgm_read_byte(&(FontLookup[ch - 32][i])) << 1);

						send(c, true);
					}
				}

				/*
				* Description  :  Prints a String on the screen.
				*/
				static void printStr(const char* str) {
					while (*str) {
						printChar(*str);
						str++;
					}
				}

				/*
				* Description  :  fills the current line with whitespaces and goes to the next Line.
				*/
				static void newLine() {
					YPtrIncr();
					gotoCharPos(0,yPtr / CHAR_HEIGHT);
					xPtr = 0;
				}

				/*
				* Description  :  Clears the whole screen and returns to position (0,0).
				*/
				static void clear()
				{
					constexpr uint16_t bits_to_clear = WIDTH * MAX_CHAR_HEIGHT; //rows*column pixels
					for (uint16_t i = 0; i < bits_to_clear; i++)
						send(0, true);
					gotoCharPos(0, 0);
				}


				/*
				* Description: clears the line with the given number, the pointer is then set to (0,lineNumber)
				*/
				static void clearLine(const uint8_t lineNumber) {
					gotoCharPos(0, lineNumber);
					for (uint8_t i = 0; i < WIDTH; i++)
						send(0,true);
					gotoCharPos(0, lineNumber);
					yPtr = static_cast<uint8_t>(lineNumber * CHAR_HEIGHT);
				}

				/*
				*	Description: goes to Column x, Row y -> char sizes
				*/
				static void gotoCharPos(const uint8_t x,const uint8_t y) {
					if (x < WIDTH && y < HEIGHT) {
						send(static_cast<uint8_t>(0x80 | x), false);
						send(static_cast<uint8_t>(0x40 | y), false);
						xPtr = static_cast<uint8_t>(x * CHAR_WIDTH);
						yPtr = static_cast<uint8_t>(y * CHAR_HEIGHT);
					}
				}
		};
	}
}
