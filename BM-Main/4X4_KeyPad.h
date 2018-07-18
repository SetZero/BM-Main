#pragma once
#include "hal\port.h"

template< typename Port>
class KeyPad {

public:
	static void init() {
		Port::ddr() = 0xf0;
	}

	static unsigned char getKey()
	{

		unsigned char ScanKey = 0xe0, i, key;

		for (i = 0; i<0x04; i++)           // Scan All the 4-Rows for key press
		{
			Port::get() = ScanKey + 0x0F;         // Select 1-Row at a time for Scanning the Key
			key = Port::read() & 0x0F;             // Read the Column, for key press

			if (key != 0x0F)             // If the KEY press is detected for the selected
				break;                   // ROW then stop Scanning,

			ScanKey = (ScanKey << 1) + 0x10; // Rotate the ScanKey to SCAN the remaining Rows
		}

		key = key + (ScanKey & 0xf0);  // Return the row and COL status to decode the key

		switch (key)                       // Decode the key
		{
		case 0xe7: key = '1'; break;	//
		case 0xeb: key = '2'; break;  //
		case 0xed: key = 'A'; break;//
		case 0xee: key = '3'; break; //
		case 0xd7: key = '*'; break; //
		case 0xdb: key = '1'; break; //
		case 0xdd: key = 'D'; break; //
		case 0xde: key = '#'; break;// 
		case 0xb7: key = '7'; break;//
		case 0xbb: key = '8'; break;//
		case 0xbd: key = 'C'; break;//
		case 0xbe: key = '9'; break; //
		case 0x77: key = '4'; break;//
		case 0x7b: key = '5'; break; //
		case 0x7d: key = 'B'; break; //
		case 0x7e: key = '6'; break; //
		default: key = 'z';
		}

		return key;
	}
};