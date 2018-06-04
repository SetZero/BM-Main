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
.global	__vector_18
	.type	__vector_18, @function
__vector_18:
	push r1	 ; 
	push r0	 ; 
	in r0,__SREG__	 ; ,
	push r0	 ; 
	clr __zero_reg__	 ; 
	push r18	 ; 
	push r24	 ; 
	push r25	 ; 
	push r30	 ; 
	push r31	 ; 
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 8 */
.L__stack_usage = 8
 ;  uart.c:375:     usr  = UART0_STATUS;
	lds r24,192	 ;  usr, MEM[(volatile uint8_t *)192B]
 ;  uart.c:376:     data = UART0_DATA;
	lds r25,198	 ;  data, MEM[(volatile uint8_t *)198B]
 ;  uart.c:390:     tmphead = ( UART_RxHead + 1) & UART_RX_BUFFER_MASK;
	lds r30,_ZL11UART_RxHead	 ;  UART_RxHead.0_1, UART_RxHead
	subi r30,lo8(-(1))	 ;  tmp54,
	andi r30,lo8(31)	 ;  tmphead,
 ;  uart.c:392:     if ( tmphead == UART_RxTail ) {
	lds r18,_ZL11UART_RxTail	 ;  UART_RxTail.2_3, UART_RxTail
	cp r18,r30	 ;  UART_RxTail.2_3, tmphead
	breq .L3	 ; ,
 ;  uart.c:382:     lastRxError = usr & (_BV(FE0)|_BV(DOR0)|_BV(UPE0) );
	andi r24,lo8(28)	 ;  lastRxError,
 ;  uart.c:397:         UART_RxHead = tmphead;
	sts _ZL11UART_RxHead,r30	 ;  UART_RxHead, tmphead
 ;  uart.c:399:         UART_RxBuf[tmphead] = data;
	ldi r31,0	 ;  _4
	subi r30,lo8(-(_ZL10UART_RxBuf))	 ;  tmp56,
	sbci r31,hi8(-(_ZL10UART_RxBuf))	 ;  tmp56,
	st Z,r25	 ;  UART_RxBuf, data
.L2:
 ;  uart.c:401:     UART_LastRxError |= lastRxError;   
	lds r25,_ZL16UART_LastRxError	 ;  UART_LastRxError.3_5, UART_LastRxError
	or r24,r25	 ;  _6, UART_LastRxError.3_5
	sts _ZL16UART_LastRxError,r24	 ;  UART_LastRxError, _6
/* epilogue start */
 ;  uart.c:402: }
	pop r31	 ; 
	pop r30	 ; 
	pop r25	 ; 
	pop r24	 ; 
	pop r18	 ; 
	pop r0	 ; 
	out __SREG__,r0	 ; ,
	pop r0	 ; 
	pop r1	 ; 
	reti
.L3:
 ;  uart.c:394:         lastRxError = UART_BUFFER_OVERFLOW >> 8;
	ldi r24,lo8(2)	 ;  lastRxError,
	rjmp .L2	 ; 
	.size	__vector_18, .-__vector_18
.global	__vector_19
	.type	__vector_19, @function
__vector_19:
	push r1	 ; 
	push r0	 ; 
	in r0,__SREG__	 ; ,
	push r0	 ; 
	clr __zero_reg__	 ; 
	push r24	 ; 
	push r25	 ; 
	push r30	 ; 
	push r31	 ; 
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 7 */
.L__stack_usage = 7
 ;  uart.c:414:     if ( UART_TxHead != UART_TxTail) {
	lds r25,_ZL11UART_TxHead	 ;  UART_TxHead.5_1, UART_TxHead
	lds r24,_ZL11UART_TxTail	 ;  UART_TxTail.6_2, UART_TxTail
	cp r25,r24	 ;  UART_TxHead.5_1, UART_TxTail.6_2
	breq .L5	 ; ,
 ;  uart.c:416:         tmptail = (UART_TxTail + 1) & UART_TX_BUFFER_MASK;
	lds r30,_ZL11UART_TxTail	 ;  UART_TxTail.7_3, UART_TxTail
	subi r30,lo8(-(1))	 ;  tmp51,
	andi r30,lo8(31)	 ;  tmptail,
 ;  uart.c:417:         UART_TxTail = tmptail;
	sts _ZL11UART_TxTail,r30	 ;  UART_TxTail, tmptail
 ;  uart.c:419:         UART0_DATA = UART_TxBuf[tmptail];  /* start transmission */
	ldi r31,0	 ;  _5
	subi r30,lo8(-(_ZL10UART_TxBuf))	 ;  tmp53,
	sbci r31,hi8(-(_ZL10UART_TxBuf))	 ;  tmp53,
	ld r24,Z	 ;  _6, UART_TxBuf
	sts 198,r24	 ;  MEM[(volatile uint8_t *)198B], _6
.L4:
/* epilogue start */
 ;  uart.c:424: }
	pop r31	 ; 
	pop r30	 ; 
	pop r25	 ; 
	pop r24	 ; 
	pop r0	 ; 
	out __SREG__,r0	 ; ,
	pop r0	 ; 
	pop r1	 ; 
	reti
.L5:
 ;  uart.c:422:         UART0_CONTROL &= ~_BV(UART0_UDRIE);
	lds r24,193	 ;  _7, MEM[(volatile uint8_t *)193B]
	andi r24,lo8(-33)	 ;  _8,
	sts 193,r24	 ;  MEM[(volatile uint8_t *)193B], _8
 ;  uart.c:424: }
	rjmp .L4	 ; 
	.size	__vector_19, .-__vector_19
.global	_Z9uart_initj
	.type	_Z9uart_initj, @function
_Z9uart_initj:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
 ;  uart.c:435:     UART_TxHead = 0;
	sts _ZL11UART_TxHead,__zero_reg__	 ;  UART_TxHead,
 ;  uart.c:436:     UART_TxTail = 0;
	sts _ZL11UART_TxTail,__zero_reg__	 ;  UART_TxTail,
 ;  uart.c:437:     UART_RxHead = 0;
	sts _ZL11UART_RxHead,__zero_reg__	 ;  UART_RxHead,
 ;  uart.c:438:     UART_RxTail = 0;
	sts _ZL11UART_RxTail,__zero_reg__	 ;  UART_RxTail,
 ;  uart.c:458:     if ( baudrate & 0x8000 )
	sbrs r25,7	 ;  baudrate,
	rjmp .L8	 ; 
 ;  uart.c:461:         UART0_STATUS = (1<<UART0_BIT_U2X);  //Enable 2x speed 
	ldi r18,lo8(2)	 ;  tmp49,
	sts 192,r18	 ;  MEM[(volatile uint8_t *)192B], tmp49
.L8:
 ;  uart.c:465:     UART0_UBRRH = (unsigned char)((baudrate>>8)&0x80) ;
	andi r25,lo8(-128)	 ;  _4,
	sts 197,r25	 ;  MEM[(volatile uint8_t *)197B], _4
 ;  uart.c:467:     UART0_UBRRL = (unsigned char) (baudrate&0x00FF);
	sts 196,r24	 ;  MEM[(volatile uint8_t *)196B], baudrate
 ;  uart.c:470:     UART0_CONTROL = _BV(UART0_BIT_RXCIE)|(1<<UART0_BIT_RXEN)|(1<<UART0_BIT_TXEN);
	ldi r24,lo8(-104)	 ;  tmp54,
	sts 193,r24	 ;  MEM[(volatile uint8_t *)193B], tmp54
 ;  uart.c:477:     UART0_CONTROLC = (1<<UART0_BIT_UCSZ1)|(1<<UART0_BIT_UCSZ0);
	ldi r24,lo8(6)	 ;  tmp56,
	sts 194,r24	 ;  MEM[(volatile uint8_t *)194B], tmp56
/* epilogue start */
 ;  uart.c:481: }/* uart_init */
	ret
	.size	_Z9uart_initj, .-_Z9uart_initj
.global	_Z9uart_getcv
	.type	_Z9uart_getcv, @function
_Z9uart_getcv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
 ;  uart.c:497:     if ( UART_RxHead == UART_RxTail ) {
	lds r25,_ZL11UART_RxHead	 ;  UART_RxHead.10_1, UART_RxHead
	lds r24,_ZL11UART_RxTail	 ;  UART_RxTail.11_2, UART_RxTail
	cp r25,r24	 ;  UART_RxHead.10_1, UART_RxTail.11_2
	breq .L11	 ; ,
 ;  uart.c:502:     tmptail = (UART_RxTail + 1) & UART_RX_BUFFER_MASK;
	lds r25,_ZL11UART_RxTail	 ;  UART_RxTail.12_3, UART_RxTail
	subi r25,lo8(-(1))	 ;  tmp55,
	andi r25,lo8(31)	 ;  tmptail,
 ;  uart.c:505:     data = UART_RxBuf[tmptail];
	mov r30,r25	 ;  _5, tmptail
	ldi r31,0	 ;  _5
	subi r30,lo8(-(_ZL10UART_RxBuf))	 ;  tmp57,
	sbci r31,hi8(-(_ZL10UART_RxBuf))	 ;  tmp57,
	ld r19,Z	 ;  data, UART_RxBuf
 ;  uart.c:506:     lastRxError = UART_LastRxError;
	lds r18,_ZL16UART_LastRxError	 ;  lastRxError, UART_LastRxError
 ;  uart.c:509:     UART_RxTail = tmptail; 
	sts _ZL11UART_RxTail,r25	 ;  UART_RxTail, tmptail
 ;  uart.c:511:     UART_LastRxError = 0;
	sts _ZL16UART_LastRxError,__zero_reg__	 ;  UART_LastRxError,
 ;  uart.c:512:     return (lastRxError << 8) + data;
	mov r24,r18	 ;  lastRxError, lastRxError
	ldi r25,0	 ;  lastRxError
	mov r25,r24	 ;  tmp59, lastRxError
	clr r24	 ;  tmp59
	add r24,r19	 ;  <retval>, data
	adc r25,__zero_reg__	 ;  <retval>
	ret
.L11:
 ;  uart.c:498:         return UART_NO_DATA;   /* no data available */
	ldi r24,0	 ;  <retval>
	ldi r25,lo8(1)	 ;  <retval>,
/* epilogue start */
 ;  uart.c:514: }/* uart_getc */
	ret
	.size	_Z9uart_getcv, .-_Z9uart_getcv
.global	_Z9uart_putch
	.type	_Z9uart_putch, @function
_Z9uart_putch:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
 ;  uart.c:528:     tmphead  = (UART_TxHead + 1) & UART_TX_BUFFER_MASK;
	lds r25,_ZL11UART_TxHead	 ;  UART_TxHead.13_1, UART_TxHead
	subi r25,lo8(-(1))	 ;  tmp50,
	andi r25,lo8(31)	 ;  tmphead,
.L13:
 ;  uart.c:530:     while ( tmphead == UART_TxTail ){
	lds r18,_ZL11UART_TxTail	 ;  UART_TxTail.15_3, UART_TxTail
	cp r18,r25	 ;  UART_TxTail.15_3, tmphead
	breq .L13	 ; ,
 ;  uart.c:534:     UART_TxBuf[tmphead] = data;
	mov r30,r25	 ;  _4, tmphead
	ldi r31,0	 ;  _4
	subi r30,lo8(-(_ZL10UART_TxBuf))	 ;  tmp52,
	sbci r31,hi8(-(_ZL10UART_TxBuf))	 ;  tmp52,
	st Z,r24	 ;  UART_TxBuf, data
 ;  uart.c:535:     UART_TxHead = tmphead;
	sts _ZL11UART_TxHead,r25	 ;  UART_TxHead, tmphead
 ;  uart.c:538:     UART0_CONTROL    |= _BV(UART0_UDRIE);
	lds r24,193	 ;  _5, MEM[(volatile uint8_t *)193B]
	ori r24,lo8(32)	 ;  _6,
	sts 193,r24	 ;  MEM[(volatile uint8_t *)193B], _6
/* epilogue start */
 ;  uart.c:540: }/* uart_putc */
	ret
	.size	_Z9uart_putch, .-_Z9uart_putch
.global	_Z9uart_putsPKc
	.type	_Z9uart_putsPKc, @function
_Z9uart_putsPKc:
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24	 ;  ivtmp.77, s
.L17:
 ;  uart.c:551:     while (*s) 
	ld r24,Y+	 ;  _1, MEM[base: _11, offset: 0B]
	tst r24	 ;  _1
	breq .L15	 ; ,
 ;  uart.c:552:       uart_putc(*s++);
	call _Z9uart_putch	 ; 
 ;  uart.c:551:     while (*s) 
	rjmp .L17	 ; 
.L15:
/* epilogue start */
 ;  uart.c:554: }/* uart_puts */
	pop r29	 ; 
	pop r28	 ; 
	ret
	.size	_Z9uart_putsPKc, .-_Z9uart_putsPKc
.global	_Z11uart_puts_pPKc
	.type	_Z11uart_puts_pPKc, @function
_Z11uart_puts_pPKc:
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24	 ;  ivtmp.83, progmem_s
.L20:
 ;  uart.c:567:     while ( (c = pgm_read_byte(progmem_s++)) ) 
	movw r30,r28	 ; , ivtmp.83
/* #APP */
 ;  567 "uart.c" 1
	lpm r24, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	adiw r28,1	 ;  ivtmp.83,
	tst r24	 ;  __result
	breq .L18	 ; ,
 ;  uart.c:568:       uart_putc(c);
	call _Z9uart_putch	 ; 
 ;  uart.c:567:     while ( (c = pgm_read_byte(progmem_s++)) ) 
	rjmp .L20	 ; 
.L18:
/* epilogue start */
 ;  uart.c:570: }/* uart_puts_p */
	pop r29	 ; 
	pop r28	 ; 
	ret
	.size	_Z11uart_puts_pPKc, .-_Z11uart_puts_pPKc
.global	__vector_21
	.type	__vector_21, @function
__vector_21:
	push r1	 ; 
	push r0	 ; 
	in r0,__SREG__	 ; ,
	push r0	 ; 
	clr __zero_reg__	 ; 
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
/* epilogue start */
 ;  ADC.h:69: }
	pop r0	 ; 
	out __SREG__,r0	 ; ,
	pop r0	 ; 
	pop r1	 ; 
	reti
	.size	__vector_21, .-__vector_21
	.section	.text._ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEh,"axG",@progbits,_ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEh,comdat
	.weak	_ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEh
	.type	_ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEh, @function
_ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEh:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
 ;  SPI.h:106: 			volatile typename UC::mem_width* spdr_adr = (typename UC::mem_width*)BMCPP::Hal::SPI<0>::spdr();
	in r30,0x30	 ;  _1, MEM[(volatile uintptr_t &)76B + 4]
	in r31,0x30+1	 ;  _1, MEM[(volatile uintptr_t &)76B + 4]
 ;  register.h:83:                 return hwRegister;
	in r26,0x2e	 ;  _4, MEM[(struct ControlRegister *)76B + 2B].hwRegister
	in r27,0x2e+1	 ;  _4, MEM[(struct ControlRegister *)76B + 2B].hwRegister
 ;  SPI.h:110: 			*spdr_adr = value;
	st Z,r24	 ;  *spdr_adr_5, value
 ;  SPI.h:112: 			while (!(*spsr_adr | (static_cast<uint8_t>(UC::SPI::spsr::SPIF0))));
	ld r24,X	 ;  vol.23_9, *spsr_adr_6
 ;  SPI.h:114: 			result = *spdr_adr;
	ld r24,Z	 ;  <retval>, *spdr_adr_5
/* epilogue start */
 ;  SPI.h:116: 		}
	ret
	.size	_ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEh, .-_ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEh
	.section	.text._ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_readEN17HardwareAddresses15CommandRegisterE,"axG",@progbits,_ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_readEN17HardwareAddresses15CommandRegisterE,comdat
	.weak	_ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_readEN17HardwareAddresses15CommandRegisterE
	.type	_ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_readEN17HardwareAddresses15CommandRegisterE, @function
_ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_readEN17HardwareAddresses15CommandRegisterE:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
 ;  Mfrc522.h:113: 		spi0::spi_send(static_cast<typename UC::mem_width>(reg));	 //TODO find out what 0x7E & 0x80
	call _ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEh	 ; 
 ;  Mfrc522.h:114: 		spi0::spi_send(v1 | v2);
	ldi r24,lo8(-2)	 ; ,
	call _ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEh	 ; 
 ;  Mfrc522.h:115: 		data = spi0::spi_send(static_cast<typename UC::mem_width>(Commands::Idle_CMD));
	ldi r24,0	 ; 
	jmp _ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEh	 ; 
	.size	_ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_readEN17HardwareAddresses15CommandRegisterE, .-_ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_readEN17HardwareAddresses15CommandRegisterE
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
 ;  Mfrc522.h:103: 		spi0::spi_send((static_cast<uint8_t>(reg) << v1) & v2);
	lsl r24	 ;  tmp49
	andi r24,lo8(126)	 ; ,
	call _ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEh	 ; 
 ;  Mfrc522.h:104: 		spi0::spi_send(data);
	mov r24,r28	 ; , data
/* epilogue start */
 ;  Mfrc522.h:106: 	}
	pop r28	 ; 
 ;  Mfrc522.h:104: 		spi0::spi_send(data);
	jmp _ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEh	 ; 
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
	in r24,0x4	 ;  _18, MEM[(volatile uint8_t &)35B + 1]
	ori r24,lo8(-96)	 ;  _19,
	out 0x4,r24	 ;  MEM[(volatile uint8_t &)35B + 1], _19
 ;  register.h:83:                 return hwRegister;
	in r30,0x2c	 ;  _20, MEM[(struct ControlRegister *)76B].hwRegister
	in r31,0x2c+1	 ;  _20, MEM[(struct ControlRegister *)76B].hwRegister
 ;  SPI.h:96: 			*spcr_adr = spcr;
	ldi r24,lo8(117)	 ;  tmp62,
	st Z,r24	 ;  *spcr_adr_22, tmp62
 ;  register.h:83:                 return hwRegister;
	in r30,0x2e	 ;  _23, MEM[(struct ControlRegister *)76B + 2B].hwRegister
	in r31,0x2e+1	 ;  _23, MEM[(struct ControlRegister *)76B + 2B].hwRegister
 ;  SPI.h:99: 			*spsr_adr = clockspeed;
	ldi r24,lo8(1)	 ;  tmp64,
	st Z,r24	 ;  *spsr_adr_25, tmp64
 ;  Mfrc522.h:121: 		mfrc522_write(CommandRegister::CommandReg, static_cast<uint8_t>(Commands::SoftReset_CMD));
	ldi r22,lo8(15)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
 ;  Mfrc522.h:86: 		mfrc522_write(CommandRegister::TModeReg, 0x8D);
	ldi r22,lo8(-115)	 ; ,
	ldi r24,lo8(42)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
 ;  Mfrc522.h:87: 		mfrc522_write(CommandRegister::TPrescalerReg, 0x3E);
	ldi r22,lo8(62)	 ; ,
	ldi r24,lo8(43)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
 ;  Mfrc522.h:88: 		mfrc522_write(CommandRegister::TReloadReg_1, 30);
	ldi r22,lo8(30)	 ; ,
	ldi r24,lo8(44)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
 ;  Mfrc522.h:89: 		mfrc522_write(CommandRegister::TReloadReg_2, 0);
	ldi r22,0	 ; 
	ldi r24,lo8(45)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
 ;  Mfrc522.h:90: 		mfrc522_write(CommandRegister::TxASKReg, 0x40);
	ldi r22,lo8(64)	 ; ,
	ldi r24,lo8(21)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
 ;  Mfrc522.h:91: 		mfrc522_write(CommandRegister::ModeReg, 0x3D);
	ldi r22,lo8(61)	 ; ,
	ldi r24,lo8(17)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
 ;  Mfrc522.h:93: 		byte = mfrc522_read(CommandRegister::TxControlReg);
	ldi r24,lo8(20)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_readEN17HardwareAddresses15CommandRegisterE	 ; 
 ;  Mfrc522.h:94: 		if (!(byte & 0x03))
	mov r25,r24	 ;  tmp65, byte
	andi r25,lo8(3)	 ;  tmp65,
	brne .L25	 ; ,
 ;  Mfrc522.h:96: 			mfrc522_write(CommandRegister::TxControlReg, byte | 0x03);
	mov r22,r24	 ;  tmp66, byte
	ori r22,lo8(3)	 ;  tmp66,
	ldi r24,lo8(20)	 ; ,
	jmp _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
.L25:
/* epilogue start */
 ;  Mfrc522.h:98: 	}
	ret
	.size	_ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_initINS0_3Hal4PortINS1_1BES2_EEEEvv, .-_ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_initINS0_3Hal4PortINS1_1BES2_EEEEvv
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
	push r28	 ; 
	push r29	 ; 
	 ; SP -= 5	 ; 
	rcall .
	rcall .
	push __zero_reg__
	in r28,__SP_L__	 ; 
	in r29,__SP_H__	 ; 
/* prologue: function */
/* frame size = 5 */
/* stack size = 7 */
.L__stack_usage = 7
 ;  main.cc:23: 	uart_init(UART_BAUD_SELECT(9600, F_CPU));
	ldi r24,lo8(103)	 ; ,
	ldi r25,0	 ; 
	call _Z9uart_initj	 ; 
 ;  main.cc:24: 	sei();
/* #APP */
 ;  24 "main.cc" 1
	sei
 ;  0 "" 2
 ;  main.cc:29: 	DDRB |= (1 << PB5);
/* #NOAPP */
	sbi 0x4,5	 ; ,
 ;  hal\port.h:95:                     Port::ddr() &= ~mask;
	cbi 0x4,5	 ; ,
 ;  hal\port.h:92:                     Port::ddr() |= mask;
	sbi 0x4,4	 ; ,
	sbi 0x4,3	 ; ,
 ;  main.cc:39: 	MFRC522<>::mfrc522_init<outB>();
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_initINS0_3Hal4PortINS1_1BES2_EEEEvv	 ; 
 ;  main.cc:40: 	uint8_t serialOut[4]{0,0,0,0};
	std Y+1,__zero_reg__	 ;  serialOut,
	std Y+2,__zero_reg__	 ;  serialOut,
	std Y+3,__zero_reg__	 ;  serialOut,
	std Y+4,__zero_reg__	 ;  serialOut,
 ;  Mfrc522.h:256: 		serial_out[0] = static_cast<uint8_t>(CardType::CommandWord::PICC_ANTICOLL);
	ldi r25,lo8(-109)	 ; ,
	mov r11,r25	 ;  tmp107,
 ;  Mfrc522.h:257: 		serial_out[1] = 0x20;
	ldi r18,lo8(32)	 ; ,
	mov r10,r18	 ;  tmp108,
.L39:
 ;  Mfrc522.h:254: 		mfrc522_write(CommandRegister::BitFramingReg, 0x00);		//TxLastBists = BitFramingReg[2..0]
	ldi r22,0	 ; 
	ldi r24,lo8(13)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
 ;  Mfrc522.h:256: 		serial_out[0] = static_cast<uint8_t>(CardType::CommandWord::PICC_ANTICOLL);
	std Y+1,r11	 ;  MEM[(uint8_t *)&serialOut], tmp107
 ;  Mfrc522.h:257: 		serial_out[1] = 0x20;
	std Y+2,r10	 ;  MEM[(uint8_t *)&serialOut + 1B], tmp108
 ;  Mfrc522.h:168: 		n = mfrc522_read(CommandRegister::ComIrqReg);
	ldi r24,lo8(4)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_readEN17HardwareAddresses15CommandRegisterE	 ; 
 ;  Mfrc522.h:169: 		mfrc522_write(CommandRegister::ComIrqReg, n&(~0x80));//clear all interrupt bits
	mov r22,r24	 ;  tmp109,
	andi r22,lo8(127)	 ;  tmp109,
	ldi r24,lo8(4)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
 ;  Mfrc522.h:170: 		n = mfrc522_read(CommandRegister::FIFOLevelReg);
	ldi r24,lo8(10)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_readEN17HardwareAddresses15CommandRegisterE	 ; 
 ;  Mfrc522.h:171: 		mfrc522_write(CommandRegister::FIFOLevelReg, n | 0x80);//flush FIFO data
	mov r22,r24	 ;  tmp110,
	ori r22,lo8(-128)	 ;  tmp110,
	ldi r24,lo8(10)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
 ;  Mfrc522.h:172: 		mfrc522_write(CommandRegister::CommandReg, static_cast<uint8_t>(Commands::Idle_CMD));	//NO action; Cancel the current cmd???
	ldi r22,0	 ; 
	ldi r24,lo8(1)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
 ;  Mfrc522.h:175: 			mfrc522_write(CommandRegister::FIFODataReg, send_data[i]);
	ldd r22,Y+1	 ; , MEM[(uint8_t *)&serialOut]
	ldi r24,lo8(9)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
	ldd r22,Y+2	 ; , MEM[(uint8_t *)&serialOut + 1B]
	ldi r24,lo8(9)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
 ;  Mfrc522.h:179: 		mfrc522_write(CommandRegister::CommandReg, static_cast<uint8_t>(cmd));
	ldi r22,lo8(12)	 ; ,
	ldi r24,lo8(1)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
 ;  Mfrc522.h:181: 			n = mfrc522_read(CommandRegister::BitFramingReg);
	ldi r24,lo8(13)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_readEN17HardwareAddresses15CommandRegisterE	 ; 
 ;  Mfrc522.h:182: 			mfrc522_write(CommandRegister::BitFramingReg, n | 0x80);
	mov r22,r24	 ;  tmp111,
	ori r22,lo8(-128)	 ;  tmp111,
	ldi r24,lo8(13)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
 ;  Mfrc522.h:190: 			n = mfrc522_read(CommandRegister::ComIrqReg);
	ldi r24,lo8(4)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_readEN17HardwareAddresses15CommandRegisterE	 ; 
	mov r17,r24	 ;  n,
 ;  Mfrc522.h:192: 		}  while ((i != 0) && !(n & 0x01) && !(n&waitIRq));
	andi r24,lo8(49)	 ;  tmp112,
	breq .+2	 ; 
	rjmp .L40	 ; 
 ;  Mfrc522.h:190: 			n = mfrc522_read(CommandRegister::ComIrqReg);
	ldi r24,lo8(4)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_readEN17HardwareAddresses15CommandRegisterE	 ; 
	mov r17,r24	 ;  n,
 ;  Mfrc522.h:191: 			i--;
	mov r12,__zero_reg__	 ;  i
	mov r13,__zero_reg__	 ;  i
	movw r14,r12	 ;  i
.L28:
 ;  Mfrc522.h:194: 		tmp = mfrc522_read(CommandRegister::BitFramingReg);
	ldi r24,lo8(13)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_readEN17HardwareAddresses15CommandRegisterE	 ; 
 ;  Mfrc522.h:195: 		mfrc522_write(CommandRegister::BitFramingReg, tmp&(~0x80));
	mov r22,r24	 ;  tmp113,
	andi r22,lo8(127)	 ;  tmp113,
	ldi r24,lo8(13)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
 ;  Mfrc522.h:197: 		if (i != 0) {
	or r12,r13	 ;  i
	or r12,r14	 ;  i
	or r12,r15	 ;  i
	brne .+2	 ; 
	rjmp .L30	 ; 
 ;  Mfrc522.h:198: 			if (!(mfrc522_read(CommandRegister::ErrorReg) & 0x1B))	{ //BufferOvfl Collerr CRCErr ProtecolErr
	ldi r24,lo8(6)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_readEN17HardwareAddresses15CommandRegisterE	 ; 
	andi r24,lo8(27)	 ;  tmp114,
	breq .+2	 ; 
	rjmp .L30	 ; 
 ;  Mfrc522.h:200: 				if (n & irqEn & 0x01) {
	sbrc r17,0	 ;  n,
	rjmp .L41	 ; 
 ;  Mfrc522.h:199: 				status = ErrorType::CARD_FOUND;
	ldi r24,lo8(1)	 ; ,
	std Y+5,r24	 ;  %sfp,
.L32:
 ;  Mfrc522.h:205: 					n = mfrc522_read(CommandRegister::FIFOLevelReg);
	ldi r24,lo8(10)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_readEN17HardwareAddresses15CommandRegisterE	 ; 
	mov r12,r24	 ;  n,
 ;  Mfrc522.h:206: 					lastBits = mfrc522_read(CommandRegister::ControlReg) & 0x07;
	ldi r24,lo8(12)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_readEN17HardwareAddresses15CommandRegisterE	 ; 
 ;  Mfrc522.h:218: 						n = 1;
	ldi r24,lo8(1)	 ;  n,
 ;  Mfrc522.h:216: 					if (n == 0)
	tst r12	 ;  n
	breq .L33	 ; ,
	mov r24,r12	 ;  n, n
	cpi r24,lo8(17)	 ;  n,
	brlo .L33	 ; ,
	ldi r24,lo8(16)	 ;  n,
.L33:
	movw r16,r28	 ;  ivtmp.107,
	subi r16,-1	 ;  ivtmp.107,
	sbci r17,-1	 ;  ivtmp.107,
 ;  Mfrc522.h:227: 					for (i = 0; i<n; i++)
	mov r4,__zero_reg__	 ;  i
	mov r5,__zero_reg__	 ;  i
	movw r6,r4	 ;  i
	movw r8,r16	 ; ,
	mov r12,r24	 ;  n, n
	mov r13,__zero_reg__	 ;  n
	mov r15,__zero_reg__	 ;  n
	mov r14,__zero_reg__	 ;  n
.L36:
	cp r4,r12	 ;  i, n
	cpc r5,r13	 ;  i, n
	cpc r6,r14	 ;  i, n
	cpc r7,r15	 ;  i, n
	brsh .L35	 ; ,
 ;  Mfrc522.h:229: 						back_data[i] = mfrc522_read(CommandRegister::FIFODataReg);
	ldi r24,lo8(9)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_readEN17HardwareAddresses15CommandRegisterE	 ; 
	movw r30,r16	 ; , ivtmp.107
	st Z+,r24	 ;  MEM[base: _62, offset: 0B],
	movw r16,r30	 ;  ivtmp.107,
 ;  Mfrc522.h:227: 					for (i = 0; i<n; i++)
	ldi r31,-1	 ; ,
	sub r4,r31	 ;  i,
	sbc r5,r31	 ;  i,
	sbc r6,r31	 ;  i,
	sbc r7,r31	 ;  i,
	rjmp .L36	 ; 
.L40:
 ;  Mfrc522.h:191: 			i--;
	mov r12,__zero_reg__	 ;  i
	mov r13,__zero_reg__	 ;  i
	movw r14,r12	 ;  i
	inc r12	 ;  i
	rjmp .L28	 ; 
.L41:
 ;  Mfrc522.h:201: 					status = ErrorType::CARD_NOT_FOUND;			//??   
	ldi r30,lo8(2)	 ; ,
	std Y+5,r30	 ;  %sfp,
	rjmp .L32	 ; 
.L35:
	ldd r25,Y+1	 ;  pretmp_167, MEM[(uint8_t *)&serialOut]
 ;  Mfrc522.h:260: 		if (status == ErrorType::CARD_FOUND)
	ldd r24,Y+5	 ; , %sfp
	cpi r24,lo8(1)	 ; ,
	brne .L37	 ; ,
 ;  Mfrc522.h:265: 				serNumCheck ^= serial_out[i];
	ldd r24,Y+2	 ;  MEM[(uint8_t *)&serialOut + 1B], MEM[(uint8_t *)&serialOut + 1B]
	eor r24,r25	 ;  serNumCheck, pretmp_167
	ldd r18,Y+3	 ;  MEM[(uint8_t *)&serialOut + 2B], MEM[(uint8_t *)&serialOut + 2B]
	eor r24,r18	 ;  serNumCheck, MEM[(uint8_t *)&serialOut + 2B]
	ldd r18,Y+4	 ;  MEM[(uint8_t *)&serialOut + 3B], MEM[(uint8_t *)&serialOut + 3B]
	eor r24,r18	 ;  serNumCheck, MEM[(uint8_t *)&serialOut + 3B]
 ;  Mfrc522.h:267: 			if (serNumCheck != serial_out[i])
	ldd r18,Y+5	 ;  MEM[(uint8_t *)&serialOut + 4B], MEM[(uint8_t *)&serialOut + 4B]
	cpse r18,r24	 ;  MEM[(uint8_t *)&serialOut + 4B], serNumCheck
	rjmp .L30	 ; 
.L37:
 ;  main.cc:43: 		if (MFRC522<>::mfrc522_get_card_serial<RFID::MifareOne>(serialOut) != ErrorType::ERROR && (serialOut[0] > 0 || serialOut[1] > 0 || serialOut[2] > 0 || serialOut[3] > 0)) {
	cpse r25,__zero_reg__	 ;  pretmp_167,
	rjmp .L38	 ; 
 ;  main.cc:43: 		if (MFRC522<>::mfrc522_get_card_serial<RFID::MifareOne>(serialOut) != ErrorType::ERROR && (serialOut[0] > 0 || serialOut[1] > 0 || serialOut[2] > 0 || serialOut[3] > 0)) {
	ldd r24,Y+2	 ;  serialOut, serialOut
	cpse r24,__zero_reg__	 ;  serialOut,
	rjmp .L38	 ; 
 ;  main.cc:43: 		if (MFRC522<>::mfrc522_get_card_serial<RFID::MifareOne>(serialOut) != ErrorType::ERROR && (serialOut[0] > 0 || serialOut[1] > 0 || serialOut[2] > 0 || serialOut[3] > 0)) {
	ldd r24,Y+3	 ;  serialOut, serialOut
	cpse r24,__zero_reg__	 ;  serialOut,
	rjmp .L38	 ; 
 ;  main.cc:43: 		if (MFRC522<>::mfrc522_get_card_serial<RFID::MifareOne>(serialOut) != ErrorType::ERROR && (serialOut[0] > 0 || serialOut[1] > 0 || serialOut[2] > 0 || serialOut[3] > 0)) {
	ldd r24,Y+4	 ;  serialOut, serialOut
	tst r24	 ;  serialOut
	breq .L30	 ; ,
.L38:
 ;  main.cc:44: 			uart_puts(reinterpret_cast<char*>(serialOut));
	movw r24,r8	 ; ,
	call _Z9uart_putsPKc	 ; 
.L30:
 ;  hal\port.h:102:                 Port::get() |= mask;
	sbi 0x5,3	 ; ,
 ;  main.cc:54: 		asm("nop");
/* #APP */
 ;  54 "main.cc" 1
	nop
 ;  0 "" 2
 ;  hal\port.h:105:                 Port::get() &= ~mask;
/* #NOAPP */
	cbi 0x5,3	 ; ,
	rjmp .L39	 ; 
	.size	main, .-main
	.local	_ZL16UART_LastRxError
	.comm	_ZL16UART_LastRxError,1,1
	.local	_ZL11UART_RxTail
	.comm	_ZL11UART_RxTail,1,1
	.local	_ZL11UART_RxHead
	.comm	_ZL11UART_RxHead,1,1
	.local	_ZL11UART_TxTail
	.comm	_ZL11UART_TxTail,1,1
	.local	_ZL11UART_TxHead
	.comm	_ZL11UART_TxHead,1,1
	.local	_ZL10UART_RxBuf
	.comm	_ZL10UART_RxBuf,32,1
	.local	_ZL10UART_TxBuf
	.comm	_ZL10UART_TxBuf,32,1
	.ident	"GCC: (GNU) 7.3.0"
.global __do_clear_bss
