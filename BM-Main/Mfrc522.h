#pragma once

#include <stdint.h>
#include "SPI.h"
#include "Utils\Utils.h"

constexpr char Idle_CMD = 0x00;
constexpr char Mem_CMD = 0x01;
constexpr char GenerateRandomId_CMD = 0x02;
constexpr char CalcCRC_CMD = 0x03;
constexpr char Transmit_CMD = 0x04;
constexpr char NoCmdChange_CMD = 0x07;
constexpr char Receive_CMD = 0x08;
constexpr char Transceive_CMD = 0x0C;
constexpr char Reserved_CMD = 0x0D;
constexpr char MFAuthent_CMD = 0x0E;
constexpr char SoftReset_CMD = 0x0F;


//Page 0 ==> Command and Status
constexpr char Page0_Reserved_1 =	0x00;
constexpr char CommandReg		=	0x01;
constexpr char ComIEnReg		=	0x02;
constexpr char DivIEnReg		=	0x03;
constexpr char ComIrqReg		=	0x04;
constexpr char DivIrqReg		=	0x05;
constexpr char ErrorReg			=0x06;
constexpr char Status1Reg = 0x07;
constexpr char Status2Reg = 0x08;
constexpr char FIFODataReg = 0x09;
constexpr char FIFOLevelReg = 0x0A;
constexpr char WaterLevelReg = 0x0B;
constexpr char ControlReg = 0x0C;
constexpr char BitFramingReg = 0x0D;
constexpr char CollReg = 0x0E;
constexpr char Page0_Reserved_2 = 0x0F;

//Page 1 ==> Command
#define Page1_Reserved_1	0x10
#define ModeReg				0x11
#define TxModeReg			0x12
#define RxModeReg			0x13
#define TxControlReg		0x14
#define TxASKReg			0x15
#define TxSelReg			0x16
#define RxSelReg			0x17
#define RxThresholdReg		0x18
#define	DemodReg			0x19
#define Page1_Reserved_2	0x1A
#define Page1_Reserved_3	0x1B
#define MfTxReg				0x1C
#define MfRxReg				0x1D
#define Page1_Reserved_4	0x1E
#define SerialSpeedReg		0x1F

//Page 2 ==> CFG
#define Page2_Reserved_1	0x20
#define CRCResultReg_1		0x21
#define CRCResultReg_2		0x22
#define Page2_Reserved_2	0x23
#define ModWidthReg			0x24
#define Page2_Reserved_3	0x25
#define RFCfgReg			0x26
#define GsNReg				0x27
#define CWGsPReg			0x28
#define ModGsPReg			0x29
#define TModeReg			0x2A
#define TPrescalerReg		0x2B
#define TReloadReg_1		0x2C
#define TReloadReg_2		0x2D
#define TCounterValReg_1	0x2E
#define TCounterValReg_2 	0x2F

//Page 3 ==> TestRegister
#define Page3_Reserved_1 	0x30
#define TestSel1Reg			0x31
#define TestSel2Reg			0x32
#define TestPinEnReg		0x33
#define TestPinValueReg		0x34
#define TestBusReg			0x35
#define AutoTestReg			0x36
#define VersionReg			0x37
#define AnalogTestReg		0x38
#define TestDAC1Reg			0x39
#define TestDAC2Reg			0x3A
#define TestADCReg			0x3B
#define Page3_Reserved_2 	0x3C
#define Page3_Reserved_3	0x3D
#define Page3_Reserved_4	0x3E
#define Page3_Reserved_5	0x3F

#define CARD_FOUND		1
#define CARD_NOT_FOUND	2
#define ERROR			3

#define MAX_LEN			16

//Card types
#define Mifare_UltraLight 	0x4400
#define Mifare_One_S50		0x0400
#define Mifare_One_S70		0x0200
#define Mifare_Pro_X		0x0800
#define Mifare_DESFire		0x4403

// Mifare_One card command word
# define PICC_REQIDL          0x26               // find the antenna area does not enter hibernation
# define PICC_REQALL          0x52               // find all the cards antenna area
# define PICC_ANTICOLL        0x93               // anti-collision
# define PICC_SElECTTAG       0x93               // election card
# define PICC_AUTHENT1A       0x60               // authentication key A
# define PICC_AUTHENT1B       0x61               // authentication key B
# define PICC_READ            0x30               // Read Block
# define PICC_WRITE           0xA0               // write block
# define PICC_DECREMENT       0xC0               // debit
# define PICC_INCREMENT       0xC1               // recharge
# define PICC_RESTORE         0xC2               // transfer block data to the buffer
# define PICC_TRANSFER        0xB0               // save the data in the buffer
# define PICC_HALT            0x50               // Sleep

void mfrc522_init();
void mfrc522_reset();
void mfrc522_write(uint8_t reg, uint8_t data);
uint8_t mfrc522_read(uint8_t reg);
uint8_t	mfrc522_request(uint8_t req_mode, uint8_t * tag_type);
uint8_t mfrc522_to_card(uint8_t cmd, uint8_t *send_data, uint8_t send_data_len, uint8_t *back_data, uint32_t *back_data_len);
uint8_t mfrc522_get_card_serial(uint8_t * serial_out);
using spi0 = spi::SPI<spi::Mode::m1, spi::ClkRate::clkRateDiv16>;

void mfrc522_init(uintptr_t* port)
{
	spi0::init(port,++port);
	uint8_t byte;
	mfrc522_reset();
	mfrc522_write(TModeReg, 0x8D);
	mfrc522_write(TPrescalerReg, 0x3E);
	mfrc522_write(TReloadReg_1, 30);
	mfrc522_write(TReloadReg_2, 0);
	mfrc522_write(TxASKReg, 0x40);
	mfrc522_write(ModeReg, 0x3D);

	byte = mfrc522_read(TxControlReg);
	if (!(byte & 0x03))
	{
		mfrc522_write(TxControlReg, byte | 0x03);
	}
}


void mfrc522_write(uint8_t reg, uint8_t data)
{
	//ENABLE_CHIP();
	spi0::spi_send((reg << 1) & 0x7E);
	spi0::spi_send(data);
	//DISABLE_CHIP();
}

uint8_t mfrc522_read(uint8_t reg)
{
	uint8_t data;
	//ENABLE_CHIP();
	spi0::spi_send(((reg << 1) & 0x7E) | 0x80);
	data = spi0::spi_send(0x00);
	//DISABLE_CHIP();
	return data;
}


void mfrc522_reset()
{
	mfrc522_write(CommandReg, SoftReset_CMD);
}
   /*
uint8_t	mfrc522_request(uint8_t req_mode, uint8_t * tag_type)
{
	uint8_t  status;
	uint32_t backBits;//The received data bits

	mfrc522_write(BitFramingReg, 0x07);//TxLastBists = BitFramingReg[2..0]	???

	tag_type[0] = req_mode;
	status = mfrc522_to_card(Transceive_CMD, tag_type, 1, tag_type, &backBits);

	if ((status != CARD_FOUND) || (backBits != 0x10))
	{
		status = ERROR;
	}

	return status;
}

uint8_t mfrc522_to_card(uint8_t cmd, uint8_t *send_data, uint8_t send_data_len, uint8_t *back_data, uint32_t *back_data_len)
{
	uint8_t status = ERROR;
	uint8_t irqEn = 0x00;
	uint8_t waitIRq = 0x00;
	uint8_t lastBits;
	uint8_t n;
	uint8_t	tmp;
	uint32_t i;

	switch (cmd)
	{
	case MFAuthent_CMD:		//Certification cards close
	{
		irqEn = 0x12;
		waitIRq = 0x10;
		break;
	}
	case Transceive_CMD:	//Transmit FIFO data
	{
		irqEn = 0x77;
		waitIRq = 0x30;
		break;
	}
	default:
		break;
	}

	//mfrc522_write(ComIEnReg, irqEn|0x80);	//Interrupt request
	n = mfrc522_read(ComIrqReg);
	mfrc522_write(ComIrqReg, n&(~0x80));//clear all interrupt bits
	n = mfrc522_read(FIFOLevelReg);
	mfrc522_write(FIFOLevelReg, n | 0x80);//flush FIFO data

	mfrc522_write(CommandReg, Idle_CMD);	//NO action; Cancel the current cmd???

											//Writing data to the FIFO
	for (i = 0; i<send_data_len; i++)
	{
		mfrc522_write(FIFODataReg, send_data[i]);
	}

	//Execute the cmd
	mfrc522_write(CommandReg, cmd);
	if (cmd == Transceive_CMD)
	{
		n = mfrc522_read(BitFramingReg);
		mfrc522_write(BitFramingReg, n | 0x80);
	}

	//Waiting to receive data to complete
	i = 2000;	//i according to the clock frequency adjustment, the operator M1 card maximum waiting time 25ms???
	do
	{
		//CommIrqReg[7..0]
		//Set1 TxIRq RxIRq IdleIRq HiAlerIRq LoAlertIRq ErrIRq TimerIRq
		n = mfrc522_read(ComIrqReg);
		i--;
	} while ((i != 0) && !(n & 0x01) && !(n&waitIRq));

	tmp = mfrc522_read(BitFramingReg);
	mfrc522_write(BitFramingReg, tmp&(~0x80));

	if (i != 0)
	{
		if (!(mfrc522_read(ErrorReg) & 0x1B))	//BufferOvfl Collerr CRCErr ProtecolErr
		{
			status = CARD_FOUND;
			if (n & irqEn & 0x01)
			{
				status = CARD_NOT_FOUND;			//??   
			}

			if (cmd == Transceive_CMD)
			{
				n = mfrc522_read(FIFOLevelReg);
				lastBits = mfrc522_read(ControlReg) & 0x07;
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
					back_data[i] = mfrc522_read(FIFODataReg);
				}
			}
		}
		else
		{
			status = ERROR;
		}

	}

	//SetBitMask(ControlReg,0x80);           //timer stops
	//mfrc522_write(cmdReg, PCD_IDLE); 

	return status;
}


uint8_t mfrc522_get_card_serial(uint8_t * serial_out)
{
	uint8_t status;
	uint8_t i;
	uint8_t serNumCheck = 0;
	uint32_t unLen;

	mfrc522_write(BitFramingReg, 0x00);		//TxLastBists = BitFramingReg[2..0]

	serial_out[0] = PICC_ANTICOLL;
	serial_out[1] = 0x20;
	status = mfrc522_to_card(Transceive_CMD, serial_out, 2, serial_out, &unLen);

	if (status == CARD_FOUND)
	{
		//Check card serial number
		for (i = 0; i<4; i++)
		{
			serNumCheck ^= serial_out[i];
		}
		if (serNumCheck != serial_out[i])
		{
			status = ERROR;
		}
	}
	return status;
}
*/