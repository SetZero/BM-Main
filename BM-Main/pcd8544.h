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

#ifndef _PCD8544_H_
#define _PCD8544_H_

/* General constants for driver */
#define FALSE                      0
#define TRUE                       1

/* For return value */
#define OK                         0
#define OUT_OF_BORDER              1
#define OK_WITH_WRAP               2


#define LCD_X_RES                  84    /* x resolution */
#define LCD_Y_RES                  48    /* y resolution */
#define EMPTY_SPACE_BARS           2
#define BAR_X                      5
#define BAR_Y                      38

/* LCD Port */
#define LCD_PORT                   PORTB
#define LCD_DDR                    DDRB

/* ATMega8 port pinout for LCD. */
/* 0.2.6 bug, fixed */
#define LCD_DC_PIN                 PB0  /* Pin 0 */
#define LCD_CE_PIN                 PB1  /* Pin 2 */
#define SPI_MOSI_PIN               PB3  /* Pin 3 */
#define LCD_RST_PIN                PB2  /* Pin 4 */
#define SPI_CLK_PIN                PB5  /* Pin 5 */

/* Cache size in bytes ( 84 * 48 ) / 8 = 504 bytes */
#define LCD_CACHE_SIZE             ( ( LCD_X_RES * LCD_Y_RES ) / 8)

/* Type definition */
typedef unsigned char              byte;
typedef unsigned int               word;

/* Enumeration */
typedef enum
{
    LCD_CMD  = 0,
    LCD_DATA = 1

} LcdCmdData;

typedef enum
{
    PIXEL_OFF =  0,
    PIXEL_ON  =  1,
    PIXEL_XOR =  2

} LcdPixelMode;

typedef enum
{
    FONT_1X = 1,
    FONT_2X = 2

} LcdFontSize;

/* Function prototypes */
void LcdInit       ( void );
void LcdClear      ( void );
void LcdUpdate     ( void );
void LcdImage      ( const char *imageData );
void LcdContrast   ( char contrast);
char LcdGotoXYFont (char x, char y );
char LcdChr        ( LcdFontSize size, char ch );
char LcdStr        ( LcdFontSize size, char dataArray[] );
char LcdFStr       ( LcdFontSize size, const char *dataPtr );
char LcdPixel      (char x, char y, LcdPixelMode mode );
char LcdLine       (char x1, char x2, char y1, char y2, LcdPixelMode mode );
char LcdRect       (char x1, char x2, char y1, char y2, LcdPixelMode mode );
char LcdSingleBar  (char baseX, char baseY, char height, char width, LcdPixelMode mode );
char LcdBars       (char data[], char numbBars, char width, char multiplier );

using spi = typename BMCPP::Hal::SPI<0, BMCPP::Hal::spi::ClkRate::clkRateDiv4>;



/*
 * Character lookup table code was taken from the work of Sylvain Bissonette
 * This table defines the standard ASCII characters in a 5x7 dot format.
 */
#include <avr\pgmspace.h>
#include <avr/io.h>
#include <string.h>
#include <avr/interrupt.h>
#include "spi_hal.h"
#include "uc_select.h"
#include "Utils\Utils.h"
#include "AVR_concepts.h"


static const byte FontLookup [][5] PROGMEM=
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



			template<uint8_t SPI_number,typename rst_pin, typename ce_pin, typename dc_pin,
			template<uint8_t, typename clockRate, template<typename, typename> typename, template<typename, uint8_t> typename, bool, typename> typename spi_template,
			template<typename, typename> typename port_template,
			template<typename, uint8_t> typename pin_template,
			typename MicroController = __DEFAULT_MMCU__>
			class PCD_8544 {
			inline static unsigned char xPtr = 0;
			inline static unsigned char yPtr = 0;

			static_assert(BMCPP::AVR::isUC<MicroController>(), " template parameter MicroController is not a MicroController");

			static unsigned const char WIDTH = 84;
			static unsigned const char HEIGHT = 48;
			static unsigned const char CHAR_WIDTH = 5;
			static unsigned const char CHAR_HEIGHT = 8;

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

			static void inline setYPtr() {
				yPtr < (HEIGHT-CHAR_HEIGHT) ?
					yPtr = static_cast<unsigned char>(yPtr + CHAR_HEIGHT) :
					yPtr = 0;
			}

			/*
			* Description  :   delay for LCD init routine, no interrupt necessary.
			*/
			static void Delay() {
				for (typename utils::minRequiredUnsigned<MicroController::ClkRate / 1000>::type i = 0; i < MicroController::ClkRate / 1000; i++)
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

static void LcdSend(char data, LcdCmdData cd);
static void Delay(void);

/* Global variables */

/* Cache buffer in SRAM 84*48 bits or 504 bytes */
static char  LcdCache[LCD_CACHE_SIZE];

/* Cache index */
static int   LcdCacheIdx;


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

/* Variable to decide whether update Lcd Cache is active/nonactive */
static bool  UpdateLcd;

/*
* Name         :  LcdInit
* Description  :  Performs MCU SPI & LCD controller initialization.
* Argument(s)  :  None.
* Return value :  None.
*/
void LcdInit()
{
	/* Pull-up on reset pin. */
	LCD_PORT |= _BV(LCD_RST_PIN);

					spi::init();
					/* Disable LCD controller */
					ce_pin::on();

	/* Toggle display reset pin. */
	LCD_PORT &= ~(_BV(LCD_RST_PIN));
	Delay();
	LCD_PORT |= _BV(LCD_RST_PIN);

	/* Enable SPI port:
	* No interrupt, MSBit first, Master mode, CPOL->0, CPHA->0, Clk/4
	*/

	//SPCR = 0x50;
	spi::spi0_init();
	/* Disable LCD controller */
	LCD_PORT |= _BV(LCD_CE_PIN);

	LcdSend(0x21, LCD_CMD); /* LCD Extended Commands. */
	LcdSend(0xC8, LCD_CMD); /* Set LCD Vop (Contrast).*/
	LcdSend(0x06, LCD_CMD); /* Set Temp coefficent. */
	LcdSend(0x13, LCD_CMD); /* LCD bias mode 1:48. */
	LcdSend(0x20, LCD_CMD); /* LCD Standard Commands,Horizontal addressing mode */
	LcdSend(0x0C, LCD_CMD); /* LCD in normal mode. */

							/* Reset watermark pointers to empty */
	LoWaterMark = LCD_CACHE_SIZE;
	HiWaterMark = 0;

	/* Clear display on first time use */
	LcdClear();
	LcdUpdate();
}


unsigned char pixelsInLine = 0;
unsigned const char WIDTH = 84;

						send(c, true);
						if (xPtr < WIDTH)
							xPtr++;
						else {
							xPtr = 0;  // new line
							setYPtr();
						}
					}
				}

	if (ch < 32) {
		LcdClear();
		printChar('4');
		printChar('2');
	}

	spi::readWriteSingle(1);

				/*
				* Description  :  Clears the whole screen and returns to position (0,0).
				*/
				static void clear()
				{
					for (typename utils::minRequiredUnsigned<WIDTH*HEIGHT>::type i = 0; i < (WIDTH*HEIGHT); i++) {
						send(0, true);
					}
					newLine();
					while (yPtr != 0)
					{
						newLine();
					}

				}
		};
	}
}

void newLine() {
	for (int i = 0; i < (WIDTH - pixelsInLine); i++) {
		LcdSend(0, LcdCmdData::LCD_DATA);
	}
	pixelsInLine = 0;
}

void printStr(const char* str) {
	while (*str) {
		printChar(*str);
		str++;
	}
}

/*
* Name         :  LcdContrast
* Description  :  Set display contrast.
* Argument(s)  :  contrast -> Contrast value from 0x00 to 0x7F.
* Return value :  None.
*/
void LcdContrast(char contrast)
{
	/* LCD Extended Commands. */
	LcdSend(0x21, LCD_CMD);

	/* Set LCD contrast level. */
	LcdSend(0x80 | contrast, LCD_CMD);

	/* LCD Standard Commands, horizontal addressing mode. */
	LcdSend(0x20, LCD_CMD);
}

/*
* Name         :  LcdClear
* Description  :  Clears the display. LcdUpdate must be called next.
* Argument(s)  :  None.
* Return value :  None.
* Note         :  Based on Sylvain Bissonette's code
*/
void LcdClear(void)
{
	// Removed in version 0.2.6, March 14 2009
	// Optimized by Jakub Lasinski
	//    int i;
	//
	//    /* Set 0x00 to all LcdCache's contents */
	//    for ( i = 0; i < LCD_CACHE_SIZE; i++ )
	//    {
	//        LcdCache[ i ] = 0x00;
	//    }
	memset(LcdCache, 0x00, LCD_CACHE_SIZE); //Sugestion - its faster and its 10 bytes less in program mem
											/* Reset watermark pointers to full */
	LoWaterMark = 0;
	HiWaterMark = LCD_CACHE_SIZE - 1;

	/* Set update flag to be true */
	UpdateLcd = TRUE;
}


/*
* Name         :  LcdUpdate
* Description  :  Copies the LCD cache into the device RAM.
* Argument(s)  :  None.
* Return value :  None.
*/
void LcdUpdate(void)
{
	int i;

	if (LoWaterMark < 0)
		LoWaterMark = 0;
	else if (LoWaterMark >= LCD_CACHE_SIZE)
		LoWaterMark = LCD_CACHE_SIZE - 1;

	if (HiWaterMark < 0)
		HiWaterMark = 0;
	else if (HiWaterMark >= LCD_CACHE_SIZE)
		HiWaterMark = LCD_CACHE_SIZE - 1;

	/*  Set base address according to LoWaterMark. */
	LcdSend(0x80 | (LoWaterMark % LCD_X_RES), LCD_CMD);
	LcdSend(0x40 | (LoWaterMark / LCD_X_RES), LCD_CMD);

	/*  Serialize the display buffer. */
	for (i = LoWaterMark; i <= HiWaterMark; i++)
	{
		LcdSend(LcdCache[i], LCD_DATA);
	}

	/*  Reset watermark pointers. */
	LoWaterMark = LCD_CACHE_SIZE - 1;
	HiWaterMark = 0;

	/* Set update flag to be true */
	UpdateLcd = FALSE;
}

/*
* Name         :  LcdSend
* Description  :  Sends data to display controller.
* Argument(s)  :  data -> Data to be sent
*                 cd   -> Command or data (see enum in pcd8544.h)
* Return value :  None.
*/
static void LcdSend(char data, LcdCmdData cd)
{
	/*  Enable display controller (active low). */
	LCD_PORT &= ~(_BV(LCD_CE_PIN));

	if (cd == LCD_DATA)
	{
		LCD_PORT |= _BV(LCD_DC_PIN);
	}
	else
	{
		LCD_PORT &= static_cast<uint8_t>(~(_BV(LCD_DC_PIN)));
	}
	
	using spi = typename BMCPP::Hal::SPI<0, BMCPP::Hal::spi::ClkRate::clkRateDiv4>;
	spi::readWriteSingle(data);
	/*  Send data to display controller. */
	//SPDR = data;

	/*  Wait until Tx register empty. */
	//while ((SPSR & 0x80) != 0x80);	  


	/* Disable display controller. */
	LCD_PORT |= _BV(LCD_CE_PIN);
}

/*
* Name         :  Delay
* Description  :  Uncalibrated delay for LCD init routine.
* Argument(s)  :  None.
* Return value :  None.
*/
static void Delay(void)
{
	int i;

	for (i = -32000; i < 32000; i++);
}
