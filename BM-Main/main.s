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
.global	_ZN5timer14timerInterrupt6recordEPS_
	.type	_ZN5timer14timerInterrupt6recordEPS_, @function
_ZN5timer14timerInterrupt6recordEPS_:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
 ;  ADC.h:121: 	ownerTimer = t;
	sts _ZN5timer14timerInterrupt10ownerTimerE+1,r25	 ;  ownerTimer, t
	sts _ZN5timer14timerInterrupt10ownerTimerE,r24	 ;  ownerTimer, t
/* epilogue start */
 ;  ADC.h:122: }
	ret	
	.size	_ZN5timer14timerInterrupt6recordEPS_, .-_ZN5timer14timerInterrupt6recordEPS_
.global	__vector_21
	.type	__vector_21, @function
__vector_21:
	__gcc_isr 1	 ; 
	push r25		 ; 
	push r26		 ; 
	push r27		 ; 
	push r30		 ; 
	push r31		 ; 
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 5...9 */
.L__stack_usage = 5 + __gcc_isr.n_pushed
 ;  ADC.h:125: 	if (ownerTimer != 0)
	lds r30,_ZN5timer14timerInterrupt10ownerTimerE	 ;  ownerTimer.0_1, ownerTimer
	lds r31,_ZN5timer14timerInterrupt10ownerTimerE+1	 ;  ownerTimer.0_1, ownerTimer
 ;  ADC.h:125: 	if (ownerTimer != 0)
	sbiw r30,0	 ;  ownerTimer.0_1,
	breq .L3		 ; ,
 ;  ADC.h:126: 		++ownerTimer->i;
	ld r24,Z	 ;  _2, ownerTimer.0_1->i
	ldd r25,Z+1	 ;  _2, ownerTimer.0_1->i
	ldd r26,Z+2	 ;  _2, ownerTimer.0_1->i
	ldd r27,Z+3	 ;  _2, ownerTimer.0_1->i
 ;  ADC.h:126: 		++ownerTimer->i;
	adiw r24,1	 ;  _3,
	adc r26,__zero_reg__	 ;  _3
	adc r27,__zero_reg__	 ;  _3
	st Z,r24	 ;  ownerTimer.0_1->i, _3
	std Z+1,r25	 ;  ownerTimer.0_1->i, _3
	std Z+2,r26	 ;  ownerTimer.0_1->i, _3
	std Z+3,r27	 ;  ownerTimer.0_1->i, _3
.L3:
 ;  ADC.h:127: 	ADCSRA |= (1 << ADSC);
	lds r24,122	 ;  _4, MEM[(volatile uint8_t *)122B]
	ori r24,lo8(64)	 ;  _5,
	sts 122,r24	 ;  MEM[(volatile uint8_t *)122B], _5
/* epilogue start */
 ;  ADC.h:128: }
	pop r31		 ; 
	pop r30		 ; 
	pop r27		 ; 
	pop r26		 ; 
	pop r25		 ; 
	__gcc_isr 2	 ; 
	reti	
	__gcc_isr 0,r24
	.size	__vector_21, .-__vector_21
.global	_ZN5timerC2Ev
	.type	_ZN5timerC2Ev, @function
_ZN5timerC2Ev:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
 ;  ADC.h:130: timer::timer() : i(0) {
	movw r30,r24	 ; , this
	st Z,__zero_reg__	 ;  this_2(D)->i,
	std Z+1,__zero_reg__	 ;  this_2(D)->i,
	std Z+2,__zero_reg__	 ;  this_2(D)->i,
	std Z+3,__zero_reg__	 ;  this_2(D)->i,
 ;  ADC.h:121: 	ownerTimer = t;
	sts _ZN5timer14timerInterrupt10ownerTimerE+1,r25	 ;  ownerTimer, this
	sts _ZN5timer14timerInterrupt10ownerTimerE,r24	 ;  ownerTimer, this
 ;  ADC.h:132: 	sei();
/* #APP */
 ;  132 "ADC.h" 1
	sei	
 ;  0 "" 2
/* #NOAPP */
/* epilogue start */
 ;  ADC.h:133: }
	ret	
	.size	_ZN5timerC2Ev, .-_ZN5timerC2Ev
.global	_ZN5timerC1Ev
	.set	_ZN5timerC1Ev,_ZN5timerC2Ev
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
	lds r30,_ZL11UART_RxHead	 ;  UART_RxHead.2_1, UART_RxHead
 ;  uart.c:390:     tmphead = ( UART_RxHead + 1) & UART_RX_BUFFER_MASK;
	subi r30,lo8(-(1))	 ;  tmp54,
 ;  uart.c:390:     tmphead = ( UART_RxHead + 1) & UART_RX_BUFFER_MASK;
	andi r30,lo8(31)	 ;  tmphead,
 ;  uart.c:392:     if ( tmphead == UART_RxTail ) {
	lds r18,_ZL11UART_RxTail	 ;  UART_RxTail.4_3, UART_RxTail
 ;  uart.c:392:     if ( tmphead == UART_RxTail ) {
	cp r18,r30		 ;  UART_RxTail.4_3, tmphead
	breq .L10		 ; ,
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
.L9:
 ;  uart.c:401:     UART_LastRxError |= lastRxError;   
	lds r25,_ZL16UART_LastRxError	 ;  UART_LastRxError.5_5, UART_LastRxError
	or r24,r25		 ;  _6, UART_LastRxError.5_5
	sts _ZL16UART_LastRxError,r24	 ;  UART_LastRxError, _6
/* epilogue start */
 ;  uart.c:402: }
	pop r31		 ; 
	pop r30		 ; 
	pop r25		 ; 
	pop r24		 ; 
	__gcc_isr 2	 ; 
	reti	
.L10:
 ;  uart.c:394:         lastRxError = UART_BUFFER_OVERFLOW >> 8;
	ldi r24,lo8(2)	 ;  lastRxError,
	rjmp .L9		 ; 
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
	lds r25,_ZL11UART_TxHead	 ;  UART_TxHead.7_1, UART_TxHead
	lds r24,_ZL11UART_TxTail	 ;  UART_TxTail.8_2, UART_TxTail
 ;  uart.c:414:     if ( UART_TxHead != UART_TxTail) {
	cp r25,r24		 ;  UART_TxHead.7_1, UART_TxTail.8_2
	breq .L12		 ; ,
 ;  uart.c:416:         tmptail = (UART_TxTail + 1) & UART_TX_BUFFER_MASK;
	lds r30,_ZL11UART_TxTail	 ;  UART_TxTail.9_3, UART_TxTail
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
.L11:
/* epilogue start */
 ;  uart.c:424: }
	pop r31		 ; 
	pop r30		 ; 
	pop r25		 ; 
	__gcc_isr 2	 ; 
	reti	
.L12:
 ;  uart.c:422:         UART0_CONTROL &= ~_BV(UART0_UDRIE);
	lds r24,193	 ;  _7, MEM[(volatile uint8_t *)193B]
	andi r24,lo8(-33)	 ;  _8,
	sts 193,r24	 ;  MEM[(volatile uint8_t *)193B], _8
 ;  uart.c:424: }
	rjmp .L11		 ; 
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
	rjmp .L15		 ; 
 ;  uart.c:461:         UART0_STATUS = (1<<UART0_BIT_U2X);  //Enable 2x speed 
	ldi r18,lo8(2)	 ;  tmp49,
	sts 192,r18	 ;  MEM[(volatile uint8_t *)192B], tmp49
.L15:
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
	lds r25,_ZL11UART_RxHead	 ;  UART_RxHead.12_1, UART_RxHead
	lds r24,_ZL11UART_RxTail	 ;  UART_RxTail.13_2, UART_RxTail
 ;  uart.c:497:     if ( UART_RxHead == UART_RxTail ) {
	cp r25,r24		 ;  UART_RxHead.12_1, UART_RxTail.13_2
	breq .L18		 ; ,
 ;  uart.c:502:     tmptail = (UART_RxTail + 1) & UART_RX_BUFFER_MASK;
	lds r25,_ZL11UART_RxTail	 ;  UART_RxTail.14_3, UART_RxTail
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
.L18:
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
	lds r25,_ZL11UART_TxHead	 ;  UART_TxHead.15_1, UART_TxHead
 ;  uart.c:528:     tmphead  = (UART_TxHead + 1) & UART_TX_BUFFER_MASK;
	subi r25,lo8(-(1))	 ;  tmp50,
 ;  uart.c:528:     tmphead  = (UART_TxHead + 1) & UART_TX_BUFFER_MASK;
	andi r25,lo8(31)	 ;  tmphead,
.L20:
 ;  uart.c:530:     while ( tmphead == UART_TxTail ){
	lds r18,_ZL11UART_TxTail	 ;  UART_TxTail.17_3, UART_TxTail
	cp r18,r25		 ;  UART_TxTail.17_3, tmphead
	breq .L20		 ; ,
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
	movw r28,r24	 ;  ivtmp.32, s
.L24:
 ;  uart.c:551:     while (*s) 
	ld r24,Y+		 ;  _1, MEM[base: _11, offset: 0B]
 ;  uart.c:551:     while (*s) 
	tst r24		 ;  _1
	breq .L22		 ; ,
 ;  uart.c:552:       uart_putc(*s++);
	call _Z9uart_putch	 ; 
 ;  uart.c:551:     while (*s) 
	rjmp .L24		 ; 
.L22:
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
	movw r28,r24	 ;  ivtmp.36, progmem_s
.L27:
 ;  uart.c:567:     while ( (c = pgm_read_byte(progmem_s++)) ) 
	movw r30,r28	 ; , ivtmp.36
/* #APP */
 ;  567 "uart.c" 1
	lpm r24, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	adiw r28,1	 ;  ivtmp.36,
 ;  uart.c:567:     while ( (c = pgm_read_byte(progmem_s++)) ) 
	tst r24		 ;  __result
	breq .L25		 ; ,
 ;  uart.c:568:       uart_putc(c);
	call _Z9uart_putch	 ; 
 ;  uart.c:567:     while ( (c = pgm_read_byte(progmem_s++)) ) 
	rjmp .L27		 ; 
.L25:
/* epilogue start */
 ;  uart.c:570: }/* uart_puts_p */
	pop r29		 ; 
	pop r28		 ; 
	ret	
	.size	_Z11uart_puts_pPKc, .-_Z11uart_puts_pPKc
.global	_Z7initADCv
	.type	_Z7initADCv, @function
_Z7initADCv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
 ;  main.cc:26: 	ADMUX |= (1 << REFS0);					//REF voltage
	ldi r30,lo8(124)	 ;  tmp50,
	ldi r31,0		 ; 
	ld r24,Z		 ;  _1, MEM[(volatile uint8_t *)124B]
	ori r24,lo8(64)	 ;  _2,
	st Z,r24		 ;  MEM[(volatile uint8_t *)124B], _2
 ;  main.cc:27: 	ADCSRA |= (1 << ADPS1) | (1 << ADPS0);	//ADC clockprescale /8
	ldi r30,lo8(122)	 ;  tmp52,
	ldi r31,0		 ; 
	ld r24,Z		 ;  _3, MEM[(volatile uint8_t *)122B]
	ori r24,lo8(3)	 ;  _4,
	st Z,r24		 ;  MEM[(volatile uint8_t *)122B], _4
 ;  main.cc:28: 	ADCSRA |= (1 << ADEN) | (1 << ADIE);		//Enable + Interrupt
	ld r24,Z		 ;  _5, MEM[(volatile uint8_t *)122B]
	ori r24,lo8(-120)	 ;  _6,
	st Z,r24		 ;  MEM[(volatile uint8_t *)122B], _6
 ;  main.cc:29: 	sei();									//be sure to enable interrupts
/* #APP */
 ;  29 "main.cc" 1
	sei	
 ;  0 "" 2
 ;  main.cc:30: 	ADCSRA |= (1 << ADSC);					//Start 1st conversion
/* #NOAPP */
	ld r24,Z		 ;  _7, MEM[(volatile uint8_t *)122B]
	ori r24,lo8(64)	 ;  _8,
	st Z,r24		 ;  MEM[(volatile uint8_t *)122B], _8
/* epilogue start */
 ;  main.cc:31: }
	ret	
	.size	_Z7initADCv, .-_Z7initADCv
.global	_Z11getAdcValuev
	.type	_Z11getAdcValuev, @function
_Z11getAdcValuev:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
 ;  main.cc:34: 	return adc_result[currentChannel];
	lds r30,currentChannel	 ;  currentChannel, currentChannel
	ldi r31,0		 ;  _2
	lsl r30	 ;  tmp47
	rol r31	 ;  tmp47
	subi r30,lo8(-(adc_result))	 ;  tmp48,
	sbci r31,hi8(-(adc_result))	 ;  tmp48,
	ld r24,Z	 ;  <retval>, adc_result
	ldd r25,Z+1	 ;  <retval>, adc_result
/* epilogue start */
 ;  main.cc:35: }
	ret	
	.size	_Z11getAdcValuev, .-_Z11getAdcValuev
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"INT!"
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
	in r28,__SP_L__	 ; 
	in r29,__SP_H__	 ; 
	sbiw r28,32	 ; ,
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29	 ; ,
	out __SREG__,__tmp_reg__
	out __SP_L__,r28	 ; ,
/* prologue: function */
/* frame size = 32 */
/* stack size = 32 */
.L__stack_usage = 32
 ;  main.cc:67: 	uart_init(UART_BAUD_SELECT(9600, F_CPU));
	ldi r24,lo8(103)	 ; ,
	ldi r25,0		 ; 
	call _Z9uart_initj	 ; 
 ;  main.cc:68: 	initADC();
	call _Z7initADCv	 ; 
 ;  ADC.h:66: 				uart_puts("INT!");
	ldi r24,lo8(.LC0)	 ; ,
	ldi r25,hi8(.LC0)	 ; ,
	call _Z9uart_putsPKc	 ; 
 ;  ADC.h:58: 				ownerADC = ownerAdc;
	movw r24,r28	 ;  tmp45,
	adiw r24,17	 ;  tmp45,
	sts _ZN5BMCPP3Hal11ADConverterILh8ELh0ELNS0_18ADCMeasurementTypeE0ENS_3AVR9ATMega328EE12adcInterrupt8ownerADCE+1,r25	 ;  ownerADC, tmp45
	sts _ZN5BMCPP3Hal11ADConverterILh8ELh0ELNS0_18ADCMeasurementTypeE0ENS_3AVR9ATMega328EE12adcInterrupt8ownerADCE,r24	 ;  ownerADC, tmp45
.L31:
 ;  ADC.h:88: 				return adc_result[Channel];
	ldd r24,Y+19	 ;  _8, c.adc_result
	ldd r25,Y+20	 ;  _8, c.adc_result
 ;  e:\programme\avr-gcc\avr\include\stdlib.h:430: 	return __itoa_ncheck (__val, __s, __radix);
	ldi r20,lo8(10)	 ; ,
	movw r22,r28	 ; ,
	subi r22,-1	 ; ,
	sbci r23,-1	 ; ,
	call __itoa_ncheck	 ; 
 ;  main.cc:77: 		uart_puts(str);
	movw r24,r28	 ; ,
	adiw r24,1	 ; ,
	call _Z9uart_putsPKc	 ; 
	rjmp .L31		 ; 
	.size	main, .-main
	.section	.text._ZN5BMCPP3Hal11ADConverterILh8ELh0ELNS0_18ADCMeasurementTypeE0ENS_3AVR9ATMega328EE12adcInterrupt9handler21Ev,"axG",@progbits,_ZN5BMCPP3Hal11ADConverterILh8ELh0ELNS0_18ADCMeasurementTypeE0ENS_3AVR9ATMega328EE12adcInterrupt9handler21Ev,comdat
	.weak	_ZN5BMCPP3Hal11ADConverterILh8ELh0ELNS0_18ADCMeasurementTypeE0ENS_3AVR9ATMega328EE12adcInterrupt9handler21Ev
	.type	_ZN5BMCPP3Hal11ADConverterILh8ELh0ELNS0_18ADCMeasurementTypeE0ENS_3AVR9ATMega328EE12adcInterrupt9handler21Ev, @function
_ZN5BMCPP3Hal11ADConverterILh8ELh0ELNS0_18ADCMeasurementTypeE0ENS_3AVR9ATMega328EE12adcInterrupt9handler21Ev:
	push r1		 ; 
	push r0		 ; 
	in r0,__SREG__	 ; ,
	push r0		 ; 
	clr __zero_reg__		 ; 
	push r18		 ; 
	push r19		 ; 
	push r20		 ; 
	push r21		 ; 
	push r22		 ; 
	push r23		 ; 
	push r24		 ; 
	push r25		 ; 
	push r26		 ; 
	push r27		 ; 
	push r30		 ; 
	push r31		 ; 
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 15 */
.L__stack_usage = 15
 ;  ADC.h:51: 				uart_puts("INT!");
	ldi r24,lo8(.LC0)	 ; ,
	ldi r25,hi8(.LC0)	 ; ,
	call _Z9uart_putsPKc	 ; 
 ;  ADC.h:52: 				if (ownerADC != nullptr) {
	lds r30,_ZN5BMCPP3Hal11ADConverterILh8ELh0ELNS0_18ADCMeasurementTypeE0ENS_3AVR9ATMega328EE12adcInterrupt8ownerADCE	 ;  ownerADC.24_1, ownerADC
	lds r31,_ZN5BMCPP3Hal11ADConverterILh8ELh0ELNS0_18ADCMeasurementTypeE0ENS_3AVR9ATMega328EE12adcInterrupt8ownerADCE+1	 ;  ownerADC.24_1, ownerADC
 ;  ADC.h:52: 				if (ownerADC != nullptr) {
	sbiw r30,0	 ;  ownerADC.24_1,
	breq .L32		 ; ,
 ;  ADC.h:53: 					++ownerADC->adc_result[1];
	ldd r24,Z+2	 ;  _2, *ownerADC.24_1
	ldd r25,Z+3	 ;  _2, *ownerADC.24_1
	adiw r24,1	 ;  _3,
	std Z+3,r25	 ;  *ownerADC.24_1, _3
	std Z+2,r24	 ;  *ownerADC.24_1, _3
.L32:
/* epilogue start */
 ;  ADC.h:55: 			}
	pop r31		 ; 
	pop r30		 ; 
	pop r27		 ; 
	pop r26		 ; 
	pop r25		 ; 
	pop r24		 ; 
	pop r23		 ; 
	pop r22		 ; 
	pop r21		 ; 
	pop r20		 ; 
	pop r19		 ; 
	pop r18		 ; 
	pop r0		 ; 
	out __SREG__,r0	 ; ,
	pop r0		 ; 
	pop r1		 ; 
	reti	
	.size	_ZN5BMCPP3Hal11ADConverterILh8ELh0ELNS0_18ADCMeasurementTypeE0ENS_3AVR9ATMega328EE12adcInterrupt9handler21Ev, .-_ZN5BMCPP3Hal11ADConverterILh8ELh0ELNS0_18ADCMeasurementTypeE0ENS_3AVR9ATMega328EE12adcInterrupt9handler21Ev
	.weak	_ZN5BMCPP3Hal11ADConverterILh8ELh0ELNS0_18ADCMeasurementTypeE0ENS_3AVR9ATMega328EE12adcInterrupt8ownerADCE
	.section	.bss._ZN5BMCPP3Hal11ADConverterILh8ELh0ELNS0_18ADCMeasurementTypeE0ENS_3AVR9ATMega328EE12adcInterrupt8ownerADCE,"awG",@nobits,_ZN5BMCPP3Hal11ADConverterILh8ELh0ELNS0_18ADCMeasurementTypeE0ENS_3AVR9ATMega328EE12adcInterrupt8ownerADCE,comdat
	.type	_ZN5BMCPP3Hal11ADConverterILh8ELh0ELNS0_18ADCMeasurementTypeE0ENS_3AVR9ATMega328EE12adcInterrupt8ownerADCE, @object
	.size	_ZN5BMCPP3Hal11ADConverterILh8ELh0ELNS0_18ADCMeasurementTypeE0ENS_3AVR9ATMega328EE12adcInterrupt8ownerADCE, 2
_ZN5BMCPP3Hal11ADConverterILh8ELh0ELNS0_18ADCMeasurementTypeE0ENS_3AVR9ATMega328EE12adcInterrupt8ownerADCE:
	.zero	2
.global	channel_sel
	.section .bss
	.type	channel_sel, @object
	.size	channel_sel, 1
channel_sel:
	.zero	1
.global	currentChannel
	.type	currentChannel, @object
	.size	currentChannel, 1
currentChannel:
	.zero	1
.global	adc_result
	.type	adc_result, @object
	.size	adc_result, 4
adc_result:
	.zero	4
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
.global	_ZN5timer14timerInterrupt10ownerTimerE
	.type	_ZN5timer14timerInterrupt10ownerTimerE, @object
	.size	_ZN5timer14timerInterrupt10ownerTimerE, 2
_ZN5timer14timerInterrupt10ownerTimerE:
	.zero	2
	.ident	"GCC: (GNU) 8.1.0"
.global __do_copy_data
.global __do_clear_bss
