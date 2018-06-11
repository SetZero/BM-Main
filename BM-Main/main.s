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
	movw r28,r24	 ;  ivtmp.69, s
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
	movw r28,r24	 ;  ivtmp.75, progmem_s
.L20:
 ;  uart.c:567:     while ( (c = pgm_read_byte(progmem_s++)) ) 
	movw r30,r28	 ; , ivtmp.75
/* #APP */
 ;  567 "uart.c" 1
	lpm r24, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	adiw r28,1	 ;  ivtmp.75,
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
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
 ;  main.cc:22: 	uart_init(UART_BAUD_SELECT(9600, F_CPU));
	ldi r24,lo8(103)	 ; ,
	ldi r25,0	 ; 
	call _Z9uart_initj	 ; 
 ;  main.cc:23: 	sei();
/* #APP */
 ;  23 "main.cc" 1
	sei
 ;  0 "" 2
 ;  main.cc:28: 	DDRB |= (1 << PB5);
/* #NOAPP */
	sbi 0x4,5	 ; ,
 ;  register.h:44:                 hwRegister = (static_cast<value_type>(v) | ...);
	ldi r24,lo8(64)	 ;  tmp70,
	ldi r25,lo8(1)	 ;  tmp72,
 ;  spi_hal.h:51: 				*spi()->Spdr = value;
	ldi r18,lo8(22)	 ;  tmp74,
.L24:
 ;  hal\port.h:75:                 Port::get() |= mask;
	sbi 0x5,3	 ; ,
 ;  hal\port.h:78:                 Port::get() &= ~mask;
	cbi 0x5,4	 ; ,
 ;  hal\port.h:75:                 Port::get() |= mask;
	sbi 0x5,2	 ; ,
	sbi 0x5,5	 ; ,
 ;  register.h:73: 				hwRegister &= static_cast<value_type>(0);
	in r19,0x2c	 ;  vol.20_13, MEM[(struct ControlRegister *)76B].hwRegister
	out 0x2c,__zero_reg__	 ;  MEM[(struct ControlRegister *)76B].hwRegister,
 ;  register.h:44:                 hwRegister = (static_cast<value_type>(v) | ...);
	out 0x2c,r24	 ;  MEM[(struct ControlRegister *)76B].hwRegister, tmp70
	out 0x2d,r25	 ;  MEM[(struct ControlRegister *)76B + 1B].hwRegister, tmp72
 ;  spi_hal.h:51: 				*spi()->Spdr = value;
	out 0x2e,r18	 ;  MEM[(volatile value_type &)76B + 2], tmp74
.L23:
 ;  SPI.h:153: 			while ((SPSR & (1 << SPIF)) == 0);
	in __tmp_reg__,0x2d	 ; 
	sbrs __tmp_reg__,7	 ; 
	rjmp .L23	 ; 
 ;  SPI.h:154: 			return spi_hal::readSPDR();
	in r19,0x2e	 ;  _12, MEM[(volatile mem_width &)76B + 2]
	rjmp .L24	 ; 
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
	.local	_ZL4data
	.comm	_ZL4data,1,1
	.ident	"GCC: (GNU) 7.3.0"
.global __do_clear_bss
