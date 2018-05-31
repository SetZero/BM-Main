#pragma once

#include <stdint.h>
#include "SPI.h"
#include "Utils\Utils.h"
#include "RFID_Reader_Concepts.h"

enum class Commands : uint8_t {
	Idle_CMD = 0x00, Mem_CMD = 0x01,GenerateRandomId_CMD = 0x02,CalcCRC_CMD = 0x03,
	Transmit_CMD = 0x04, NoCmdChange_CMD = 0x07, Receive_CMD = 0x08,Transceive_CMD = 0x0C,
    Reserved_CMD = 0x0D,MFAuthent_CMD = 0x0E,SoftReset_CMD = 0x0F
};

enum class ReservedRegister : uint8_t {
	Page0_Reserved_1 = 0x00, Page0_Reserved_2 = 0x0F, Page1_Reserved_1 = 0x10, Page1_Reserved_2 = 0x1A,
	Page1_Reserved_3 = 0x1B, Page1_Reserved_4 = 0x1E, Page2_Reserved_1 = 0x20, Page2_Reserved_2 = 0x23,
	Page2_Reserved_3 = 0x25, Page3_Reserved_1 = 0x30, Page3_Reserved_2 = 0x3C,
	Page3_Reserved_3 = 0x3D, Page3_Reserved_4 = 0x3E, Page3_Reserved_5 = 0x3F };

enum class StatusRegister : uint8_t
{
	Status1Reg = 0x07, Status2Reg = 0x08
};

enum class CommandRegister : uint8_t {
	CommandReg = 0x01, ComIEnReg = 0x02, DivIEnReg = 0x03, ComIrqReg = 0x04, DivIrqReg = 0x05,  //Page 0 ==> Command and Status
	ErrorReg = 0x06, FIFODataReg = 0x09, FIFOLevelReg = 0x0A, WaterLevelReg = 0x0B, 
	ControlReg = 0x0C, BitFramingReg = 0x0D, CollReg = 0x0E, 
	ModeReg = 0x11, TxModeReg = 0x12, RxModeReg = 0x13, TxControlReg = 0x14, //Page 1 ==> Command
	TxASKReg = 0x15, TxSelReg = 0x16, RxSelReg = 0x17, RxThresholdReg = 0x18, DemodReg = 0x19,
	MfTxReg = 0x1C, MfRxReg = 0x1D, SerialSpeedReg = 0x1F,
	//CFG
	CRCResultReg_1 = 0x21, CRCResultReg_2 = 0x22, ModWidthReg = 0x24, RFCfgReg = 0x26, GsNReg = 0x27, //Page 2 ==> CFG
	CWGsPReg = 0x28, ModGsPReg = 0x29, TModeReg = 0x2A, TPrescalerReg = 0x2B, TReloadReg_1 = 0x2C,
	TReloadReg_2 = 0x2D, TCounterValReg_1 = 0x2E, TCounterValReg_2 = 0x2F
};

static constexpr char MAX_LEN = 16;

//Page 3 ==> TestRegister
enum class TestRegister : uint8_t {
TestSel1Reg = 0x31, TestSel2Reg = 0x32, TestPinEnReg = 0x33, TestPinValueReg = 0x34, TestBusReg	= 0x35,
AutoTestReg	= 0x36, VersionReg = 0x37, AnalogTestReg = 0x38, TestDAC1Reg = 0x39, TestDAC2Reg = 0x3A,
TestADCReg = 0x3B };

enum class ErrorType : uint8_t {
CARD_FOUND = 1, CARD_NOT_FOUND = 2, ERROR =	3	 };

//constexpr uint8_t MAX_LEN = 16;

enum class CardTypes : uint16_t {
Mifare_UltraLight =	0x4400, Mifare_One_S50	= 0x0400, Mifare_One_S70 = 0x0200,
Mifare_Pro_X = 0x0800, Mifare_DESFire = 0x4403 };

// Mifare_One card command word
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

void mfrc522_init(uintptr_t* port);
void mfrc522_reset();
void mfrc522_write(CommandRegister reg, uint8_t data);
uint8_t mfrc522_read(CommandRegister reg);
ErrorType mfrc522_request(uint8_t req_mode, uint8_t * tag_type);
ErrorType mfrc522_to_card(Commands cmd, uint8_t *send_data, uint8_t send_data_len, uint8_t *back_data, uint32_t *back_data_len);
ErrorType mfrc522_get_card_serial(uint8_t * serial_out);

using spi0 = spi::SPI<spi::Mode::m1, spi::ClkRate::clkRateDiv16>;

void mfrc522_init(uintptr_t* port) {
	//out port ----- ddr port
	spi0::init(port+2,++port);
	uint8_t byte;
	mfrc522_reset();
	mfrc522_write(CommandRegister::TModeReg, 0x8D);
	mfrc522_write(CommandRegister::TPrescalerReg, 0x3E);
	mfrc522_write(CommandRegister::TReloadReg_1, 30);
	mfrc522_write(CommandRegister::TReloadReg_2, 0);
	mfrc522_write(CommandRegister::TxASKReg, 0x40);
	mfrc522_write(CommandRegister::ModeReg, 0x3D);

	byte = mfrc522_read(CommandRegister::TxControlReg);
	if (!(byte & 0x03))
	{
		mfrc522_write(CommandRegister::TxControlReg, byte | 0x03);
	}
}

void mfrc522_write(CommandRegister reg, uint8_t data) {
	//ENABLE_CHIP();
	spi0::spi_send((static_cast<uint8_t>(reg) << 1) & 0x7E);
	spi0::spi_send(data);
	//DISABLE_CHIP();
}

uint8_t mfrc522_read(CommandRegister reg) {
	uint8_t data;
	//ENABLE_CHIP();
	spi0::spi_send(((static_cast<uint8_t>(reg) << 1) & 0x7E) | 0x80);	 //TODO find out what 0x7E & 0x80
	data = spi0::spi_send(static_cast<uint8_t>(Commands::Idle_CMD));
	//DISABLE_CHIP();
	return data;
}

void mfrc522_reset() {
	mfrc522_write(CommandRegister::CommandReg, static_cast<uint8_t>(Commands::SoftReset_CMD));
}

ErrorType mfrc522_request(uint8_t req_mode, uint8_t * tag_type) {
	ErrorType  status;
	uint32_t backBits;//The received data bits

	mfrc522_write(CommandRegister::BitFramingReg, 0x07);//TxLastBists = BitFramingReg[2..0]	???

	tag_type[0] = req_mode;
	status = mfrc522_to_card(Commands::Transceive_CMD, tag_type, 1, tag_type, &backBits);

	if ((status != ErrorType::CARD_FOUND) || (backBits != 0x10))
	{
		status = ErrorType::ERROR;
	}

	return status;
}

ErrorType mfrc522_to_card(Commands cmd, uint8_t *send_data, uint8_t send_data_len, uint8_t *back_data, uint32_t *back_data_len) {
	ErrorType status = ErrorType::ERROR;
	uint8_t irqEn = 0x00;
	uint8_t waitIRq = 0x00;
	uint8_t lastBits;
	uint8_t n;
	uint8_t	tmp;
	uint32_t i;	 //TODO get Clock frequenzy and calculate

	switch (cmd)
	{
	case  (Commands::MFAuthent_CMD):		//Certification cards close
	{
		irqEn = 0x12;
		waitIRq = 0x10;
		break;
	}
	case  (Commands::Transceive_CMD):	//Transmit FIFO data
	{
		irqEn = 0x77;
		waitIRq = 0x30;
		break;
	}
	default:
		break;
	}

	//mfrc522_write(CommandRegister::ComIEnReg, irqEn|0x80);	//Interrupt request
	n = mfrc522_read(CommandRegister::ComIrqReg);
	mfrc522_write(CommandRegister::ComIrqReg, n&(~0x80));//clear all interrupt bits
	n = mfrc522_read(CommandRegister::FIFOLevelReg);
	mfrc522_write(CommandRegister::FIFOLevelReg, n | 0x80);//flush FIFO data
	mfrc522_write(CommandRegister::CommandReg, static_cast<uint8_t>(Commands::Idle_CMD));	//NO action; Cancel the current cmd???
	//Writing data to the FIFO
	for (i = 0; i<send_data_len; i++) {
		mfrc522_write(CommandRegister::FIFODataReg, send_data[i]);
	}

	//Execute the cmd
	mfrc522_write(CommandRegister::CommandReg, static_cast<uint8_t>(cmd));
	if (cmd == Commands::Transceive_CMD)
	{
		n = mfrc522_read(CommandRegister::BitFramingReg);
		mfrc522_write(CommandRegister::BitFramingReg, n | 0x80);
	}

	//Waiting to receive data to complete
	//i according to the clock frequency adjustment, the operator M1 card maximum waiting time 25ms???
	do
	{
		//CommIrqReg[7..0]
		//Set1 TxIRq RxIRq IdleIRq HiAlerIRq LoAlertIRq ErrIRq TimerIRq
		n = mfrc522_read(CommandRegister::ComIrqReg);
		i--;
	} while ((i != 0) && !(n & 0x01) && !(n&waitIRq));

	tmp = mfrc522_read(CommandRegister::BitFramingReg);
	mfrc522_write(CommandRegister::BitFramingReg, tmp&(~0x80));

	if (i != 0)
	{
		if (!(mfrc522_read(CommandRegister::ErrorReg) & 0x1B))	//BufferOvfl Collerr CRCErr ProtecolErr
		{
			status = ErrorType::CARD_FOUND;
			if (n & irqEn & 0x01)
			{
				status = ErrorType::CARD_NOT_FOUND;			//??   
			}

			if (cmd == Commands::Transceive_CMD)
			{
				n = mfrc522_read(CommandRegister::FIFOLevelReg);
				lastBits = mfrc522_read(CommandRegister::ControlReg) & 0x07;
				if (lastBits)
				{
					*back_data_len = (n - 1) * 8 + lastBits;
				}
				else
				{
					*back_data_len = n * 8;
				}

				if (n == 0)
				{
					n = 1;
				}

				if (n > MAX_LEN)
				{
					n = MAX_LEN;
				}

				//Reading the received data in FIFO
				for (i = 0; i<n; i++)
				{
					back_data[i] = mfrc522_read(CommandRegister::FIFODataReg);
				}
			}
		}
		else
		{
			status = ErrorType::ERROR;
		}

	}

	//SetBitMask(ControlReg,0x80);           //timer stops
	//mfrc522_write(cmdReg, PCD_IDLE); 

	return status;
}

template<typename CardType>
ErrorType mfrc522_get_card_serial(uint8_t * serial_out) {
	static_assert(BMCPP::RFID::isCardType<CardType>(), "not a cardtype");
	ErrorType status;
	uint8_t i;
	uint8_t serNumCheck = 0;
	uint32_t unLen;

	mfrc522_write(CommandRegister::BitFramingReg, 0x00);		//TxLastBists = BitFramingReg[2..0]

	serial_out[0] = static_cast<uint8_t>(CardType::CommandWord::PICC_ANTICOLL);
	serial_out[1] = 0x20;
	status = mfrc522_to_card(Commands::Transceive_CMD, serial_out, 2, serial_out, &unLen);

	if (status == ErrorType::CARD_FOUND)
	{
		//Check card serial number
		for (i = 0; i<4; i++)
		{
			serNumCheck ^= serial_out[i];
		}
		if (serNumCheck != serial_out[i])
		{
			status = ErrorType::ERROR;
		}
	}
	return status;
}
