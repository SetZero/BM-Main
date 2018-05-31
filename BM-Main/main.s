	.file	"main.cc"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
 ;  GNU C++14 (GCC) version 7.3.0 (avr)
 ; 	compiled by GNU C version 5.3.0, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3, isl version isl-0.16.1-GMP

 ;  GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ;  options passed:  -I ./include -imultilib avr5
 ;  -iprefix f:\users\keven\downloads\avr-gcc-7.3.0-x64-mingw\bin\../lib/gcc/avr/7.3.0/
 ;  -D__AVR_ATmega328P__ -D__AVR_DEVICE_NAME__=atmega328p -D F_CPU=16000000
 ;  main.cc -mn-flash=1 -mmcu=avr5 -auxbase-strip main.s -Os -Wall -Wextra
 ;  -Wconversion -std=c++1z -fconcepts -fno-unwind-tables
 ;  -fno-threadsafe-statics -funsigned-char -funsigned-bitfields
 ;  -fshort-enums -fverbose-asm -mn-flash=1 -mno-skip-bug -fno-rtti
 ;  -fno-enforce-eh-specs -fno-exceptions
 ;  options enabled:  -Wmisspelled-isr -faggressive-loop-optimizations
 ;  -falign-functions -falign-jumps -falign-labels -falign-loops
 ;  -fauto-inc-dec -fbranch-count-reg -fchkp-check-incomplete-type
 ;  -fchkp-check-read -fchkp-check-write -fchkp-instrument-calls
 ;  -fchkp-narrow-bounds -fchkp-optimize -fchkp-store-bounds
 ;  -fchkp-use-static-bounds -fchkp-use-static-const-bounds
 ;  -fchkp-use-wrappers -fcode-hoisting -fcombine-stack-adjustments
 ;  -fcommon -fcompare-elim -fcprop-registers -fcrossjumping
 ;  -fcse-follow-jumps -fdefer-pop -fdevirtualize
 ;  -fdevirtualize-speculatively -fdwarf2-cfi-asm -fearly-inlining
 ;  -feliminate-unused-debug-types -fexpensive-optimizations
 ;  -fforward-propagate -ffp-int-builtin-inexact -ffunction-cse -fgcse
 ;  -fgcse-lm -fgnu-runtime -fgnu-unique -fguess-branch-probability
 ;  -fhoist-adjacent-loads -fident -fif-conversion -fif-conversion2
 ;  -findirect-inlining -finline -finline-atomics -finline-functions
 ;  -finline-functions-called-once -finline-small-functions -fipa-bit-cp
 ;  -fipa-cp -fipa-icf -fipa-icf-functions -fipa-icf-variables
 ;  -fipa-profile -fipa-pure-const -fipa-ra -fipa-reference -fipa-sra
 ;  -fipa-vrp -fira-hoist-pressure -fira-share-save-slots
 ;  -fira-share-spill-slots -fisolate-erroneous-paths-dereference -fivopts
 ;  -fkeep-static-consts -fleading-underscore -flifetime-dse -flra-remat
 ;  -flto-odr-type-merging -fmath-errno -fmerge-constants
 ;  -fmerge-debug-strings -fmove-loop-invariants -fomit-frame-pointer
 ;  -foptimize-sibling-calls -fpartial-inlining -fpeephole -fpeephole2
 ;  -fplt -fprefetch-loop-arrays -freg-struct-return -freorder-blocks
 ;  -freorder-functions -frerun-cse-after-loop
 ;  -fsched-critical-path-heuristic -fsched-dep-count-heuristic
 ;  -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
 ;  -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
 ;  -fsched-stalled-insns-dep -fschedule-fusion -fsemantic-interposition
 ;  -fshow-column -fshrink-wrap -fshrink-wrap-separate -fsigned-zeros
 ;  -fsplit-ivs-in-unroller -fsplit-wide-types -fssa-backprop -fssa-phiopt
 ;  -fstdarg-opt -fstore-merging -fstrict-aliasing -fstrict-overflow
 ;  -fstrict-volatile-bitfields -fsync-libcalls -fthread-jumps
 ;  -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp
 ;  -ftree-builtin-call-dce -ftree-ccp -ftree-ch -ftree-coalesce-vars
 ;  -ftree-copy-prop -ftree-dce -ftree-dominator-opts -ftree-dse
 ;  -ftree-forwprop -ftree-fre -ftree-loop-if-convert -ftree-loop-im
 ;  -ftree-loop-ivcanon -ftree-loop-optimize -ftree-parallelize-loops=
 ;  -ftree-phiprop -ftree-pre -ftree-pta -ftree-reassoc -ftree-scev-cprop
 ;  -ftree-sink -ftree-slsr -ftree-sra -ftree-switch-conversion
 ;  -ftree-tail-merge -ftree-ter -ftree-vrp -funit-at-a-time -fverbose-asm
 ;  -fzero-initialized-in-bss

	.text
	.section	.text._ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEj,"axG",@progbits,_ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEj,comdat
	.weak	_ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEj
	.type	_ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEj, @function
_ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEj:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
 ;  SPI.h:106: 			volatile uintptr_t* spdr_adr = (uintptr_t*)BMCPP::Hal::SPI<0>::spdr();
	in r30,0x30	 ;  _1, MEM[(volatile uintptr_t &)76B + 4]
	in r31,0x30+1	 ;  _1, MEM[(volatile uintptr_t &)76B + 4]
 ;  register.h:83:                 return hwRegister;
	in r26,0x2e	 ;  _4, MEM[(struct ControlRegister *)76B + 2B].hwRegister
	in r27,0x2e+1	 ;  _4, MEM[(struct ControlRegister *)76B + 2B].hwRegister
 ;  SPI.h:110: 			*spdr_adr = value;
	std Z+1,r25	 ;  *spdr_adr_5, value
	st Z,r24	 ;  *spdr_adr_5, value
 ;  SPI.h:112: 			while (!(*spsr_adr | (static_cast<uint8_t>(UC::SPI::spsr::SPIF0))));
	ld r24,X+	 ;  vol.1_9
	ld r25,X	 ;  vol.1_9
 ;  SPI.h:114: 			result = *spdr_adr;
	ld r24,Z	 ;  <retval>, *spdr_adr_5
	ldd r25,Z+1	 ;  <retval>, *spdr_adr_5
/* epilogue start */
 ;  SPI.h:117: 		}
	ret
	.size	_ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEj, .-_ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEj
	.section	.text._ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh,"axG",@progbits,_ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh,comdat
	.weak	_ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh
	.type	_ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh, @function
_ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh:
	push r28	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	mov r28,r22	 ;  data, data
 ;  Mfrc522.h:104: 		spi0::spi_send((static_cast<uint8_t>(reg) << 1) & 0x7E);
	ldi r25,0	 ;  reg
	lsl r24	 ;  tmp50
	rol r25	 ;  tmp50
	andi r24,126	 ; ,
	clr r25	 ; 
	call _ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEj	 ; 
 ;  Mfrc522.h:105: 		spi0::spi_send(data);
	mov r24,r28	 ; , data
	ldi r25,0	 ; 
/* epilogue start */
 ;  Mfrc522.h:107: 	}
	pop r28	 ; 
 ;  Mfrc522.h:105: 		spi0::spi_send(data);
	jmp _ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEj	 ; 
	.size	_ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh, .-_ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh
	.section	.text._ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_initINS0_3Hal4PortINS1_1BES2_EEEEvv,"axG",@progbits,_ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_initINS0_3Hal4PortINS1_1BES2_EEEEvv,comdat
	.weak	_ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_initINS0_3Hal4PortINS1_1BES2_EEEEvv
	.type	_ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_initINS0_3Hal4PortINS1_1BES2_EEEEvv, @function
_ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_initINS0_3Hal4PortINS1_1BES2_EEEEvv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
 ;  SPI.h:91: 			Port::get() |= MISO;
	sbi 0x5,6	 ; ,
 ;  SPI.h:92: 			Port::ddr() |= (MOSI | SCK) 	  // set outputs
	in r24,0x4	 ;  _25, MEM[(volatile uint8_t &)35B + 1]
	ori r24,lo8(-96)	 ;  _26,
	out 0x4,r24	 ;  MEM[(volatile uint8_t &)35B + 1], _26
 ;  register.h:83:                 return hwRegister;
	in r30,0x2c	 ;  _27, MEM[(struct ControlRegister *)76B].hwRegister
	in r31,0x2c+1	 ;  _27, MEM[(struct ControlRegister *)76B].hwRegister
 ;  SPI.h:96: 			*spcr_adr = spcr;
	ldi r24,lo8(117)	 ;  tmp63,
	ldi r25,0	 ; 
	std Z+1,r25	 ;  *spcr_adr_29, tmp63
	st Z,r24	 ;  *spcr_adr_29, tmp63
 ;  register.h:83:                 return hwRegister;
	in r30,0x2e	 ;  _30, MEM[(struct ControlRegister *)76B + 2B].hwRegister
	in r31,0x2e+1	 ;  _30, MEM[(struct ControlRegister *)76B + 2B].hwRegister
 ;  SPI.h:99: 			*spsr_adr = clockspeed;
	ldi r24,lo8(1)	 ;  tmp65,
	ldi r25,0	 ; 
	std Z+1,r25	 ;  *spsr_adr_32, tmp65
	st Z,r24	 ;  *spsr_adr_32, tmp65
 ;  Mfrc522.h:119: 		mfrc522_write(CommandRegister::CommandReg, static_cast<uint8_t>(Commands::SoftReset_CMD));
	ldi r22,lo8(15)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
 ;  Mfrc522.h:88: 		mfrc522_write(CommandRegister::TModeReg, 0x8D);
	ldi r22,lo8(-115)	 ; ,
	ldi r24,lo8(42)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
 ;  Mfrc522.h:89: 		mfrc522_write(CommandRegister::TPrescalerReg, 0x3E);
	ldi r22,lo8(62)	 ; ,
	ldi r24,lo8(43)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
 ;  Mfrc522.h:90: 		mfrc522_write(CommandRegister::TReloadReg_1, 30);
	ldi r22,lo8(30)	 ; ,
	ldi r24,lo8(44)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
 ;  Mfrc522.h:91: 		mfrc522_write(CommandRegister::TReloadReg_2, 0);
	ldi r22,0	 ; 
	ldi r24,lo8(45)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
 ;  Mfrc522.h:92: 		mfrc522_write(CommandRegister::TxASKReg, 0x40);
	ldi r22,lo8(64)	 ; ,
	ldi r24,lo8(21)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
 ;  Mfrc522.h:93: 		mfrc522_write(CommandRegister::ModeReg, 0x3D);
	ldi r22,lo8(61)	 ; ,
	ldi r24,lo8(17)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
 ;  Mfrc522.h:112: 		spi0::spi_send(((static_cast<uint8_t>(reg) << 1) & 0x7E) | 0x80);	 //TODO find out what 0x7E & 0x80
	ldi r24,lo8(-88)	 ; ,
	ldi r25,0	 ; 
	call _ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEj	 ; 
 ;  Mfrc522.h:113: 		data = spi0::spi_send(static_cast<uint8_t>(Commands::Idle_CMD));
	ldi r25,0	 ; 
	ldi r24,0	 ; 
	call _ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEj	 ; 
 ;  Mfrc522.h:96: 		if (!(byte & 0x03))
	mov r25,r24	 ;  tmp66, _21
	andi r25,lo8(3)	 ;  tmp66,
	brne .L3	 ; ,
 ;  Mfrc522.h:98: 			mfrc522_write(CommandRegister::TxControlReg, byte | 0x03);
	mov r22,r24	 ;  tmp67, _21
	ori r22,lo8(3)	 ;  tmp67,
	ldi r24,lo8(20)	 ; ,
	jmp _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
.L3:
/* epilogue start */
 ;  Mfrc522.h:100: 	}
	ret
	.size	_ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_initINS0_3Hal4PortINS1_1BES2_EEEEvv, .-_ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_initINS0_3Hal4PortINS1_1BES2_EEEEvv
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
 ;  SPI.h:91: 			Port::get() |= MISO;
	sbi 0x5,6	 ; ,
 ;  SPI.h:92: 			Port::ddr() |= (MOSI | SCK) 	  // set outputs
	in r24,0x4	 ;  _20, MEM[(volatile uint8_t &)35B + 1]
	ori r24,lo8(-96)	 ;  _21,
	out 0x4,r24	 ;  MEM[(volatile uint8_t &)35B + 1], _21
 ;  register.h:83:                 return hwRegister;
	in r30,0x2c	 ;  _22, MEM[(struct ControlRegister *)76B].hwRegister
	in r31,0x2c+1	 ;  _22, MEM[(struct ControlRegister *)76B].hwRegister
 ;  SPI.h:96: 			*spcr_adr = spcr;
	ldi r24,lo8(117)	 ;  tmp69,
	ldi r25,0	 ; 
	std Z+1,r25	 ;  *spcr_adr_24, tmp69
	st Z,r24	 ;  *spcr_adr_24, tmp69
 ;  register.h:83:                 return hwRegister;
	in r30,0x2e	 ;  _25, MEM[(struct ControlRegister *)76B + 2B].hwRegister
	in r31,0x2e+1	 ;  _25, MEM[(struct ControlRegister *)76B + 2B].hwRegister
 ;  SPI.h:99: 			*spsr_adr = clockspeed;
	ldi r24,lo8(1)	 ;  tmp71,
	ldi r25,0	 ; 
	std Z+1,r25	 ;  *spsr_adr_27, tmp71
	st Z,r24	 ;  *spsr_adr_27, tmp71
 ;  main.cc:22: 	MFRC522<>::mfrc522_init<BMCPP::Hal::Port<BMCPP::AVR::B>>();
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_initINS0_3Hal4PortINS1_1BES2_EEEEvv	 ; 
 ;  main.cc:23: 	DDRB |= (1 << PB5);
	sbi 0x4,5	 ; ,
 ;  hal\port.h:92:                     Port::ddr() |= mask;
	sbi 0x4,3	 ; ,
 ;  register.h:83:                 return hwRegister;
	in r24,0x2c	 ;  _13, MEM[(struct ControlRegister *)76B].hwRegister
	in r25,0x2c+1	 ;  _13, MEM[(struct ControlRegister *)76B].hwRegister
 ;  main.cc:32: 		test ^= (1 << 5);
	ldi r25,lo8(32)	 ;  tmp78,
.L6:
 ;  main.cc:32: 		test ^= (1 << 5);
	in r24,0x5	 ;  _3, MEM[(volatile uint8_t &)35B + 2]
	eor r24,r25	 ;  _4, tmp78
	out 0x5,r24	 ;  MEM[(volatile uint8_t &)35B + 2], _4
 ;  f:\users\keven\downloads\avr-gcc-7.3.0-x64-mingw\avr\include\util\delay.h:187: 	__builtin_avr_delay_cycles(__ticks_dc);
	ldi r18,lo8(1599999)	 ; ,
	ldi r19,hi8(1599999)	 ; ,
	ldi r24,hlo8(1599999)	 ; ,
1:	subi r18,1	 ; 
	sbci r19,0	 ; 
	sbci r24,0	 ; 
	brne 1b
	rjmp .
	nop
	rjmp .L6	 ; 
	.size	main, .-main
	.ident	"GCC: (GNU) 7.3.0"
