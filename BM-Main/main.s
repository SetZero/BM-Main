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
.global	_Z8LcdClearv
	.type	_Z8LcdClearv, @function
_Z8LcdClearv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
 ;  pcd8544.h:436: 	memset(LcdCache, 0x00, LCD_CACHE_SIZE); //Sugestion - its faster and its 10 bytes less in program mem
	ldi r30,lo8(_ZL8LcdCache)	 ;  tmp42,
	ldi r31,hi8(_ZL8LcdCache)	 ; ,
	ldi r24,lo8(-8)	 ;  tmp43,
	ldi r25,lo8(1)	 ; ,
	movw r26,r30	 ; , tmp42
	movw r18,r24	 ; , tmp43
	0:
	st X+,__zero_reg__	 ; 
	subi r18,1	 ; 
	sbci r19,0	 ; 
	brne 0b
 ;  pcd8544.h:438: 	LoWaterMark = 0;
	sts _ZL11LoWaterMark+1,__zero_reg__	 ;  LoWaterMark,
	sts _ZL11LoWaterMark,__zero_reg__	 ;  LoWaterMark,
 ;  pcd8544.h:439: 	HiWaterMark = LCD_CACHE_SIZE - 1;
	ldi r24,lo8(-9)	 ;  tmp45,
	ldi r25,lo8(1)	 ; ,
	sts _ZL11HiWaterMark+1,r25	 ;  HiWaterMark, tmp45
	sts _ZL11HiWaterMark,r24	 ;  HiWaterMark, tmp45
/* epilogue start */
 ;  pcd8544.h:443: }
	ret	
	.size	_Z8LcdClearv, .-_Z8LcdClearv
.global	__vector_21
	.type	__vector_21, @function
__vector_21:
	__gcc_isr 1	 ; 
	push r25		 ; 
	push r30		 ; 
	push r31		 ; 
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 3...7 */
.L__stack_usage = 3 + __gcc_isr.n_pushed
 ;  ADC.h:157: 			if (ownerAdc != nullptr)
	lds r30,_ZN5BMCPP3Hal11ADConverter12adcInterrupt8ownerAdcE	 ;  ownerAdc.15_1, ownerAdc
	lds r31,_ZN5BMCPP3Hal11ADConverter12adcInterrupt8ownerAdcE+1	 ;  ownerAdc.15_1, ownerAdc
 ;  ADC.h:157: 			if (ownerAdc != nullptr)
	sbiw r30,0	 ;  ownerAdc.15_1,
	breq .L3		 ; ,
 ;  ADC.h:158: 				ownerAdc->adc_result[0] = ADC;
	lds r24,120	 ;  _2, MEM[(volatile uint16_t *)120B]
	lds r25,120+1	 ;  _2, MEM[(volatile uint16_t *)120B]
 ;  ADC.h:158: 				ownerAdc->adc_result[0] = ADC;
	std Z+1,r25	 ;  *ownerAdc.15_1, _2
	st Z,r24	 ;  *ownerAdc.15_1, _2
.L3:
 ;  ADC.h:159: 			ADCSRA |= (1 << ADSC);
	lds r24,122	 ;  _3, MEM[(volatile uint8_t *)122B]
	ori r24,lo8(64)	 ;  _4,
	sts 122,r24	 ;  MEM[(volatile uint8_t *)122B], _4
/* epilogue start */
 ;  ADC.h:160: 		}
	pop r31		 ; 
	pop r30		 ; 
	pop r25		 ; 
	__gcc_isr 2	 ; 
	reti	
	__gcc_isr 0,r24
	.size	__vector_21, .-__vector_21
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
	lds r30,_ZL11UART_RxHead	 ;  UART_RxHead.17_1, UART_RxHead
 ;  uart.c:390:     tmphead = ( UART_RxHead + 1) & UART_RX_BUFFER_MASK;
	subi r30,lo8(-(1))	 ;  tmp54,
 ;  uart.c:390:     tmphead = ( UART_RxHead + 1) & UART_RX_BUFFER_MASK;
	andi r30,lo8(31)	 ;  tmphead,
 ;  uart.c:392:     if ( tmphead == UART_RxTail ) {
	lds r18,_ZL11UART_RxTail	 ;  UART_RxTail.19_3, UART_RxTail
 ;  uart.c:392:     if ( tmphead == UART_RxTail ) {
	cp r18,r30		 ;  UART_RxTail.19_3, tmphead
	breq .L9		 ; ,
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
.L8:
 ;  uart.c:401:     UART_LastRxError |= lastRxError;   
	lds r25,_ZL16UART_LastRxError	 ;  UART_LastRxError.20_5, UART_LastRxError
	or r24,r25		 ;  _6, UART_LastRxError.20_5
	sts _ZL16UART_LastRxError,r24	 ;  UART_LastRxError, _6
/* epilogue start */
 ;  uart.c:402: }
	pop r31		 ; 
	pop r30		 ; 
	pop r25		 ; 
	pop r24		 ; 
	__gcc_isr 2	 ; 
	reti	
.L9:
 ;  uart.c:394:         lastRxError = UART_BUFFER_OVERFLOW >> 8;
	ldi r24,lo8(2)	 ;  lastRxError,
	rjmp .L8		 ; 
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
	lds r25,_ZL11UART_TxHead	 ;  UART_TxHead.22_1, UART_TxHead
	lds r24,_ZL11UART_TxTail	 ;  UART_TxTail.23_2, UART_TxTail
 ;  uart.c:414:     if ( UART_TxHead != UART_TxTail) {
	cp r25,r24		 ;  UART_TxHead.22_1, UART_TxTail.23_2
	breq .L11		 ; ,
 ;  uart.c:416:         tmptail = (UART_TxTail + 1) & UART_TX_BUFFER_MASK;
	lds r30,_ZL11UART_TxTail	 ;  UART_TxTail.24_3, UART_TxTail
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
.L10:
/* epilogue start */
 ;  uart.c:424: }
	pop r31		 ; 
	pop r30		 ; 
	pop r25		 ; 
	__gcc_isr 2	 ; 
	reti	
.L11:
 ;  uart.c:422:         UART0_CONTROL &= ~_BV(UART0_UDRIE);
	lds r24,193	 ;  _7, MEM[(volatile uint8_t *)193B]
	andi r24,lo8(-33)	 ;  _8,
	sts 193,r24	 ;  MEM[(volatile uint8_t *)193B], _8
 ;  uart.c:424: }
	rjmp .L10		 ; 
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
	rjmp .L14		 ; 
 ;  uart.c:461:         UART0_STATUS = (1<<UART0_BIT_U2X);  //Enable 2x speed 
	ldi r18,lo8(2)	 ;  tmp49,
	sts 192,r18	 ;  MEM[(volatile uint8_t *)192B], tmp49
.L14:
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
	lds r25,_ZL11UART_RxHead	 ;  UART_RxHead.27_1, UART_RxHead
	lds r24,_ZL11UART_RxTail	 ;  UART_RxTail.28_2, UART_RxTail
 ;  uart.c:497:     if ( UART_RxHead == UART_RxTail ) {
	cp r25,r24		 ;  UART_RxHead.27_1, UART_RxTail.28_2
	breq .L17		 ; ,
 ;  uart.c:502:     tmptail = (UART_RxTail + 1) & UART_RX_BUFFER_MASK;
	lds r25,_ZL11UART_RxTail	 ;  UART_RxTail.29_3, UART_RxTail
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
.L17:
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
	lds r25,_ZL11UART_TxHead	 ;  UART_TxHead.30_1, UART_TxHead
 ;  uart.c:528:     tmphead  = (UART_TxHead + 1) & UART_TX_BUFFER_MASK;
	subi r25,lo8(-(1))	 ;  tmp50,
 ;  uart.c:528:     tmphead  = (UART_TxHead + 1) & UART_TX_BUFFER_MASK;
	andi r25,lo8(31)	 ;  tmphead,
.L19:
 ;  uart.c:530:     while ( tmphead == UART_TxTail ){
	lds r18,_ZL11UART_TxTail	 ;  UART_TxTail.32_3, UART_TxTail
	cp r18,r25		 ;  UART_TxTail.32_3, tmphead
	breq .L19		 ; ,
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
	movw r28,r24	 ;  ivtmp.45, s
.L23:
 ;  uart.c:551:     while (*s) 
	ld r24,Y+		 ;  _1, MEM[base: _11, offset: 0B]
 ;  uart.c:551:     while (*s) 
	tst r24		 ;  _1
	breq .L21		 ; ,
 ;  uart.c:552:       uart_putc(*s++);
	call _Z9uart_putch	 ; 
 ;  uart.c:551:     while (*s) 
	rjmp .L23		 ; 
.L21:
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
	movw r28,r24	 ;  ivtmp.49, progmem_s
.L26:
 ;  uart.c:567:     while ( (c = pgm_read_byte(progmem_s++)) ) 
	movw r30,r28	 ; , ivtmp.49
/* #APP */
 ;  567 "uart.c" 1
	lpm r24, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	adiw r28,1	 ;  ivtmp.49,
 ;  uart.c:567:     while ( (c = pgm_read_byte(progmem_s++)) ) 
	tst r24		 ;  __result
	breq .L24		 ; ,
 ;  uart.c:568:       uart_putc(c);
	call _Z9uart_putch	 ; 
 ;  uart.c:567:     while ( (c = pgm_read_byte(progmem_s++)) ) 
	rjmp .L26		 ; 
.L24:
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
	.section	.text._ZN5BMCPP3Hal3SPIILh0ELNS0_3spi7ClkRateE0ELb1ENS_3AVR9ATMega328EE15readWriteSingleEh,"axG",@progbits,_ZN5BMCPP3Hal3SPIILh0ELNS0_3spi7ClkRateE0ELb1ENS_3AVR9ATMega328EE15readWriteSingleEh,comdat
	.weak	_ZN5BMCPP3Hal3SPIILh0ELNS0_3spi7ClkRateE0ELb1ENS_3AVR9ATMega328EE15readWriteSingleEh
	.type	_ZN5BMCPP3Hal3SPIILh0ELNS0_3spi7ClkRateE0ELb1ENS_3AVR9ATMega328EE15readWriteSingleEh, @function
_ZN5BMCPP3Hal3SPIILh0ELNS0_3spi7ClkRateE0ELb1ENS_3AVR9ATMega328EE15readWriteSingleEh:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
 ;  spi_hal.h:71: 				*spi()->Spdr = value;
	out 0x2e,r24	 ;  MEM[(volatile value_type &)76B + 2], data
.L30:
 ;  spi_hal.h:156: 				while ((readSPSR() & static_cast<typename MicroController::mem_width>(MicroController::SPI::spsr::SPIF0)) == 0);
	in __tmp_reg__,0x2d	 ; 
	sbrs __tmp_reg__,7	 ; 
	rjmp .L30		 ; 
 ;  spi_hal.h:157: 				return readSPDR();
	in r24,0x2e	 ;  <retval>, MEM[(volatile mem_width &)76B + 2]
/* epilogue start */
 ;  spi_hal.h:158: 			}
	ret	
	.size	_ZN5BMCPP3Hal3SPIILh0ELNS0_3spi7ClkRateE0ELb1ENS_3AVR9ATMega328EE15readWriteSingleEh, .-_ZN5BMCPP3Hal3SPIILh0ELNS0_3spi7ClkRateE0ELb1ENS_3AVR9ATMega328EE15readWriteSingleEh
	.text
	.type	_ZL7LcdSendc10LcdCmdData, @function
_ZL7LcdSendc10LcdCmdData:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
 ;  pcd8544.h:494: 	LCD_PORT &= ~(_BV(LCD_CE_PIN));
	cbi 0x5,1	 ; ,
 ;  pcd8544.h:496: 	if (cd == LCD_DATA)
	cpi r22,lo8(1)	 ;  cd,
	brne .L33		 ; ,
 ;  pcd8544.h:498: 		LCD_PORT |= _BV(LCD_DC_PIN);
	sbi 0x5,0	 ; ,
.L34:
 ;  pcd8544.h:506: 	spi::readWriteSingle(data);
	call _ZN5BMCPP3Hal3SPIILh0ELNS0_3spi7ClkRateE0ELb1ENS_3AVR9ATMega328EE15readWriteSingleEh	 ; 
 ;  pcd8544.h:515: 	LCD_PORT |= _BV(LCD_CE_PIN);
	sbi 0x5,1	 ; ,
/* epilogue start */
 ;  pcd8544.h:516: }
	ret	
.L33:
 ;  pcd8544.h:502: 		LCD_PORT &= static_cast<uint8_t>(~(_BV(LCD_DC_PIN)));
	cbi 0x5,0	 ; ,
	rjmp .L34		 ; 
	.size	_ZL7LcdSendc10LcdCmdData, .-_ZL7LcdSendc10LcdCmdData
.global	_Z7newLinev
	.type	_Z7newLinev, @function
_Z7newLinev:
	push r16		 ; 
	push r17		 ; 
	push r28		 ; 
	push r29		 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
 ;  pcd8544.h:387: 	for (int i = 0; i < (WIDTH - pixelsInLine); i++) {
	ldi r29,0		 ;  i
	ldi r28,0		 ;  i
 ;  pcd8544.h:387: 	for (int i = 0; i < (WIDTH - pixelsInLine); i++) {
	ldi r16,lo8(84)	 ;  tmp49,
	ldi r17,0		 ; 
.L37:
 ;  pcd8544.h:387: 	for (int i = 0; i < (WIDTH - pixelsInLine); i++) {
	lds r24,pixelsInLine	 ;  pixelsInLine, pixelsInLine
	movw r18,r16	 ; , tmp49
	sub r18,r24	 ; , pixelsInLine
	sbc r19,__zero_reg__	 ; 
 ;  pcd8544.h:387: 	for (int i = 0; i < (WIDTH - pixelsInLine); i++) {
	cp r28,r18	 ;  i, tmp48
	cpc r29,r19	 ;  i, tmp48
	brge .L36		 ; ,
 ;  pcd8544.h:388: 		LcdSend(0, LcdCmdData::LCD_DATA);
	ldi r22,lo8(1)	 ; ,
	ldi r24,0		 ; 
	call _ZL7LcdSendc10LcdCmdData	 ; 
 ;  pcd8544.h:387: 	for (int i = 0; i < (WIDTH - pixelsInLine); i++) {
	adiw r28,1	 ;  i,
	rjmp .L37		 ; 
.L36:
 ;  pcd8544.h:390: 	pixelsInLine = 0;
	sts pixelsInLine,__zero_reg__	 ;  pixelsInLine,
/* epilogue start */
 ;  pcd8544.h:391: }
	pop r29		 ; 
	pop r28		 ; 
	pop r17		 ; 
	pop r16		 ; 
	ret	
	.size	_Z7newLinev, .-_Z7newLinev
.global	_Z11LcdContrastc
	.type	_Z11LcdContrastc, @function
_Z11LcdContrastc:
	push r28		 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	mov r28,r24	 ;  contrast, contrast
 ;  pcd8544.h:409: 	LcdSend(0x21, LCD_CMD);
	ldi r22,0		 ; 
	ldi r24,lo8(33)	 ; ,
	call _ZL7LcdSendc10LcdCmdData	 ; 
 ;  pcd8544.h:412: 	LcdSend(0x80 | contrast, LCD_CMD);
	ldi r22,0		 ; 
	mov r24,r28	 ; , contrast
	ori r24,lo8(-128)	 ; ,
	call _ZL7LcdSendc10LcdCmdData	 ; 
 ;  pcd8544.h:415: 	LcdSend(0x20, LCD_CMD);
	ldi r22,0		 ; 
	ldi r24,lo8(32)	 ; ,
/* epilogue start */
 ;  pcd8544.h:416: }
	pop r28		 ; 
 ;  pcd8544.h:415: 	LcdSend(0x20, LCD_CMD);
	jmp _ZL7LcdSendc10LcdCmdData	 ; 
	.size	_Z11LcdContrastc, .-_Z11LcdContrastc
.global	_Z9LcdUpdatev
	.type	_Z9LcdUpdatev, @function
_Z9LcdUpdatev:
	push r17		 ; 
	push r28		 ; 
	push r29		 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
 ;  pcd8544.h:456: 	if (LoWaterMark < 0)
	lds r24,_ZL11LoWaterMark	 ;  LoWaterMark.8_1, LoWaterMark
	lds r25,_ZL11LoWaterMark+1	 ;  LoWaterMark.8_1, LoWaterMark
 ;  pcd8544.h:456: 	if (LoWaterMark < 0)
	sbrs r25,7	 ;  LoWaterMark.8_1,
	rjmp .L40		 ; 
 ;  pcd8544.h:457: 		LoWaterMark = 0;
	sts _ZL11LoWaterMark+1,__zero_reg__	 ;  LoWaterMark,
	sts _ZL11LoWaterMark,__zero_reg__	 ;  LoWaterMark,
.L41:
 ;  pcd8544.h:461: 	if (HiWaterMark < 0)
	lds r24,_ZL11HiWaterMark	 ;  HiWaterMark.10_2, HiWaterMark
	lds r25,_ZL11HiWaterMark+1	 ;  HiWaterMark.10_2, HiWaterMark
 ;  pcd8544.h:461: 	if (HiWaterMark < 0)
	sbrs r25,7	 ;  HiWaterMark.10_2,
	rjmp .L42		 ; 
 ;  pcd8544.h:462: 		HiWaterMark = 0;
	sts _ZL11HiWaterMark+1,__zero_reg__	 ;  HiWaterMark,
	sts _ZL11HiWaterMark,__zero_reg__	 ;  HiWaterMark,
.L43:
 ;  pcd8544.h:467: 	LcdSend(0x80 | (LoWaterMark % LCD_X_RES), LCD_CMD);
	lds r28,_ZL11LoWaterMark	 ;  i, LoWaterMark
	lds r29,_ZL11LoWaterMark+1	 ;  i, LoWaterMark
	movw r24,r28	 ; , i
	ldi r22,lo8(84)	 ; ,
	ldi r23,0		 ; 
	call __divmodhi4
	mov r17,r22	 ;  tmp78,
 ;  pcd8544.h:467: 	LcdSend(0x80 | (LoWaterMark % LCD_X_RES), LCD_CMD);
	ldi r22,0		 ; 
	ori r24,lo8(-128)	 ; ,
	call _ZL7LcdSendc10LcdCmdData	 ; 
 ;  pcd8544.h:468: 	LcdSend(0x40 | (LoWaterMark / LCD_X_RES), LCD_CMD);
	ldi r22,0		 ; 
	mov r24,r17	 ; , tmp78
	ori r24,lo8(64)	 ; ,
	call _ZL7LcdSendc10LcdCmdData	 ; 
.L45:
 ;  pcd8544.h:471: 	for (i = LoWaterMark; i <= HiWaterMark; i++)
	lds r24,_ZL11HiWaterMark	 ;  HiWaterMark, HiWaterMark
	lds r25,_ZL11HiWaterMark+1	 ;  HiWaterMark, HiWaterMark
	cp r24,r28	 ;  HiWaterMark, i
	cpc r25,r29	 ;  HiWaterMark, i
	brlt .L44		 ; ,
 ;  pcd8544.h:473: 		LcdSend(LcdCache[i], LCD_DATA);
	movw r30,r28	 ;  tmp70, i
	subi r30,lo8(-(_ZL8LcdCache))	 ;  tmp70,
	sbci r31,hi8(-(_ZL8LcdCache))	 ;  tmp70,
	ldi r22,lo8(1)	 ; ,
	ld r24,Z		 ; , MEM[base: _33, offset: 0B]
	call _ZL7LcdSendc10LcdCmdData	 ; 
 ;  pcd8544.h:471: 	for (i = LoWaterMark; i <= HiWaterMark; i++)
	adiw r28,1	 ;  i,
	rjmp .L45		 ; 
.L40:
 ;  pcd8544.h:458: 	else if (LoWaterMark >= LCD_CACHE_SIZE)
	cpi r24,-8	 ;  LoWaterMark.8_1,
	sbci r25,1	 ;  LoWaterMark.8_1,
	brlt .L41		 ; ,
 ;  pcd8544.h:459: 		LoWaterMark = LCD_CACHE_SIZE - 1;
	ldi r24,lo8(-9)	 ;  tmp57,
	ldi r25,lo8(1)	 ; ,
	sts _ZL11LoWaterMark+1,r25	 ;  LoWaterMark, tmp57
	sts _ZL11LoWaterMark,r24	 ;  LoWaterMark, tmp57
	rjmp .L41		 ; 
.L42:
 ;  pcd8544.h:463: 	else if (HiWaterMark >= LCD_CACHE_SIZE)
	cpi r24,-8	 ;  HiWaterMark.10_2,
	sbci r25,1	 ;  HiWaterMark.10_2,
	brlt .L43		 ; ,
 ;  pcd8544.h:464: 		HiWaterMark = LCD_CACHE_SIZE - 1;
	ldi r24,lo8(-9)	 ;  tmp58,
	ldi r25,lo8(1)	 ; ,
	sts _ZL11HiWaterMark+1,r25	 ;  HiWaterMark, tmp58
	sts _ZL11HiWaterMark,r24	 ;  HiWaterMark, tmp58
	rjmp .L43		 ; 
.L44:
 ;  pcd8544.h:477: 	LoWaterMark = LCD_CACHE_SIZE - 1;
	ldi r24,lo8(-9)	 ;  tmp71,
	ldi r25,lo8(1)	 ; ,
	sts _ZL11LoWaterMark+1,r25	 ;  LoWaterMark, tmp71
	sts _ZL11LoWaterMark,r24	 ;  LoWaterMark, tmp71
 ;  pcd8544.h:478: 	HiWaterMark = 0;
	sts _ZL11HiWaterMark+1,__zero_reg__	 ;  HiWaterMark,
	sts _ZL11HiWaterMark,__zero_reg__	 ;  HiWaterMark,
/* epilogue start */
 ;  pcd8544.h:482: }
	pop r29		 ; 
	pop r28		 ; 
	pop r17		 ; 
	ret	
	.size	_Z9LcdUpdatev, .-_Z9LcdUpdatev
.global	_Z7LcdInitv
	.type	_Z7LcdInitv, @function
_Z7LcdInitv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
 ;  pcd8544.h:322: 	LCD_PORT |= _BV(LCD_RST_PIN);
	sbi 0x5,2	 ; ,
 ;  pcd8544.h:325: 	LCD_DDR |= _BV(LCD_RST_PIN) | _BV(LCD_DC_PIN) | _BV(LCD_CE_PIN) | _BV(SPI_MOSI_PIN) | _BV(SPI_CLK_PIN);
	in r24,0x4	 ;  _3, MEM[(volatile uint8_t *)36B]
	ori r24,lo8(47)	 ;  _4,
	out 0x4,r24	 ;  MEM[(volatile uint8_t *)36B], _4
 ;  pcd8544.h:330: 	LCD_PORT &= ~(_BV(LCD_RST_PIN));
	cbi 0x5,2	 ; ,
 ;  pcd8544.h:332: 	LCD_PORT |= _BV(LCD_RST_PIN);
	sbi 0x5,2	 ; ,
 ;  hal\port.h:75:                 Port::get() |= mask;
	sbi 0x5,3	 ; ,
 ;  hal\port.h:78:                 Port::get() &= static_cast<uint8_t>(~mask);
	cbi 0x5,4	 ; ,
 ;  hal\port.h:75:                 Port::get() |= mask;
	sbi 0x5,2	 ; ,
	sbi 0x5,5	 ; ,
 ;  register.h:48: 				hwRegister = val;
	out 0x2c,__zero_reg__	 ;  MEM[(struct ControlRegister *)76B].hwRegister,
 ;  register.h:44:                 hwRegister = (static_cast<value_type>(v) | ...);
	ldi r24,lo8(80)	 ;  tmp78,
	out 0x2c,r24	 ;  MEM[(struct ControlRegister *)76B].hwRegister, tmp78
	ldi r24,lo8(1)	 ;  tmp80,
	out 0x2d,r24	 ;  MEM[(struct ControlRegister *)76B + 1B].hwRegister, tmp80
 ;  pcd8544.h:341: 	LCD_PORT |= _BV(LCD_CE_PIN);
	sbi 0x5,1	 ; ,
 ;  pcd8544.h:343: 	LcdSend(0x21, LCD_CMD); /* LCD Extended Commands. */
	ldi r22,0		 ; 
	ldi r24,lo8(33)	 ; ,
	call _ZL7LcdSendc10LcdCmdData	 ; 
 ;  pcd8544.h:344: 	LcdSend(0xC8, LCD_CMD); /* Set LCD Vop (Contrast).*/
	ldi r22,0		 ; 
	ldi r24,lo8(-56)	 ; ,
	call _ZL7LcdSendc10LcdCmdData	 ; 
 ;  pcd8544.h:345: 	LcdSend(0x06, LCD_CMD); /* Set Temp coefficent. */
	ldi r22,0		 ; 
	ldi r24,lo8(6)	 ; ,
	call _ZL7LcdSendc10LcdCmdData	 ; 
 ;  pcd8544.h:346: 	LcdSend(0x13, LCD_CMD); /* LCD bias mode 1:48. */
	ldi r22,0		 ; 
	ldi r24,lo8(19)	 ; ,
	call _ZL7LcdSendc10LcdCmdData	 ; 
 ;  pcd8544.h:347: 	LcdSend(0x20, LCD_CMD); /* LCD Standard Commands,Horizontal addressing mode */
	ldi r22,0		 ; 
	ldi r24,lo8(32)	 ; ,
	call _ZL7LcdSendc10LcdCmdData	 ; 
 ;  pcd8544.h:348: 	LcdSend(0x0C, LCD_CMD); /* LCD in normal mode. */
	ldi r22,0		 ; 
	ldi r24,lo8(12)	 ; ,
	call _ZL7LcdSendc10LcdCmdData	 ; 
 ;  pcd8544.h:351: 	LoWaterMark = LCD_CACHE_SIZE;
	ldi r24,lo8(-8)	 ;  tmp83,
	ldi r25,lo8(1)	 ; ,
	sts _ZL11LoWaterMark+1,r25	 ;  LoWaterMark, tmp83
	sts _ZL11LoWaterMark,r24	 ;  LoWaterMark, tmp83
 ;  pcd8544.h:352: 	HiWaterMark = 0;
	sts _ZL11HiWaterMark+1,__zero_reg__	 ;  HiWaterMark,
	sts _ZL11HiWaterMark,__zero_reg__	 ;  HiWaterMark,
 ;  pcd8544.h:355: 	LcdClear();
	call _Z8LcdClearv	 ; 
 ;  pcd8544.h:356: 	LcdUpdate();
	jmp _Z9LcdUpdatev	 ; 
	.size	_Z7LcdInitv, .-_Z7LcdInitv
.global	_Z9printCharc
	.type	_Z9printCharc, @function
_Z9printCharc:
	push r17		 ; 
	push r28		 ; 
	push r29		 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	mov r28,r24	 ;  ch, ch
 ;  pcd8544.h:365: 	if (ch < 32) {
	cpi r24,lo8(32)	 ;  ch,
	brsh .L48		 ; ,
 ;  pcd8544.h:366: 		LcdClear();
	call _Z8LcdClearv	 ; 
 ;  pcd8544.h:367: 		printChar('4');
	ldi r24,lo8(52)	 ; ,
	call _Z9printCharc	 ; 
 ;  pcd8544.h:368: 		printChar('2');
	ldi r24,lo8(50)	 ; ,
	call _Z9printCharc	 ; 
.L48:
 ;  pcd8544.h:371: 	spi::readWriteSingle(1);
	ldi r24,lo8(1)	 ; ,
	call _ZN5BMCPP3Hal3SPIILh0ELNS0_3spi7ClkRateE0ELb1ENS_3AVR9ATMega328EE15readWriteSingleEh	 ; 
 ;  pcd8544.h:377: 		char c = static_cast<char>(pgm_read_byte(&(FontLookup[ch - 32][i])) << 1);
	mov r18,r28	 ; , ch
	subi r18,32	 ; ,
	sbc r19,r19	 ; 
	movw r24,r18	 ;  tmp55,
	ldi r18,lo8(5)	 ;  tmp57,
	mul r18,r24	 ;  tmp57, tmp55
	movw r28,r0	 ;  tmp56
	mul r18,r25	 ;  tmp57, tmp55
	add r29,r0	 ;  tmp56
	clr __zero_reg__
	subi r28,lo8(-(_ZL10FontLookup))	 ;  ivtmp.72,
	sbci r29,hi8(-(_ZL10FontLookup))	 ;  ivtmp.72,
	ldi r17,lo8(5)	 ;  ivtmp_27,
.L51:
	movw r30,r28	 ; , ivtmp.72
/* #APP */
 ;  377 "pcd8544.h" 1
	lpm r24, Z	 ;  __result
	
 ;  0 "" 2
 ;  pcd8544.h:381: 		LcdSend(c, LcdCmdData::LCD_DATA);
/* #NOAPP */
	ldi r22,lo8(1)	 ; ,
	lsl r24		 ; 
	call _ZL7LcdSendc10LcdCmdData	 ; 
 ;  pcd8544.h:382: 		pixelsInLine < WIDTH ? pixelsInLine++ : pixelsInLine = 0;
	lds r24,pixelsInLine	 ;  pixelsInLine.3_5, pixelsInLine
 ;  pcd8544.h:382: 		pixelsInLine < WIDTH ? pixelsInLine++ : pixelsInLine = 0;
	cpi r24,lo8(84)	 ;  pixelsInLine.3_5,
	brsh .L49		 ; ,
 ;  pcd8544.h:382: 		pixelsInLine < WIDTH ? pixelsInLine++ : pixelsInLine = 0;
	subi r24,lo8(-(1))	 ;  tmp60,
	sts pixelsInLine,r24	 ;  pixelsInLine, tmp60
.L50:
	subi r17,lo8(-(-1))	 ;  ivtmp_27,
	adiw r28,1	 ;  ivtmp.72,
 ;  pcd8544.h:373: 	for (uint8_t i = 0; i < 5; i++)
	cpse r17,__zero_reg__	 ;  ivtmp_27,
	rjmp .L51	 ; 
/* epilogue start */
 ;  pcd8544.h:384: }
	pop r29		 ; 
	pop r28		 ; 
	pop r17		 ; 
	ret	
.L49:
 ;  pcd8544.h:382: 		pixelsInLine < WIDTH ? pixelsInLine++ : pixelsInLine = 0;
	sts pixelsInLine,__zero_reg__	 ;  pixelsInLine,
	rjmp .L50		 ; 
	.size	_Z9printCharc, .-_Z9printCharc
.global	_Z8printStrPKc
	.type	_Z8printStrPKc, @function
_Z8printStrPKc:
	push r28		 ; 
	push r29		 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24	 ;  ivtmp.79, str
.L55:
 ;  pcd8544.h:394: 	while (*str) {
	ld r24,Y+		 ;  _1, MEM[base: _11, offset: 0B]
 ;  pcd8544.h:394: 	while (*str) {
	tst r24		 ;  _1
	breq .L53		 ; ,
 ;  pcd8544.h:395: 		printChar(*str);
	call _Z9printCharc	 ; 
 ;  pcd8544.h:394: 	while (*str) {
	rjmp .L55		 ; 
.L53:
/* epilogue start */
 ;  pcd8544.h:398: }
	pop r29		 ; 
	pop r28		 ; 
	ret	
	.size	_Z8printStrPKc, .-_Z8printStrPKc
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"\n"
.LC1:
	.string	"scheiss Lyroit"
.LC2:
	.string	"Neises Nokia"
.LC3:
	.string	"101010"
.LC4:
	.string	"\n\r"
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
 ;  ADC.h:105: 					ownerAdc = t;
	movw r24,r28	 ;  tmp45,
	adiw r24,17	 ;  tmp45,
	sts _ZN5BMCPP3Hal11ADConverter12adcInterrupt8ownerAdcE+1,r25	 ;  ownerAdc, tmp45
	sts _ZN5BMCPP3Hal11ADConverter12adcInterrupt8ownerAdcE,r24	 ;  ownerAdc, tmp45
 ;  ADC.h:140: 				sei();
/* #APP */
 ;  140 "ADC.h" 1
	sei	
 ;  0 "" 2
 ;  e:\programme\avr-gcc\avr\include\stdlib.h:430: 	return __itoa_ncheck (__val, __s, __radix);
/* #NOAPP */
	ldi r20,lo8(10)	 ; ,
	movw r22,r28	 ; ,
	subi r22,-1	 ; ,
	sbci r23,-1	 ; ,
	ldi r24,lo8(-53)	 ; ,
	ldi r25,0		 ; 
	call __itoa_ncheck	 ; 
 ;  ADC.h:145: 				uart_puts(str);
	movw r24,r28	 ; ,
	adiw r24,1	 ; ,
	call _Z9uart_putsPKc	 ; 
 ;  ADC.h:146: 				uart_puts("\n");
	ldi r24,lo8(.LC0)	 ; ,
	ldi r25,hi8(.LC0)	 ; ,
	call _Z9uart_putsPKc	 ; 
 ;  main.cc:77: 	LcdClear();
	call _Z8LcdClearv	 ; 
 ;  main.cc:80: 	printStr("scheiss Lyroit");
	ldi r24,lo8(.LC1)	 ; ,
	ldi r25,hi8(.LC1)	 ; ,
	call _Z8printStrPKc	 ; 
 ;  main.cc:81: 	newLine();
	call _Z7newLinev	 ; 
 ;  main.cc:82: 	printStr("Neises Nokia");
	ldi r24,lo8(.LC2)	 ; ,
	ldi r25,hi8(.LC2)	 ; ,
	call _Z8printStrPKc	 ; 
 ;  main.cc:83: 	newLine();
	call _Z7newLinev	 ; 
 ;  main.cc:84: 	newLine();
	call _Z7newLinev	 ; 
 ;  main.cc:85: 	printStr("101010");
	ldi r24,lo8(.LC3)	 ; ,
	ldi r25,hi8(.LC3)	 ; ,
	call _Z8printStrPKc	 ; 
.L57:
 ;  ADC.h:151: 				return adc_result[Channel];
	ldd r24,Y+17	 ;  _16, t.adc_result
	ldd r25,Y+18	 ;  _16, t.adc_result
 ;  e:\programme\avr-gcc\avr\include\stdlib.h:430: 	return __itoa_ncheck (__val, __s, __radix);
	ldi r20,lo8(10)	 ; ,
	movw r22,r28	 ; ,
	subi r22,-1	 ; ,
	sbci r23,-1	 ; ,
	call __itoa_ncheck	 ; 
 ;  main.cc:91: 		uart_puts(str);
	movw r24,r28	 ; ,
	adiw r24,1	 ; ,
	call _Z9uart_putsPKc	 ; 
 ;  main.cc:92: 		uart_puts("\n\r");
	ldi r24,lo8(.LC4)	 ; ,
	ldi r25,hi8(.LC4)	 ; ,
	call _Z9uart_putsPKc	 ; 
	rjmp .L57		 ; 
	.size	main, .-main
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
.global	_ZN5BMCPP3Hal11ADConverter12adcInterrupt8ownerAdcE
	.type	_ZN5BMCPP3Hal11ADConverter12adcInterrupt8ownerAdcE, @object
	.size	_ZN5BMCPP3Hal11ADConverter12adcInterrupt8ownerAdcE, 2
_ZN5BMCPP3Hal11ADConverter12adcInterrupt8ownerAdcE:
	.zero	2
.global	pixelsInLine
	.type	pixelsInLine, @object
	.size	pixelsInLine, 1
pixelsInLine:
	.zero	1
	.local	_ZL11HiWaterMark
	.comm	_ZL11HiWaterMark,2,1
	.local	_ZL11LoWaterMark
	.comm	_ZL11LoWaterMark,2,1
	.local	_ZL8LcdCache
	.comm	_ZL8LcdCache,504,1
	.section	.progmem.data,"a",@progbits
	.type	_ZL10FontLookup, @object
	.size	_ZL10FontLookup, 455
_ZL10FontLookup:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	47
	.byte	0
	.byte	0
	.byte	0
	.byte	7
	.byte	0
	.byte	7
	.byte	0
	.byte	20
	.byte	127
	.byte	20
	.byte	127
	.byte	20
	.byte	36
	.byte	42
	.byte	127
	.byte	42
	.byte	18
	.byte	-60
	.byte	-56
	.byte	16
	.byte	38
	.byte	70
	.byte	54
	.byte	73
	.byte	85
	.byte	34
	.byte	80
	.byte	0
	.byte	5
	.byte	3
	.byte	0
	.byte	0
	.byte	0
	.byte	28
	.byte	34
	.byte	65
	.byte	0
	.byte	0
	.byte	65
	.byte	34
	.byte	28
	.byte	0
	.byte	20
	.byte	8
	.byte	62
	.byte	8
	.byte	20
	.byte	8
	.byte	8
	.byte	62
	.byte	8
	.byte	8
	.byte	0
	.byte	0
	.byte	80
	.byte	48
	.byte	0
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	0
	.byte	96
	.byte	96
	.byte	0
	.byte	0
	.byte	32
	.byte	16
	.byte	8
	.byte	4
	.byte	2
	.byte	62
	.byte	81
	.byte	73
	.byte	69
	.byte	62
	.byte	0
	.byte	66
	.byte	127
	.byte	64
	.byte	0
	.byte	66
	.byte	97
	.byte	81
	.byte	73
	.byte	70
	.byte	33
	.byte	65
	.byte	69
	.byte	75
	.byte	49
	.byte	24
	.byte	20
	.byte	18
	.byte	127
	.byte	16
	.byte	39
	.byte	69
	.byte	69
	.byte	69
	.byte	57
	.byte	60
	.byte	74
	.byte	73
	.byte	73
	.byte	48
	.byte	1
	.byte	113
	.byte	9
	.byte	5
	.byte	3
	.byte	54
	.byte	73
	.byte	73
	.byte	73
	.byte	54
	.byte	6
	.byte	73
	.byte	73
	.byte	41
	.byte	30
	.byte	0
	.byte	54
	.byte	54
	.byte	0
	.byte	0
	.byte	0
	.byte	86
	.byte	54
	.byte	0
	.byte	0
	.byte	8
	.byte	20
	.byte	34
	.byte	65
	.byte	0
	.byte	20
	.byte	20
	.byte	20
	.byte	20
	.byte	20
	.byte	0
	.byte	65
	.byte	34
	.byte	20
	.byte	8
	.byte	2
	.byte	1
	.byte	81
	.byte	9
	.byte	6
	.byte	50
	.byte	73
	.byte	89
	.byte	81
	.byte	62
	.byte	126
	.byte	17
	.byte	17
	.byte	17
	.byte	126
	.byte	127
	.byte	73
	.byte	73
	.byte	73
	.byte	54
	.byte	62
	.byte	65
	.byte	65
	.byte	65
	.byte	34
	.byte	127
	.byte	65
	.byte	65
	.byte	34
	.byte	28
	.byte	127
	.byte	73
	.byte	73
	.byte	73
	.byte	65
	.byte	127
	.byte	9
	.byte	9
	.byte	9
	.byte	1
	.byte	62
	.byte	65
	.byte	73
	.byte	73
	.byte	122
	.byte	127
	.byte	8
	.byte	8
	.byte	8
	.byte	127
	.byte	0
	.byte	65
	.byte	127
	.byte	65
	.byte	0
	.byte	32
	.byte	64
	.byte	65
	.byte	63
	.byte	1
	.byte	127
	.byte	8
	.byte	20
	.byte	34
	.byte	65
	.byte	127
	.byte	64
	.byte	64
	.byte	64
	.byte	64
	.byte	127
	.byte	2
	.byte	12
	.byte	2
	.byte	127
	.byte	127
	.byte	4
	.byte	8
	.byte	16
	.byte	127
	.byte	62
	.byte	65
	.byte	65
	.byte	65
	.byte	62
	.byte	127
	.byte	9
	.byte	9
	.byte	9
	.byte	6
	.byte	62
	.byte	65
	.byte	81
	.byte	33
	.byte	94
	.byte	127
	.byte	9
	.byte	25
	.byte	41
	.byte	70
	.byte	70
	.byte	73
	.byte	73
	.byte	73
	.byte	49
	.byte	1
	.byte	1
	.byte	127
	.byte	1
	.byte	1
	.byte	63
	.byte	64
	.byte	64
	.byte	64
	.byte	63
	.byte	31
	.byte	32
	.byte	64
	.byte	32
	.byte	31
	.byte	63
	.byte	64
	.byte	56
	.byte	64
	.byte	63
	.byte	99
	.byte	20
	.byte	8
	.byte	20
	.byte	99
	.byte	7
	.byte	8
	.byte	112
	.byte	8
	.byte	7
	.byte	97
	.byte	81
	.byte	73
	.byte	69
	.byte	67
	.byte	0
	.byte	127
	.byte	65
	.byte	65
	.byte	0
	.byte	85
	.byte	42
	.byte	85
	.byte	42
	.byte	85
	.byte	0
	.byte	65
	.byte	65
	.byte	127
	.byte	0
	.byte	4
	.byte	2
	.byte	1
	.byte	2
	.byte	4
	.byte	64
	.byte	64
	.byte	64
	.byte	64
	.byte	64
	.byte	0
	.byte	1
	.byte	2
	.byte	4
	.byte	0
	.byte	32
	.byte	84
	.byte	84
	.byte	84
	.byte	120
	.byte	127
	.byte	72
	.byte	68
	.byte	68
	.byte	56
	.byte	56
	.byte	68
	.byte	68
	.byte	68
	.byte	32
	.byte	56
	.byte	68
	.byte	68
	.byte	72
	.byte	127
	.byte	56
	.byte	84
	.byte	84
	.byte	84
	.byte	24
	.byte	8
	.byte	126
	.byte	9
	.byte	1
	.byte	2
	.byte	12
	.byte	82
	.byte	82
	.byte	82
	.byte	62
	.byte	127
	.byte	8
	.byte	4
	.byte	4
	.byte	120
	.byte	0
	.byte	68
	.byte	125
	.byte	64
	.byte	0
	.byte	32
	.byte	64
	.byte	68
	.byte	61
	.byte	0
	.byte	127
	.byte	16
	.byte	40
	.byte	68
	.byte	0
	.byte	0
	.byte	65
	.byte	127
	.byte	64
	.byte	0
	.byte	124
	.byte	4
	.byte	24
	.byte	4
	.byte	120
	.byte	124
	.byte	8
	.byte	4
	.byte	4
	.byte	120
	.byte	56
	.byte	68
	.byte	68
	.byte	68
	.byte	56
	.byte	124
	.byte	20
	.byte	20
	.byte	20
	.byte	8
	.byte	8
	.byte	20
	.byte	20
	.byte	24
	.byte	124
	.byte	124
	.byte	8
	.byte	4
	.byte	4
	.byte	8
	.byte	72
	.byte	84
	.byte	84
	.byte	84
	.byte	32
	.byte	4
	.byte	63
	.byte	68
	.byte	64
	.byte	32
	.byte	60
	.byte	64
	.byte	64
	.byte	32
	.byte	124
	.byte	28
	.byte	32
	.byte	64
	.byte	32
	.byte	28
	.byte	60
	.byte	64
	.byte	48
	.byte	64
	.byte	60
	.byte	68
	.byte	40
	.byte	16
	.byte	40
	.byte	68
	.byte	12
	.byte	80
	.byte	80
	.byte	80
	.byte	60
	.byte	68
	.byte	100
	.byte	84
	.byte	76
	.byte	68
	.ident	"GCC: (GNU) 8.1.0"
.global __do_copy_data
.global __do_clear_bss
