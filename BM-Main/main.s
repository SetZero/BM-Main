	.file	"main.cc"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
 ;  GNU C++17 (GCC) version 8.1.0 (avr)
 ; 	compiled by GNU C version 5.3.0, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3, isl version isl-0.18-GMP

 ;  GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ;  options passed:  -I ./include -imultilib avr5
 ;  -iprefix e:\programme\avr-gcc\bin\../lib/gcc/avr/8.1.0/
 ;  -D__AVR_ATmega328P__ -D__AVR_DEVICE_NAME__=atmega328p -D F_CPU=16000000
 ;  main.cc -mn-flash=1 -mmcu=avr5 -auxbase-strip main.s -Os -Wall -Wextra
 ;  -Wconversion -std=c++17 -fconcepts -fno-unwind-tables
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
 ;  -fstdarg-opt -fstore-merging -fstrict-aliasing
 ;  -fstrict-volatile-bitfields -fsync-libcalls -fthread-jumps
 ;  -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp
 ;  -ftree-builtin-call-dce -ftree-ccp -ftree-ch -ftree-coalesce-vars
 ;  -ftree-copy-prop -ftree-dce -ftree-dominator-opts -ftree-dse
 ;  -ftree-forwprop -ftree-fre -ftree-loop-if-convert -ftree-loop-im
 ;  -ftree-loop-ivcanon -ftree-loop-optimize -ftree-parallelize-loops=
 ;  -ftree-phiprop -ftree-pre -ftree-pta -ftree-reassoc -ftree-scev-cprop
 ;  -ftree-sink -ftree-slsr -ftree-sra -ftree-switch-conversion
 ;  -ftree-tail-merge -ftree-ter -ftree-vrp -funit-at-a-time -fverbose-asm
 ;  -fzero-initialized-in-bss -mgas-isr-prologues -mmain-is-OS_task

	.text
.global	__vector_18
	.type	__vector_18, @function
__vector_18:
	__gcc_isr 1	 ; 
	push r24		 ; 
	push r25		 ; 
	push r30		 ; 
	push r31		 ; 
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 4...8 */
.L__stack_usage = 4 + __gcc_isr.n_pushed
 ;  uart.c:375:     usr  = UART0_STATUS;
	lds r24,192	 ;  usr, MEM[(volatile uint8_t *)192B]
 ;  uart.c:376:     data = UART0_DATA;
	lds r25,198	 ;  data, MEM[(volatile uint8_t *)198B]
 ;  uart.c:390:     tmphead = ( UART_RxHead + 1) & UART_RX_BUFFER_MASK;
	lds r30,_ZL11UART_RxHead	 ;  UART_RxHead.0_1, UART_RxHead
 ;  uart.c:390:     tmphead = ( UART_RxHead + 1) & UART_RX_BUFFER_MASK;
	subi r30,lo8(-(1))	 ;  tmp54,
 ;  uart.c:390:     tmphead = ( UART_RxHead + 1) & UART_RX_BUFFER_MASK;
	andi r30,lo8(31)	 ;  tmphead,
 ;  uart.c:392:     if ( tmphead == UART_RxTail ) {
	lds r18,_ZL11UART_RxTail	 ;  UART_RxTail.2_3, UART_RxTail
 ;  uart.c:392:     if ( tmphead == UART_RxTail ) {
	cp r18,r30		 ;  UART_RxTail.2_3, tmphead
	breq .L3		 ; ,
 ;  uart.c:382:     lastRxError = usr & (_BV(FE0)|_BV(DOR0)|_BV(UPE0) );
	andi r24,lo8(28)	 ;  lastRxError,
 ;  uart.c:397:         UART_RxHead = tmphead;
	sts _ZL11UART_RxHead,r30	 ;  UART_RxHead, tmphead
 ;  uart.c:399:         UART_RxBuf[tmphead] = data;
	ldi r31,0		 ;  _4
 ;  uart.c:399:         UART_RxBuf[tmphead] = data;
	subi r30,lo8(-(_ZL10UART_RxBuf))	 ;  tmp56,
	sbci r31,hi8(-(_ZL10UART_RxBuf))	 ;  tmp56,
	st Z,r25		 ;  UART_RxBuf, data
.L2:
 ;  uart.c:401:     UART_LastRxError |= lastRxError;   
	lds r25,_ZL16UART_LastRxError	 ;  UART_LastRxError.3_5, UART_LastRxError
	or r24,r25		 ;  _6, UART_LastRxError.3_5
	sts _ZL16UART_LastRxError,r24	 ;  UART_LastRxError, _6
/* epilogue start */
 ;  uart.c:402: }
	pop r31		 ; 
	pop r30		 ; 
	pop r25		 ; 
	pop r24		 ; 
	__gcc_isr 2	 ; 
	reti	
.L3:
 ;  uart.c:394:         lastRxError = UART_BUFFER_OVERFLOW >> 8;
	ldi r24,lo8(2)	 ;  lastRxError,
	rjmp .L2		 ; 
	__gcc_isr 0,r18
	.size	__vector_18, .-__vector_18
.global	__vector_19
	.type	__vector_19, @function
__vector_19:
	__gcc_isr 1	 ; 
	push r25		 ; 
	push r30		 ; 
	push r31		 ; 
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 3...7 */
.L__stack_usage = 3 + __gcc_isr.n_pushed
 ;  uart.c:414:     if ( UART_TxHead != UART_TxTail) {
	lds r25,_ZL11UART_TxHead	 ;  UART_TxHead.5_1, UART_TxHead
	lds r24,_ZL11UART_TxTail	 ;  UART_TxTail.6_2, UART_TxTail
 ;  uart.c:414:     if ( UART_TxHead != UART_TxTail) {
	cp r25,r24		 ;  UART_TxHead.5_1, UART_TxTail.6_2
	breq .L5		 ; ,
 ;  uart.c:416:         tmptail = (UART_TxTail + 1) & UART_TX_BUFFER_MASK;
	lds r30,_ZL11UART_TxTail	 ;  UART_TxTail.7_3, UART_TxTail
 ;  uart.c:416:         tmptail = (UART_TxTail + 1) & UART_TX_BUFFER_MASK;
	subi r30,lo8(-(1))	 ;  tmp51,
 ;  uart.c:416:         tmptail = (UART_TxTail + 1) & UART_TX_BUFFER_MASK;
	andi r30,lo8(31)	 ;  tmptail,
 ;  uart.c:417:         UART_TxTail = tmptail;
	sts _ZL11UART_TxTail,r30	 ;  UART_TxTail, tmptail
 ;  uart.c:419:         UART0_DATA = UART_TxBuf[tmptail];  /* start transmission */
	ldi r31,0		 ;  _5
	subi r30,lo8(-(_ZL10UART_TxBuf))	 ;  tmp53,
	sbci r31,hi8(-(_ZL10UART_TxBuf))	 ;  tmp53,
	ld r24,Z		 ;  _6, UART_TxBuf
 ;  uart.c:419:         UART0_DATA = UART_TxBuf[tmptail];  /* start transmission */
	sts 198,r24	 ;  MEM[(volatile uint8_t *)198B], _6
.L4:
/* epilogue start */
 ;  uart.c:424: }
	pop r31		 ; 
	pop r30		 ; 
	pop r25		 ; 
	__gcc_isr 2	 ; 
	reti	
.L5:
 ;  uart.c:422:         UART0_CONTROL &= ~_BV(UART0_UDRIE);
	lds r24,193	 ;  _7, MEM[(volatile uint8_t *)193B]
	andi r24,lo8(-33)	 ;  _8,
	sts 193,r24	 ;  MEM[(volatile uint8_t *)193B], _8
 ;  uart.c:424: }
	rjmp .L4		 ; 
	__gcc_isr 0,r24
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
	rjmp .L8		 ; 
 ;  uart.c:461:         UART0_STATUS = (1<<UART0_BIT_U2X);  //Enable 2x speed 
	ldi r18,lo8(2)	 ;  tmp49,
	sts 192,r18	 ;  MEM[(volatile uint8_t *)192B], tmp49
.L8:
 ;  uart.c:465:     UART0_UBRRH = (unsigned char)((baudrate>>8)&0x80) ;
	andi r25,lo8(-128)	 ;  _4,
 ;  uart.c:465:     UART0_UBRRH = (unsigned char)((baudrate>>8)&0x80) ;
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
 ;  uart.c:497:     if ( UART_RxHead == UART_RxTail ) {
	cp r25,r24		 ;  UART_RxHead.10_1, UART_RxTail.11_2
	breq .L11		 ; ,
 ;  uart.c:502:     tmptail = (UART_RxTail + 1) & UART_RX_BUFFER_MASK;
	lds r25,_ZL11UART_RxTail	 ;  UART_RxTail.12_3, UART_RxTail
 ;  uart.c:502:     tmptail = (UART_RxTail + 1) & UART_RX_BUFFER_MASK;
	subi r25,lo8(-(1))	 ;  tmp55,
 ;  uart.c:502:     tmptail = (UART_RxTail + 1) & UART_RX_BUFFER_MASK;
	andi r25,lo8(31)	 ;  tmptail,
 ;  uart.c:505:     data = UART_RxBuf[tmptail];
	mov r30,r25	 ;  _5, tmptail
	ldi r31,0		 ;  _5
 ;  uart.c:505:     data = UART_RxBuf[tmptail];
	subi r30,lo8(-(_ZL10UART_RxBuf))	 ;  tmp57,
	sbci r31,hi8(-(_ZL10UART_RxBuf))	 ;  tmp57,
	ld r19,Z		 ;  data, UART_RxBuf
 ;  uart.c:506:     lastRxError = UART_LastRxError;
	lds r18,_ZL16UART_LastRxError	 ;  lastRxError, UART_LastRxError
 ;  uart.c:509:     UART_RxTail = tmptail; 
	sts _ZL11UART_RxTail,r25	 ;  UART_RxTail, tmptail
 ;  uart.c:511:     UART_LastRxError = 0;
	sts _ZL16UART_LastRxError,__zero_reg__	 ;  UART_LastRxError,
 ;  uart.c:512:     return (lastRxError << 8) + data;
	mov r24,r18	 ;  lastRxError, lastRxError
	ldi r25,0		 ;  lastRxError
	mov r25,r24	 ;  tmp59, lastRxError
	clr r24	 ;  tmp59
 ;  uart.c:512:     return (lastRxError << 8) + data;
	add r24,r19	 ;  <retval>, data
	adc r25,__zero_reg__	 ;  <retval>
 ;  uart.c:512:     return (lastRxError << 8) + data;
	ret	
.L11:
 ;  uart.c:498:         return UART_NO_DATA;   /* no data available */
	ldi r24,0		 ;  <retval>
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
 ;  uart.c:528:     tmphead  = (UART_TxHead + 1) & UART_TX_BUFFER_MASK;
	subi r25,lo8(-(1))	 ;  tmp50,
 ;  uart.c:528:     tmphead  = (UART_TxHead + 1) & UART_TX_BUFFER_MASK;
	andi r25,lo8(31)	 ;  tmphead,
.L13:
 ;  uart.c:530:     while ( tmphead == UART_TxTail ){
	lds r18,_ZL11UART_TxTail	 ;  UART_TxTail.15_3, UART_TxTail
	cp r18,r25		 ;  UART_TxTail.15_3, tmphead
	breq .L13		 ; ,
 ;  uart.c:534:     UART_TxBuf[tmphead] = data;
	mov r30,r25	 ;  _4, tmphead
	ldi r31,0		 ;  _4
 ;  uart.c:534:     UART_TxBuf[tmphead] = data;
	subi r30,lo8(-(_ZL10UART_TxBuf))	 ;  tmp52,
	sbci r31,hi8(-(_ZL10UART_TxBuf))	 ;  tmp52,
	st Z,r24		 ;  UART_TxBuf, data
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
	push r28		 ; 
	push r29		 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24	 ;  ivtmp.28, s
.L17:
 ;  uart.c:551:     while (*s) 
	ld r24,Y+		 ;  _1, MEM[base: _11, offset: 0B]
 ;  uart.c:551:     while (*s) 
	tst r24		 ;  _1
	breq .L15		 ; ,
 ;  uart.c:552:       uart_putc(*s++);
	call _Z9uart_putch	 ; 
 ;  uart.c:551:     while (*s) 
	rjmp .L17		 ; 
.L15:
/* epilogue start */
 ;  uart.c:554: }/* uart_puts */
	pop r29		 ; 
	pop r28		 ; 
	ret	
	.size	_Z9uart_putsPKc, .-_Z9uart_putsPKc
.global	_Z11uart_puts_pPKc
	.type	_Z11uart_puts_pPKc, @function
_Z11uart_puts_pPKc:
	push r28		 ; 
	push r29		 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24	 ;  ivtmp.32, progmem_s
.L20:
 ;  uart.c:567:     while ( (c = pgm_read_byte(progmem_s++)) ) 
	movw r30,r28	 ; , ivtmp.32
/* #APP */
 ;  567 "uart.c" 1
	lpm r24, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	adiw r28,1	 ;  ivtmp.32,
 ;  uart.c:567:     while ( (c = pgm_read_byte(progmem_s++)) ) 
	tst r24		 ;  __result
	breq .L18		 ; ,
 ;  uart.c:568:       uart_putc(c);
	call _Z9uart_putch	 ; 
 ;  uart.c:567:     while ( (c = pgm_read_byte(progmem_s++)) ) 
	rjmp .L20		 ; 
.L18:
/* epilogue start */
 ;  uart.c:570: }/* uart_puts_p */
	pop r29		 ; 
	pop r28		 ; 
	ret	
	.size	_Z11uart_puts_pPKc, .-_Z11uart_puts_pPKc
	.section	.text._ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEh,"axG",@progbits,_ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEh,comdat
	.weak	_ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEh
	.type	_ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEh, @function
_ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEh:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
 ;  SPI.h:106: 			volatile typename UC::Mem_Width* spdr_adr = (typename UC::Mem_Width*)BMCPP::Hal::SPI<0>::spdr();
	in r30,0x30	 ;  _1, MEM[(volatile uintptr_t &)76B + 4]
	in r31,0x30+1	 ;  _1, MEM[(volatile uintptr_t &)76B + 4]
 ;  register.h:83:                 return hwRegister;
	in r26,0x2e	 ;  _4, MEM[(struct ControlRegister *)76B + 2B].hwRegister
	in r27,0x2e+1	 ;  _4, MEM[(struct ControlRegister *)76B + 2B].hwRegister
 ;  SPI.h:110: 			*spdr_adr = value;
	st Z,r24		 ;  *spdr_adr_5, value
 ;  SPI.h:112: 			while (!(*spsr_adr | (static_cast<uint8_t>(UC::SPI::spsr::SPIF0))));
	ld r24,X		 ;  vol.21_9, *spsr_adr_6
 ;  SPI.h:114: 			result = *spdr_adr;
	ld r24,Z		 ;  <retval>, *spdr_adr_5
/* epilogue start */
 ;  SPI.h:116: 		}
	ret	
	.size	_ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEh, .-_ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEh
	.section	.text._ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh,"axG",@progbits,_ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh,comdat
	.weak	_ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh
	.type	_ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh, @function
_ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh:
	push r28		 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	mov r28,r22	 ;  data, data
 ;  Mfrc522.h:104: 		spi0::spi_send((static_cast<uint8_t>(reg) << v1) & v2);
	lsl r24		 ;  tmp49
 ;  Mfrc522.h:104: 		spi0::spi_send((static_cast<uint8_t>(reg) << v1) & v2);
	andi r24,lo8(126)	 ; ,
	call _ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEh	 ; 
 ;  Mfrc522.h:105: 		spi0::spi_send(data);
	mov r24,r28	 ; , data
/* epilogue start */
 ;  Mfrc522.h:107: 	}
	pop r28		 ; 
 ;  Mfrc522.h:105: 		spi0::spi_send(data);
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
	in r24,0x4	 ;  _19, MEM[(volatile uint8_t &)35B + 1]
	ori r24,lo8(-96)	 ;  _20,
 ;  SPI.h:92: 			Port::ddr() |= (MOSI | SCK) 	  // set outputs
	out 0x4,r24	 ;  MEM[(volatile uint8_t &)35B + 1], _20
 ;  register.h:83:                 return hwRegister;
	in r30,0x2c	 ;  _21, MEM[(struct ControlRegister *)76B].hwRegister
	in r31,0x2c+1	 ;  _21, MEM[(struct ControlRegister *)76B].hwRegister
 ;  SPI.h:96: 			*spcr_adr = spcr;
	ldi r24,lo8(117)	 ;  tmp62,
	st Z,r24		 ;  *spcr_adr_23, tmp62
 ;  register.h:83:                 return hwRegister;
	in r30,0x2e	 ;  _24, MEM[(struct ControlRegister *)76B + 2B].hwRegister
	in r31,0x2e+1	 ;  _24, MEM[(struct ControlRegister *)76B + 2B].hwRegister
 ;  SPI.h:99: 			*spsr_adr = clockspeed;
	ldi r24,lo8(1)	 ;  tmp64,
	st Z,r24		 ;  *spsr_adr_26, tmp64
 ;  Mfrc522.h:122: 		mfrc522_write(CommandRegister::CommandReg, static_cast<uint8_t>(Commands::SoftReset_CMD));
	ldi r22,lo8(15)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
 ;  Mfrc522.h:87: 		mfrc522_write(CommandRegister::TModeReg, 0x8D);
	ldi r22,lo8(-115)	 ; ,
	ldi r24,lo8(42)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
 ;  Mfrc522.h:88: 		mfrc522_write(CommandRegister::TPrescalerReg, 0x3E);
	ldi r22,lo8(62)	 ; ,
	ldi r24,lo8(43)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
 ;  Mfrc522.h:89: 		mfrc522_write(CommandRegister::TReloadReg_1, 30);
	ldi r22,lo8(30)	 ; ,
	ldi r24,lo8(44)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
 ;  Mfrc522.h:90: 		mfrc522_write(CommandRegister::TReloadReg_2, 0);
	ldi r22,0		 ; 
	ldi r24,lo8(45)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
 ;  Mfrc522.h:91: 		mfrc522_write(CommandRegister::TxASKReg, 0x40);
	ldi r22,lo8(64)	 ; ,
	ldi r24,lo8(21)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
 ;  Mfrc522.h:92: 		mfrc522_write(CommandRegister::ModeReg, 0x3D);
	ldi r22,lo8(61)	 ; ,
	ldi r24,lo8(17)	 ; ,
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
 ;  Mfrc522.h:114: 		spi0::spi_send(static_cast<typename UC::Mem_Width>(reg));	 //TODO find out what 0x7E & 0x80
	ldi r24,lo8(20)	 ; ,
	call _ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEh	 ; 
 ;  Mfrc522.h:115: 		spi0::spi_send(v1 | v2);
	ldi r24,lo8(-2)	 ; ,
	call _ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEh	 ; 
 ;  Mfrc522.h:116: 		data = spi0::spi_send(static_cast<typename UC::Mem_Width>(Commands::Idle_CMD));
	ldi r24,0		 ; 
	call _ZN3spi3SPIILNS_4ModeE1ELNS_7ClkRateE0ELb1ELb1ELb1EN5BMCPP3AVR9ATMega328EE8spi_sendEh	 ; 
 ;  Mfrc522.h:95: 		if (!(byte & 0x03))
	mov r25,r24	 ;  tmp65, data
	andi r25,lo8(3)	 ;  tmp65,
	brne .L23		 ; ,
 ;  Mfrc522.h:97: 			mfrc522_write(CommandRegister::TxControlReg, byte | 0x03);
	mov r22,r24	 ;  tmp66, data
	ori r22,lo8(3)	 ;  tmp66,
	ldi r24,lo8(20)	 ; ,
	jmp _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE13mfrc522_writeEN17HardwareAddresses15CommandRegisterEh	 ; 
.L23:
/* epilogue start */
 ;  Mfrc522.h:99: 	}
	ret	
	.size	_ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_initINS0_3Hal4PortINS1_1BES2_EEEEvv, .-_ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_initINS0_3Hal4PortINS1_1BES2_EEEEvv
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"TEST"
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
 ;  main.cc:23: 	uart_init(UART_BAUD_SELECT(9600, F_CPU));
	ldi r24,lo8(103)	 ; ,
	ldi r25,0		 ; 
	call _Z9uart_initj	 ; 
 ;  main.cc:24: 	sei();
/* #APP */
 ;  24 "main.cc" 1
	sei	
 ;  0 "" 2
 ;  SPI.h:91: 			Port::get() |= MISO;
/* #NOAPP */
	sbi 0x5,6	 ; ,
 ;  SPI.h:92: 			Port::ddr() |= (MOSI | SCK) 	  // set outputs
	in r24,0x4	 ;  _23, MEM[(volatile uint8_t &)35B + 1]
	ori r24,lo8(-96)	 ;  _24,
 ;  SPI.h:92: 			Port::ddr() |= (MOSI | SCK) 	  // set outputs
	out 0x4,r24	 ;  MEM[(volatile uint8_t &)35B + 1], _24
 ;  register.h:83:                 return hwRegister;
	in r30,0x2c	 ;  _25, MEM[(struct ControlRegister *)76B].hwRegister
	in r31,0x2c+1	 ;  _25, MEM[(struct ControlRegister *)76B].hwRegister
 ;  SPI.h:96: 			*spcr_adr = spcr;
	ldi r24,lo8(117)	 ;  tmp69,
	st Z,r24		 ;  *spcr_adr_27, tmp69
 ;  register.h:83:                 return hwRegister;
	in r30,0x2e	 ;  _28, MEM[(struct ControlRegister *)76B + 2B].hwRegister
	in r31,0x2e+1	 ;  _28, MEM[(struct ControlRegister *)76B + 2B].hwRegister
 ;  SPI.h:99: 			*spsr_adr = clockspeed;
	ldi r24,lo8(1)	 ;  tmp71,
	st Z,r24		 ;  *spsr_adr_30, tmp71
 ;  main.cc:28: 	MFRC522<>::mfrc522_init<BMCPP::Hal::Port<BMCPP::AVR::B>>();
	call _ZN7MFRC522IN5BMCPP3AVR9ATMega328EE12mfrc522_initINS0_3Hal4PortINS1_1BES2_EEEEvv	 ; 
 ;  main.cc:29: 	DDRB |= (1 << PB5);
	sbi 0x4,5	 ; ,
 ;  hal\port.h:92:                     Port::ddr() |= mask;
	sbi 0x4,3	 ; ,
 ;  register.h:83:                 return hwRegister;
	in r24,0x2c	 ;  _16, MEM[(struct ControlRegister *)76B].hwRegister
	in r25,0x2c+1	 ;  _16, MEM[(struct ControlRegister *)76B].hwRegister
 ;  main.cc:39: 		test ^= (1 << 5);
	ldi r28,lo8(32)	 ;  tmp78,
.L26:
 ;  main.cc:37: 		uart_puts("TEST");
	ldi r24,lo8(.LC0)	 ; ,
	ldi r25,hi8(.LC0)	 ; ,
	call _Z9uart_putsPKc	 ; 
 ;  main.cc:39: 		test ^= (1 << 5);
	in r24,0x5	 ;  _3, MEM[(volatile uint8_t &)35B + 2]
	eor r24,r28	 ;  _4, tmp78
	out 0x5,r24	 ;  MEM[(volatile uint8_t &)35B + 2], _4
 ;  e:\programme\avr-gcc\avr\include\util\delay.h:187: 	__builtin_avr_delay_cycles(__ticks_dc);
	ldi r18,lo8(1599999)	 ; ,
	ldi r24,hi8(1599999)	 ; ,
	ldi r25,hlo8(1599999)	 ; ,
1:	subi r18,1	 ; 
	sbci r24,0	 ; 
	sbci r25,0	 ; 
	brne 1b
	rjmp .	
	nop	
	rjmp .L26		 ; 
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
	.ident	"GCC: (GNU) 8.1.0"
.global __do_copy_data
.global __do_clear_bss
