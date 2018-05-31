#pragma once
#include <stdint.h>

struct MifareOne {
	enum class CommandWord : uint8_t {
		PICC_REQIDL = 0x26,               // find the antenna area does not enter hibernation
		PICC_REQALL = 0x52,               // find all the cards antenna area
		PICC_ANTICOLL = 0x93,               // anti-collision
		PICC_SElECTTAG = 0x93,               // election card	  TODO: nachschauen ob die nummern wirklich gleich sind
		PICC_AUTHENT1A = 0x60,               // authentication key A
		PICC_AUTHENT1B = 0x61,               // authentication key B
		PICC_READ = 0x30,               // Read Block
		PICC_WRITE = 0xA0,               // write block
		PICC_DECREMENT = 0xC0,               // debit
		PICC_INCREMENT = 0xC1,               // recharge
		PICC_RESTORE = 0xC2,               // transfer block data to the buffer
		PICC_TRANSFER = 0xB0,               // save the data in the buffer
		PICC_HALT = 0x50
	};               // Sleep
};