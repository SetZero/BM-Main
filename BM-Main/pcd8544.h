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



/*
 * Character lookup table code was taken from the work of Sylvain Bissonette
 * This table defines the standard ASCII characters in a 5x7 dot format.
 */
#include <avr\pgmspace.h>
#include <avr/io.h>
#include <string.h>
#include <avr/interrupt.h>
#include "spi_hal.h"

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

#endif  /*  _PCD8544_H_ */



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

//#include <stdio.h>


/* Function prototypes */

static void LcdSend(char data, LcdCmdData cd);
static void Delay(void);

/* Global variables */

/* Cache buffer in SRAM 84*48 bits or 504 bytes */
static char  LcdCache[LCD_CACHE_SIZE];

/* Cache index */
static int   LcdCacheIdx;

/* Lower part of water mark */
static int   LoWaterMark;

/* Higher part of water mark */
static int   HiWaterMark;

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

	/* Set output bits on LCD Port. */
	LCD_DDR |= _BV(LCD_RST_PIN) | _BV(LCD_DC_PIN) | _BV(LCD_CE_PIN) | _BV(SPI_MOSI_PIN) | _BV(SPI_CLK_PIN);

	Delay();

	/* Toggle display reset pin. */
	LCD_PORT &= ~(_BV(LCD_RST_PIN));
	Delay();
	LCD_PORT |= _BV(LCD_RST_PIN);

	/* Enable SPI port:
	* No interrupt, MSBit first, Master mode, CPOL->0, CPHA->0, Clk/4
	*/

	//SPCR = 0x50;
	using spi = typename BMCPP::Hal::SPI<0, BMCPP::Hal::spi::ClkRate::clkRateDiv4>;
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
* Name         :  LcdGotoXYFont
* Description  :  Sets cursor location to xy location corresponding to basic
*                 font size.
* Argument(s)  :  x, y -> Coordinate for new cursor position. Range: 1,1 .. 14,6
* Return value :  see return value in pcd8544.h
* Note         :  Based on Sylvain Bissonette's code
*/
char LcdGotoXYFont(char x, char y)
{
	/* Boundary check, slow down the speed but will guarantee this code wont fail */
	/* Version 0.2.5 - Fixed on Dec 25, 2008 (XMAS) */
	if (x > 14)
		return OUT_OF_BORDER;
	if (y > 6)
		return OUT_OF_BORDER;
	/*  Calculate index. It is defined as address within 504 bytes memory */

	LcdCacheIdx = (x - 1) * 6 + (y - 1) * 84;
	return OK;
}

/*
* Name         :  LcdChr
* Description  :  Displays a character at current cursor location and
*                 increment cursor location.
* Argument(s)  :  size -> Font size. See enum in pcd8544.h.
*                 ch   -> Character to write.
* Return value :  see pcd8544.h about return value
*/
char LcdChr(LcdFontSize size, char ch)
{
	char i, c;
	char b1, b2;
	int  tmpIdx;

	if (LcdCacheIdx < LoWaterMark)
	{
		/* Update low marker. */
		LoWaterMark = LcdCacheIdx;
	}

	if ((ch < 0x20) || (ch > 0x7b))
	{
		/* Convert to a printable character. */
		ch = 92;
	}

	if (size == FONT_1X)
	{
		for (i = 0; i < 5; i++)
		{
			/* Copy lookup table from Flash ROM to LcdCache */
			LcdCache[LcdCacheIdx++] = pgm_read_byte(&(FontLookup[ch - 32][i])) << 1;
		}
	}
	else if (size == FONT_2X)
	{
		tmpIdx = LcdCacheIdx - 84;

		if (tmpIdx < LoWaterMark)
		{
			LoWaterMark = tmpIdx;
		}

		if (tmpIdx < 0) return OUT_OF_BORDER;

		for (i = 0; i < 5; i++)
		{
			/* Copy lookup table from Flash ROM to temporary c */
			c = pgm_read_byte(&(FontLookup[ch - 32][i])) << 1;
			/* Enlarge image */
			/* First part */
			b1 = (c & 0x01) * 3;
			b1 |= (c & 0x02) * 6;
			b1 |= (c & 0x04) * 12;
			b1 |= (c & 0x08) * 24;

			c >>= 4;
			/* Second part */
			b2 = (c & 0x01) * 3;
			b2 |= (c & 0x02) * 6;
			b2 |= (c & 0x04) * 12;
			b2 |= (c & 0x08) * 24;

			/* Copy two parts into LcdCache */
			LcdCache[tmpIdx++] = b1;
			LcdCache[tmpIdx++] = b1;
			LcdCache[tmpIdx + 82] = b2;
			LcdCache[tmpIdx + 83] = b2;
		}

		/* Update x cursor position. */
		/* Version 0.2.5 - Possible bug fixed on Dec 25,2008 */
		LcdCacheIdx = (LcdCacheIdx + 11) % LCD_CACHE_SIZE;
	}

	if (LcdCacheIdx > HiWaterMark)
	{
		/* Update high marker. */
		HiWaterMark = LcdCacheIdx;
	}

	/* Horizontal gap between characters. */
	/* Version 0.2.5 - Possible bug fixed on Dec 25,2008 */
	LcdCache[LcdCacheIdx] = 0x00;
	/* At index number LCD_CACHE_SIZE - 1, wrap to 0 */
	if (LcdCacheIdx == (LCD_CACHE_SIZE - 1))
	{
		LcdCacheIdx = 0;
		return OK_WITH_WRAP;
	}
	/* Otherwise just increment the index */
	LcdCacheIdx++;
	return OK;
}

/*
* Name         :  LcdStr
* Description  :  Displays a character at current cursor location and increment
*                 cursor location according to font size. This function is
*                 dedicated to print string laid in SRAM
* Argument(s)  :  size      -> Font size. See enum.
*                 dataArray -> Array contained string of char to be written
*                              into cache.
* Return value :  see return value on pcd8544.h
*/
char LcdStr(LcdFontSize size, char dataArray[])
{
	char tmpIdx = 0;
	char response;
	while (dataArray[tmpIdx] != '\0')
	{
		/* Send char */
		response = LcdChr(size, dataArray[tmpIdx]);
		/* Just in case OUT_OF_BORDER occured */
		/* Dont worry if the signal == OK_WITH_WRAP, the string will
		be wrapped to starting point */
		if (response == OUT_OF_BORDER)
			return OUT_OF_BORDER;
		/* Increase index */
		tmpIdx++;
	}
	return OK;
}

/*
* Name         :  LcdFStr
* Description  :  Displays a characters at current cursor location and increment
*                 cursor location according to font size. This function is
*                 dedicated to print string laid in Flash ROM
* Argument(s)  :  size    -> Font size. See enum.
*                 dataPtr -> Pointer contained string of char to be written
*                            into cache.
* Return value :  see return value on pcd8544.h
* Example      :  LcdFStr(FONT_1X, PSTR("Hello World"));
*                 LcdFStr(FONT_1X, &name_of_string_as_array);
*/
char LcdFStr(LcdFontSize size, const char *dataPtr)
{
	char c;
	char response;
	for (c = pgm_read_byte(dataPtr); c; ++dataPtr, c = pgm_read_byte(dataPtr))
	{
		/* Put char */
		response = LcdChr(size, c);
		if (response == OUT_OF_BORDER)
			return OUT_OF_BORDER;
	}
	/* Fixed by Jakub Lasinski. Version 0.2.6, March 14, 2009 */
	return OK;
}

/*
* Name         :  LcdPixel
* Description  :  Displays a pixel at given absolute (x, y) location.
* Argument(s)  :  x, y -> Absolute pixel coordinates
*                 mode -> Off, On or Xor. See enum in pcd8544.h.
* Return value :  see return value on pcd8544.h
* Note         :  Based on Sylvain Bissonette's code
*/
char LcdPixel(char x, char y, LcdPixelMode mode)
{
	word  index;
	char  offset;
	char  data;

	/* Prevent from getting out of border */
	if (x > LCD_X_RES) return OUT_OF_BORDER;
	if (y > LCD_Y_RES) return OUT_OF_BORDER;

	/* Recalculating index and offset */
	index = ((y / 8) * 84) + x;
	offset = y - ((y / 8) * 8);

	data = LcdCache[index];

	/* Bit processing */

	/* Clear mode */
	if (mode == PIXEL_OFF)
	{
		data &= (~(0x01 << offset));
	}

	/* On mode */
	else if (mode == PIXEL_ON)
	{
		data |= (0x01 << offset);
	}

	/* Xor mode */
	else if (mode == PIXEL_XOR)
	{
		data ^= (0x01 << offset);
	}

	/* Final result copied to cache */
	LcdCache[index] = data;

	if (index < LoWaterMark)
	{
		/*  Update low marker. */
		LoWaterMark = index;
	}

	if (index > HiWaterMark)
	{
		/*  Update high marker. */
		HiWaterMark = index;
	}
	return OK;
}

/*
* Name         :  LcdLine
* Description  :  Draws a line between two points on the display.
* Argument(s)  :  x1, y1 -> Absolute pixel coordinates for line origin.
*                 x2, y2 -> Absolute pixel coordinates for line end.
*                 mode   -> Off, On or Xor. See enum in pcd8544.h.
* Return value :  see return value on pcd8544.h
*/
char LcdLine(char x1, char x2, char y1, char y2, LcdPixelMode mode)
{
	int dx, dy, stepx, stepy, fraction;
	char response;

	/* Calculate differential form */
	/* dy   y2 - y1 */
	/* -- = ------- */
	/* dx   x2 - x1 */

	/* Take differences */
	dy = y2 - y1;
	dx = x2 - x1;

	/* dy is negative */
	if (dy < 0)
	{
		dy = -dy;
		stepy = -1;
	}
	else
	{
		stepy = 1;
	}

	/* dx is negative */
	if (dx < 0)
	{
		dx = -dx;
		stepx = -1;
	}
	else
	{
		stepx = 1;
	}

	dx <<= 1;
	dy <<= 1;

	/* Draw initial position */
	response = LcdPixel(x1, y1, mode);
	if (response)
		return response;

	/* Draw next positions until end */
	if (dx > dy)
	{
		/* Take fraction */
		fraction = dy - (dx >> 1);
		while (x1 != x2)
		{
			if (fraction >= 0)
			{
				y1 += stepy;
				fraction -= dx;
			}
			x1 += stepx;
			fraction += dy;

			/* Draw calculated point */
			response = LcdPixel(x1, y1, mode);
			if (response)
				return response;

		}
	}
	else
	{
		/* Take fraction */
		fraction = dx - (dy >> 1);
		while (y1 != y2)
		{
			if (fraction >= 0)
			{
				x1 += stepx;
				fraction -= dy;
			}
			y1 += stepy;
			fraction += dx;

			/* Draw calculated point */
			response = LcdPixel(x1, y1, mode);
			if (response)
				return response;
		}
	}

	/* Set update flag to be true */
	UpdateLcd = TRUE;
	return OK;
}

/*
* Name         :  LcdSingleBar
* Description  :  Display single bar.
* Argument(s)  :  baseX  -> absolute x axis coordinate
*                 baseY  -> absolute y axis coordinate
*				   height -> height of bar (in pixel)
*				   width  -> width of bar (in pixel)
*				   mode   -> Off, On or Xor. See enum in pcd8544.h.
* Return value :  see return value on pcd8544.h
*/
char LcdSingleBar(char baseX, char baseY, char height, char width, LcdPixelMode mode)
{
	char tmpIdxX, tmpIdxY, tmp;

	char response;

	/* Checking border */
	if ((baseX > LCD_X_RES) || (baseY > LCD_Y_RES)) return OUT_OF_BORDER;

	if (height > baseY)
		tmp = 0;
	else
		tmp = baseY - height;

	/* Draw lines */
	for (tmpIdxY = tmp; tmpIdxY < baseY; tmpIdxY++)
	{
		for (tmpIdxX = baseX; tmpIdxX < (baseX + width); tmpIdxX++)
		{
			response = LcdPixel(tmpIdxX, tmpIdxY, mode);
			if (response)
				return response;

		}
	}

	/* Set update flag to be true */
	UpdateLcd = TRUE;
	return OK;
}

/*
* Name         :  LcdBars
* Description  :  Display multiple bars.
* Argument(s)  :  data[] -> data which want to be plotted
*                 numbBars  -> number of bars want to be plotted
*				   width  -> width of bar (in pixel)
* Return value :  see return value on pcd8544.h
* Note         :  Please check EMPTY_SPACE_BARS, BAR_X, BAR_Y in pcd8544.h
*/
char LcdBars(char data[], char numbBars, char width, char multiplier)
{
	char b;
	char tmpIdx = 0;
	char response;

	for (b = 0; b < numbBars; b++)
	{
		/* Preventing from out of border (LCD_X_RES) */
		if (tmpIdx > LCD_X_RES) return OUT_OF_BORDER;

		/* Calculate x axis */
		tmpIdx = ((width + EMPTY_SPACE_BARS) * b) + BAR_X;

		/* Draw single bar */
		response = LcdSingleBar(tmpIdx, BAR_Y, data[b] * multiplier, width, PIXEL_ON);
		if (response == OUT_OF_BORDER)
			return response;
	}

	/* Set update flag to be true */
	UpdateLcd = TRUE;
	return OK;

}
/*
* Name         :  LcdRect
* Description  :  Display a rectangle.
* Argument(s)  :  x1   -> absolute first x axis coordinate
*                 y1   -> absolute first y axis coordinate
*				   x2   -> absolute second x axis coordinate
*				   y2   -> absolute second y axis coordinate
*				   mode -> Off, On or Xor. See enum in pcd8544.h.
* Return value :  see return value on pcd8544.h.
*/
char LcdRect(char x1, char x2, char y1, char y2, LcdPixelMode mode)
{
	char tmpIdxX, tmpIdxY;
	char response;

	/* Checking border */
	if ((x1 > LCD_X_RES) || (x2 > LCD_X_RES) || (y1 > LCD_Y_RES) || (y2 > LCD_Y_RES))
		/* If out of border then return */
		return OUT_OF_BORDER;

	if ((x2 > x1) && (y2 > y1))
	{
		for (tmpIdxY = y1; tmpIdxY < y2; tmpIdxY++)
		{
			/* Draw line horizontally */
			for (tmpIdxX = x1; tmpIdxX < x2; tmpIdxX++)
			{
				/* Draw a pixel */
				response = LcdPixel(tmpIdxX, tmpIdxY, mode);
				if (response)
					return response;
			}
		}

		/* Set update flag to be true */
		UpdateLcd = TRUE;
	}
	return OK;
}
/*
* Name         :  LcdImage
* Description  :  Image mode display routine.
* Argument(s)  :  Address of image in hexes
* Return value :  None.
* Example      :  LcdImage(&sample_image_declared_as_array);
*/
void LcdImage(const char *imageData)
{
	/* Initialize cache index to 0 */
	//	LcdCacheIdx = 0;
	//	/* While within cache range */
	//    for ( LcdCacheIdx = 0; LcdCacheIdx < LCD_CACHE_SIZE; LcdCacheIdx++ )
	//    {
	//		/* Copy data from pointer to cache buffer */
	//        LcdCache[LcdCacheIdx] = pgm_read_byte( imageData++ );
	//    }
	/* optimized by Jakub Lasinski, version 0.2.6, March 14, 2009 */
	memcpy_P(LcdCache, imageData, LCD_CACHE_SIZE);	//Same as aboeve - 6 bytes less and faster instruction
													/* Reset watermark pointers to be full */
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
		LCD_PORT &= ~(_BV(LCD_DC_PIN));
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