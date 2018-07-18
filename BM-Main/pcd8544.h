/*
 *
 * Name         :  pcd8544.h
 *
 * Description  :  This is header file for the PCD8544 graphic LCD driver.
 *                 Based on the code written by Sylvain Bissonette
 *
 * Author       :  Fandi Gunawan <fandigunawan@gmail.com>
 * Website      :  http://fandigunawan.wordpress.com
 *
 * Credit       :  Sylvain Bissonette (2003)
 *                 Louis Frigon (2003)
 *
 * License      :  GPL v. 3
 *
 * Compiler     :  WinAVR, GCC for AVR platform
 *                 Tested version :
 *                 - 20070525
 *                 - 20071221
 *                 - 20081225
 * Compiler note:  Please be aware of using older/newer version since WinAVR
 *                 is in extensive development. Please compile with parameter -O1
 *
 * History      :
 * Please refer to pcd8544.c
 */

#include <avr\pgmspace.h>
#include <avr/io.h>
#include <string.h>
#include <avr/interrupt.h>
#include "spi_hal.h"
#include "uc_select.h"
#include "Utils\Utils.h"

namespace BMCPP {
	namespace Hal {

		/* Enumeration */
		typedef enum
		{
			LCD_CMD = 0,
			LCD_DATA = 1

		} LcdCmdData;

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

		static unsigned char xPtr = 0;
		static unsigned char yPtr = 0;

			template<uint8_t SPI_number,typename rst_pin, typename ce_pin, typename dc_pin,
			template<uint8_t, typename clockRate, template<typename, typename> typename, template<typename, uint8_t> typename, bool, typename> typename spi_template,
			template<typename, typename> typename port_template,
			template<typename, uint8_t> typename pin_template,
			typename MicroController = __DEFAULT_MMCU__>
			class PCD_8544 {

				static unsigned const char WIDTH = 84;
				static unsigned const char HEIGHT = 48;
				static unsigned const char CHAR_WIDTH = 5;
				static unsigned const char CHAR_HEIGHT = 8;

			using spi = spi_template<SPI_number, clkRateDiv4, port_template, pin_template, true, MicroController>;

			static void inline setYPtr() {
				yPtr < HEIGHT ?
					yPtr = static_cast<unsigned char>(yPtr + CHAR_HEIGHT) :
					yPtr = 0;
			}


			/*
			* Name         :  Delay
			* Description  :   delay for LCD init routine.
			*/
			static void Delay()
			{
				for (typename utils::minRequiredUnsigned<MicroController::ClkRate / 1000>::type i = 0; i < MicroController::ClkRate / 1000; i++)
					__asm("nop");
			}
			public:

				/*
				* Description  :  Performs LCD controller initialization.
				*/
				static void init()
				{
					/* Pull-up on reset pin. */
					rst_pin::on();

					/* Set output bits on LCD Port. */
					dc_pin::template dir<typename BMCPP::Hal::Output>();
					ce_pin::template dir<typename BMCPP::Hal::Output>();

					Delay();

					/* Toggle display reset pin. */
					rst_pin::off();
					Delay();
					rst_pin::on();

					/* Enable SPI port:
					* No interrupt, MSBit first, Master mode, CPOL->0, CPHA->0, Clk/4
					*/

					spi::spi0_init();
					/* Disable LCD controller */
					ce_pin::on();

					send(0x21, LCD_CMD); /* LCD Extended Commands. */
					send(0xC8, LCD_CMD); /* Set LCD Vop (Contrast).*/
					send(0x06, LCD_CMD); /* Set Temp coefficent. */
					send(0x13, LCD_CMD); /* LCD bias mode 1:48. */
					send(0x20, LCD_CMD); /* LCD Standard Commands,Horizontal addressing mode */
					send(0x0C, LCD_CMD); /* LCD in normal mode. */

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
					}

					spi::readWriteSingle(1);

					for (uint8_t i = 0; i < 5; i++)
					{

						/* Copy lookup table from Flash ROM to temporary c */
						uint8_t c = static_cast<uint8_t>(pgm_read_byte(&(FontLookup[ch - 32][i])) << 1);

						send(c, LcdCmdData::LCD_DATA);
						if (xPtr < WIDTH)
							xPtr++;
						else {
							xPtr = 0;
							setYPtr();
						}
					}
				}

				/*
				* Description  :  fills the current line with whitespaces and goes to the next Line.
				*/
				static void newLine() {
					for (int i = 0; i < (WIDTH - xPtr); i++) {
						send(0, LcdCmdData::LCD_DATA);
					}
					xPtr = 0;
					setYPtr();
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
				* Description  :  Clears the whole screen.
				*/
				static void clear(void)
				{
					for (auto i = 0; i < HEIGHT*WIDTH + 1; i++)
					{
						send(0, LCD_DATA);
					}
				}




				/*
				* Description  :  Sends data to display controller.
				* Argument(s)  :  data -> Data to be sent
				*                 cd   -> Command or data (see enum in pcd8544.h)
				*/
				static void send(char data, LcdCmdData cd)
				{
					/*  Enable display controller (active low). */
					//LCD_PORT &= ~(_BV(LCD_CE_PIN));
					ce_pin::off();

					cd == LCD_DATA ?
						dc_pin::on():
						dc_pin::off();

					spi::readWriteSingle(data);

					ce_pin::on();
				}
		};
	}
}