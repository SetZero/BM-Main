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
.global	_Z13LcdGotoXYFontcc
	.type	_Z13LcdGotoXYFontcc, @function
_Z13LcdGotoXYFontcc:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
 ;  pcd8544.h:456: 	if (x > 14)
	cpi r24,lo8(15)	 ;  x,
	brsh .L5	 ; ,
 ;  pcd8544.h:458: 	if (y > 6)
	cpi r22,lo8(7)	 ;  y,
	brsh .L5	 ; ,
 ;  pcd8544.h:462: 	LcdCacheIdx = (x - 1) * 6 + (y - 1) * 84;
	mov r20,r24	 ; , x
	subi r20,1	 ; ,
	sbc r21,r21	 ; 
	movw r18,r20	 ;  tmp53,
	ldi r20,lo8(6)	 ;  tmp55,
	mul r20,r18	 ;  tmp55, tmp53
	movw r24,r0	 ;  tmp54
	mul r20,r19	 ;  tmp55, tmp53
	add r25,r0	 ;  tmp54
	clr __zero_reg__
	ldi r21,lo8(84)	 ; ,
	mul r22,r21	 ;  y,
	add r24,r0	 ;  tmp58
	adc r25,r1	 ;  tmp58
	clr __zero_reg__
	subi r24,84	 ;  tmp60,
	sbc r25,__zero_reg__	 ; 
	sts _ZL11LcdCacheIdx+1,r25	 ;  LcdCacheIdx, tmp60
	sts _ZL11LcdCacheIdx,r24	 ;  LcdCacheIdx, tmp60
 ;  pcd8544.h:463: 	return OK;
	ldi r24,0	 ;  <retval>
	ret
.L5:
 ;  pcd8544.h:457: 		return OUT_OF_BORDER;
	ldi r24,lo8(1)	 ;  <retval>,
/* epilogue start */
 ;  pcd8544.h:464: }
	ret
	.size	_Z13LcdGotoXYFontcc, .-_Z13LcdGotoXYFontcc
.global	_Z6LcdChr11LcdFontSizec
	.type	_Z6LcdChr11LcdFontSizec, @function
_Z6LcdChr11LcdFontSizec:
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
 ;  pcd8544.h:480: 	if (LcdCacheIdx < LoWaterMark)
	lds r18,_ZL11LcdCacheIdx	 ;  LcdCacheIdx.8_1, LcdCacheIdx
	lds r19,_ZL11LcdCacheIdx+1	 ;  LcdCacheIdx.8_1, LcdCacheIdx
	lds r20,_ZL11LoWaterMark	 ;  LoWaterMark, LoWaterMark
	lds r21,_ZL11LoWaterMark+1	 ;  LoWaterMark, LoWaterMark
	cp r18,r20	 ;  LcdCacheIdx.8_1, LoWaterMark
	cpc r19,r21	 ;  LcdCacheIdx.8_1, LoWaterMark
	brge .L7	 ; ,
 ;  pcd8544.h:483: 		LoWaterMark = LcdCacheIdx;
	sts _ZL11LoWaterMark+1,r19	 ;  LoWaterMark, LcdCacheIdx.8_1
	sts _ZL11LoWaterMark,r18	 ;  LoWaterMark, LcdCacheIdx.8_1
.L7:
 ;  pcd8544.h:486: 	if ((ch < 0x20) || (ch > 0x7b))
	ldi r25,lo8(-32)	 ;  tmp160,
	add r25,r22	 ;  tmp160, ch
	cpi r25,lo8(92)	 ;  tmp160,
	brlo .L8	 ; ,
 ;  pcd8544.h:489: 		ch = 92;
	ldi r22,lo8(92)	 ;  ch,
.L8:
 ;  pcd8544.h:492: 	if (size == FONT_1X)
	cpi r24,lo8(1)	 ;  size,
	breq .+2	 ; 
	rjmp .L9	 ; 
 ;  pcd8544.h:497: 			LcdCache[LcdCacheIdx++] = pgm_read_byte(&(FontLookup[ch - 32][i])) << 1;
	subi r22,32	 ;  tmp162,
	sbc r23,r23	 ;  tmp162
	ldi r24,lo8(5)	 ;  tmp163,
	mul r24,r22	 ;  tmp163, tmp162
	movw r20,r0	 ;  _108
	mul r24,r23	 ;  tmp163, tmp162
	add r21,r0	 ;  _108
	clr __zero_reg__
	movw r26,r18	 ;  ivtmp.121, LcdCacheIdx.8_1
	subi r26,lo8(-(_ZL8LcdCache))	 ;  ivtmp.121,
	sbci r27,hi8(-(_ZL8LcdCache))	 ;  ivtmp.121,
	ldi r25,0	 ;  ivtmp.111
	ldi r24,0	 ;  ivtmp.111
	subi r20,lo8(-(_ZL10FontLookup))	 ;  tmp165,
	sbci r21,hi8(-(_ZL10FontLookup))	 ;  tmp165,
.L10:
 ;  pcd8544.h:497: 			LcdCache[LcdCacheIdx++] = pgm_read_byte(&(FontLookup[ch - 32][i])) << 1;
	movw r30,r20	 ;  tmp166, tmp165
	add r30,r24	 ;  tmp166, ivtmp.111
	adc r31,r25	 ; , ivtmp.111
/* #APP */
 ;  497 "pcd8544.h" 1
	lpm r30, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	lsl r30	 ;  tmp167
	st X+,r30	 ;  MEM[base: _115, offset: 0B], tmp167
	adiw r24,1	 ;  ivtmp.111,
 ;  pcd8544.h:494: 		for (i = 0; i < 5; i++)
	cpi r24,5	 ;  ivtmp.111,
	cpc r25,__zero_reg__	 ;  ivtmp.111
	brne .L10	 ; ,
	subi r18,-5	 ;  tmp168,
	sbci r19,-1	 ; ,
	sts _ZL11LcdCacheIdx+1,r19	 ;  LcdCacheIdx, tmp168
	sts _ZL11LcdCacheIdx,r18	 ;  LcdCacheIdx, tmp168
.L11:
 ;  pcd8544.h:541: 	if (LcdCacheIdx > HiWaterMark)
	lds r24,_ZL11LcdCacheIdx	 ;  LcdCacheIdx.30_47, LcdCacheIdx
	lds r25,_ZL11LcdCacheIdx+1	 ;  LcdCacheIdx.30_47, LcdCacheIdx
	lds r18,_ZL11HiWaterMark	 ;  HiWaterMark, HiWaterMark
	lds r19,_ZL11HiWaterMark+1	 ;  HiWaterMark, HiWaterMark
	cp r18,r24	 ;  HiWaterMark, LcdCacheIdx.30_47
	cpc r19,r25	 ;  HiWaterMark, LcdCacheIdx.30_47
	brge .L15	 ; ,
 ;  pcd8544.h:544: 		HiWaterMark = LcdCacheIdx;
	sts _ZL11HiWaterMark+1,r25	 ;  HiWaterMark, LcdCacheIdx.30_47
	sts _ZL11HiWaterMark,r24	 ;  HiWaterMark, LcdCacheIdx.30_47
.L15:
 ;  pcd8544.h:549: 	LcdCache[LcdCacheIdx] = 0x00;
	movw r30,r24	 ;  tmp214, LcdCacheIdx.30_47
	subi r30,lo8(-(_ZL8LcdCache))	 ;  tmp214,
	sbci r31,hi8(-(_ZL8LcdCache))	 ;  tmp214,
	st Z,__zero_reg__	 ;  LcdCache,
 ;  pcd8544.h:551: 	if (LcdCacheIdx == (LCD_CACHE_SIZE - 1))
	cpi r24,-9	 ;  LcdCacheIdx.30_47,
	ldi r31,1	 ; ,
	cpc r25,r31	 ;  LcdCacheIdx.30_47,
	breq .+2	 ; 
	rjmp .L16	 ; 
 ;  pcd8544.h:553: 		LcdCacheIdx = 0;
	sts _ZL11LcdCacheIdx+1,__zero_reg__	 ;  LcdCacheIdx,
	sts _ZL11LcdCacheIdx,__zero_reg__	 ;  LcdCacheIdx,
 ;  pcd8544.h:554: 		return OK_WITH_WRAP;
	ldi r24,lo8(2)	 ;  <retval>,
.L6:
/* epilogue start */
 ;  pcd8544.h:560: }
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	ret
.L9:
 ;  pcd8544.h:500: 	else if (size == FONT_2X)
	cpi r24,lo8(2)	 ;  size,
	brne .L11	 ; ,
 ;  pcd8544.h:502: 		tmpIdx = LcdCacheIdx - 84;
	movw r24,r18	 ;  tmpIdx, LcdCacheIdx.8_1
	subi r24,84	 ;  tmpIdx,
	sbc r25,__zero_reg__	 ;  tmpIdx
 ;  pcd8544.h:504: 		if (tmpIdx < LoWaterMark)
	lds r20,_ZL11LoWaterMark	 ;  LoWaterMark, LoWaterMark
	lds r21,_ZL11LoWaterMark+1	 ;  LoWaterMark, LoWaterMark
	cp r24,r20	 ;  tmpIdx, LoWaterMark
	cpc r25,r21	 ;  tmpIdx, LoWaterMark
	brge .L12	 ; ,
 ;  pcd8544.h:506: 			LoWaterMark = tmpIdx;
	sts _ZL11LoWaterMark+1,r25	 ;  LoWaterMark, tmpIdx
	sts _ZL11LoWaterMark,r24	 ;  LoWaterMark, tmpIdx
.L12:
 ;  pcd8544.h:509: 		if (tmpIdx < 0) return OUT_OF_BORDER;
	sbrc r25,7	 ;  tmpIdx,
	rjmp .L18	 ; 
 ;  pcd8544.h:514: 			c = pgm_read_byte(&(FontLookup[ch - 32][i])) << 1;
	mov r20,r22	 ; , ch
	subi r20,32	 ; ,
	sbc r21,r21	 ; 
	movw r24,r20	 ;  tmp171,
	ldi r20,lo8(5)	 ;  tmp172,
	mul r20,r24	 ;  tmp172, tmp171
	movw r22,r0	 ;  _51
	mul r20,r25	 ;  tmp172, tmp171
	add r23,r0	 ;  _51
	clr __zero_reg__
	movw r26,r18	 ;  ivtmp.133, LcdCacheIdx.8_1
	subi r26,lo8(-(_ZL8LcdCache))	 ;  ivtmp.133,
	sbci r27,hi8(-(_ZL8LcdCache))	 ;  ivtmp.133,
	ldi r21,0	 ;  ivtmp.123
	ldi r20,0	 ;  ivtmp.123
	subi r22,lo8(-(_ZL10FontLookup))	 ;  tmp174,
	sbci r23,hi8(-(_ZL10FontLookup))	 ;  tmp174,
 ;  pcd8544.h:519: 			b1 |= (c & 0x04) * 12;
	ldi r29,lo8(12)	 ;  tmp183,
 ;  pcd8544.h:520: 			b1 |= (c & 0x08) * 24;
	ldi r28,lo8(24)	 ;  tmp187,
.L14:
 ;  pcd8544.h:514: 			c = pgm_read_byte(&(FontLookup[ch - 32][i])) << 1;
	movw r30,r22	 ;  tmp175, tmp174
	add r30,r20	 ;  tmp175, ivtmp.123
	adc r31,r21	 ; , ivtmp.123
/* #APP */
 ;  514 "pcd8544.h" 1
	lpm r30, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	lsl r30	 ;  c
 ;  pcd8544.h:518: 			b1 |= (c & 0x02) * 6;
	mov r25,r30	 ;  tmp176, c
	andi r25,lo8(2)	 ;  tmp176,
	mov r24,r25	 ;  tmp178, tmp176
	lsl r24	 ;  tmp178
	add r24,r25	 ;  tmp179, tmp176
	lsl r24	 ;  tmp180
 ;  pcd8544.h:519: 			b1 |= (c & 0x04) * 12;
	mov r25,r30	 ;  tmp181, c
	andi r25,lo8(4)	 ;  tmp181,
	mul r25,r29	 ;  tmp181, tmp183
	mov r25,r0	 ;  tmp182
	clr r1
	or r24,r25	 ;  tmp184, tmp182
 ;  pcd8544.h:520: 			b1 |= (c & 0x08) * 24;
	mov r25,r30	 ;  tmp185, c
	andi r25,lo8(8)	 ;  tmp185,
	mul r25,r28	 ;  tmp185, tmp187
	mov r25,r0	 ;  tmp186
	clr r1
	or r24,r25	 ;  b1, tmp186
 ;  pcd8544.h:522: 			c >>= 4;
	ldi r31,0	 ;  c
	ldi r25,4	 ; ,
	1:
	asr r31	 ;  _28
	ror r30	 ;  _28
	dec r25	 ; 
	brne 1b
 ;  pcd8544.h:525: 			b2 |= (c & 0x02) * 6;
	mov r31,r30	 ;  tmp189,
	andi r31,lo8(2)	 ;  tmp189,
	mov r25,r31	 ;  tmp191, tmp189
	lsl r25	 ;  tmp191
	add r25,r31	 ;  tmp192, tmp189
	lsl r25	 ;  tmp193
 ;  pcd8544.h:524: 			b2 = (c & 0x01) * 3;
	mov r17,r30	 ;  tmp194,
	andi r17,lo8(1)	 ;  tmp194,
	mov r31,r17	 ;  tmp196, tmp194
	lsl r31	 ;  tmp196
	add r31,r17	 ;  b2, tmp194
 ;  pcd8544.h:525: 			b2 |= (c & 0x02) * 6;
	or r25,r31	 ;  tmp198, b2
 ;  pcd8544.h:526: 			b2 |= (c & 0x04) * 12;
	mov r31,r30	 ;  tmp199,
	andi r31,lo8(4)	 ;  tmp199,
	mul r31,r29	 ;  tmp199, tmp183
	mov r31,r0	 ;  tmp200
	clr r1
	or r25,r31	 ;  tmp202, tmp200
 ;  pcd8544.h:527: 			b2 |= (c & 0x08) * 24;
	andi r30,lo8(8)	 ;  tmp203,
	mul r30,r28	 ;  tmp203, tmp187
	mov r30,r0	 ;  tmp204
	clr r1
	or r25,r30	 ;  _42, tmp204
 ;  pcd8544.h:530: 			LcdCache[tmpIdx++] = b1;
	movw r16,r26	 ;  tmp206, ivtmp.133
	subi r16,84	 ;  tmp206,
	sbc r17,__zero_reg__	 ; 
	movw r30,r16	 ; , tmp206
	st Z,r24	 ;  MEM[base: _129, offset: 0B], b1
 ;  pcd8544.h:531: 			LcdCache[tmpIdx++] = b1;
	subi r16,-1	 ;  tmp207,
	sbci r17,-1	 ; ,
	movw r30,r16	 ; , tmp207
	st Z,r24	 ;  MEM[base: _131, offset: 0B], b1
 ;  pcd8544.h:532: 			LcdCache[tmpIdx + 82] = b2;
	st X,r25	 ;  MEM[base: _128, offset: 0B], _42
 ;  pcd8544.h:533: 			LcdCache[tmpIdx + 83] = b2;
	adiw r26,1	 ;  MEM[base: _128, offset: 1B]
	st X,r25	 ;  _42
	sbiw r26,1	 ;  MEM[base: _128, offset: 1B]
	subi r20,-1	 ;  ivtmp.123,
	sbci r21,-1	 ;  ivtmp.123,
	adiw r26,2	 ;  ivtmp.133,
 ;  pcd8544.h:511: 		for (i = 0; i < 5; i++)
	cpi r20,5	 ;  ivtmp.123,
	cpc r21,__zero_reg__	 ;  ivtmp.123
	breq .+2	 ; 
	rjmp .L14	 ; 
 ;  pcd8544.h:538: 		LcdCacheIdx = (LcdCacheIdx + 11) % LCD_CACHE_SIZE;
	movw r24,r18	 ;  tmp208, LcdCacheIdx.8_1
	adiw r24,11	 ;  tmp208,
	ldi r22,lo8(-8)	 ; ,
	ldi r23,lo8(1)	 ; ,
	call __divmodhi4
	sts _ZL11LcdCacheIdx+1,r25	 ;  LcdCacheIdx, tmp209
	sts _ZL11LcdCacheIdx,r24	 ;  LcdCacheIdx, tmp209
	rjmp .L11	 ; 
.L16:
 ;  pcd8544.h:557: 	LcdCacheIdx++;
	adiw r24,1	 ;  tmp215,
	sts _ZL11LcdCacheIdx+1,r25	 ;  LcdCacheIdx, tmp215
	sts _ZL11LcdCacheIdx,r24	 ;  LcdCacheIdx, tmp215
 ;  pcd8544.h:559: 	return OK;
	ldi r24,0	 ;  <retval>
	rjmp .L6	 ; 
.L18:
 ;  pcd8544.h:509: 		if (tmpIdx < 0) return OUT_OF_BORDER;
	ldi r24,lo8(1)	 ;  <retval>,
	rjmp .L6	 ; 
	.size	_Z6LcdChr11LcdFontSizec, .-_Z6LcdChr11LcdFontSizec
.global	_Z6LcdStr11LcdFontSizePc
	.type	_Z6LcdStr11LcdFontSizePc, @function
_Z6LcdStr11LcdFontSizePc:
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	mov r29,r24	 ;  size, size
	movw r16,r22	 ;  dataArray, dataArray
 ;  pcd8544.h:574: 	char tmpIdx = 0;
	ldi r28,0	 ;  tmpIdx
.L23:
 ;  pcd8544.h:576: 	while (dataArray[tmpIdx] != '\0')
	movw r30,r16	 ;  tmp49, dataArray
	add r30,r28	 ;  tmp49, tmpIdx
	adc r31,__zero_reg__	 ;  tmp49
	ld r24,Z	 ;  <retval>, *_2
	tst r24	 ;  <retval>
	breq .L21	 ; ,
 ;  pcd8544.h:579: 		response = LcdChr(size, dataArray[tmpIdx]);
	mov r22,r24	 ; , <retval>
	mov r24,r29	 ; , size
	call _Z6LcdChr11LcdFontSizec	 ; 
 ;  pcd8544.h:583: 		if (response == OUT_OF_BORDER)
	cpi r24,lo8(1)	 ;  <retval>,
	breq .L21	 ; ,
 ;  pcd8544.h:586: 		tmpIdx++;
	subi r28,lo8(-(1))	 ;  tmpIdx,
 ;  pcd8544.h:576: 	while (dataArray[tmpIdx] != '\0')
	rjmp .L23	 ; 
.L21:
/* epilogue start */
 ;  pcd8544.h:589: }
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	ret
	.size	_Z6LcdStr11LcdFontSizePc, .-_Z6LcdStr11LcdFontSizePc
.global	_Z7LcdFStr11LcdFontSizePKc
	.type	_Z7LcdFStr11LcdFontSizePKc, @function
_Z7LcdFStr11LcdFontSizePKc:
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	mov r17,r24	 ;  size, size
	movw r28,r22	 ;  dataPtr, dataPtr
.L39:
 ;  pcd8544.h:607: 	for (c = pgm_read_byte(dataPtr); c; ++dataPtr, c = pgm_read_byte(dataPtr))
	movw r30,r28	 ; , dataPtr
/* #APP */
 ;  607 "pcd8544.h" 1
	lpm r24, Z	 ;  <retval>
	
 ;  0 "" 2
/* #NOAPP */
	tst r24	 ;  <retval>
	breq .L30	 ; ,
 ;  pcd8544.h:610: 		response = LcdChr(size, c);
	mov r22,r24	 ; , <retval>
	mov r24,r17	 ; , size
	call _Z6LcdChr11LcdFontSizec	 ; 
 ;  pcd8544.h:611: 		if (response == OUT_OF_BORDER)
	cpi r24,lo8(1)	 ;  <retval>,
	breq .L30	 ; ,
 ;  pcd8544.h:607: 	for (c = pgm_read_byte(dataPtr); c; ++dataPtr, c = pgm_read_byte(dataPtr))
	adiw r28,1	 ;  dataPtr,
	rjmp .L39	 ; 
.L30:
/* epilogue start */
 ;  pcd8544.h:616: }
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	ret
	.size	_Z7LcdFStr11LcdFontSizePKc, .-_Z7LcdFStr11LcdFontSizePKc
.global	_Z8LcdPixelcc12LcdPixelMode
	.type	_Z8LcdPixelcc12LcdPixelMode, @function
_Z8LcdPixelcc12LcdPixelMode:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
 ;  pcd8544.h:633: 	if (x > LCD_X_RES) return OUT_OF_BORDER;
	cpi r24,lo8(85)	 ;  x,
	brlo .+2	 ; 
	rjmp .L47	 ; 
 ;  pcd8544.h:634: 	if (y > LCD_Y_RES) return OUT_OF_BORDER;
	cpi r22,lo8(49)	 ;  y,
	brlo .+2	 ; 
	rjmp .L47	 ; 
 ;  pcd8544.h:637: 	index = ((y / 8) * 84) + x;
	mov r18,r22	 ;  tmp73, y
	lsr r18	 ;  tmp73
	lsr r18	 ;  tmp73
	lsr r18	 ;  tmp73
	ldi r25,0	 ;  x
	ldi r19,lo8(84)	 ; ,
	mul r18,r19	 ;  tmp73,
	add r24,r0	 ;  _13
	adc r25,r1	 ;  _13
	clr __zero_reg__
	andi r22,lo8(7)	 ;  _15,
 ;  pcd8544.h:640: 	data = LcdCache[index];
	movw r30,r24	 ;  tmp78, _13
	subi r30,lo8(-(_ZL8LcdCache))	 ;  tmp78,
	sbci r31,hi8(-(_ZL8LcdCache))	 ;  tmp78,
	ld r18,Z	 ;  data, LcdCache
 ;  pcd8544.h:645: 	if (mode == PIXEL_OFF)
	cpse r20,__zero_reg__	 ;  mode,
	rjmp .L42	 ; 
 ;  pcd8544.h:647: 		data &= (~(0x01 << offset));
	ldi r20,lo8(1)	 ;  tmp81,
	ldi r21,0	 ; 
	rjmp 2f
	1:
	lsl r20	 ;  tmp80
	2:
	dec r22	 ;  _15
	brpl 1b
	com r20	 ;  tmp82
	and r18,r20	 ;  data, tmp82
.L43:
 ;  pcd8544.h:663: 	LcdCache[index] = data;
	st Z,r18	 ;  LcdCache, data
 ;  pcd8544.h:665: 	if (index < LoWaterMark)
	lds r18,_ZL11LoWaterMark	 ;  LoWaterMark, LoWaterMark
	lds r19,_ZL11LoWaterMark+1	 ;  LoWaterMark, LoWaterMark
	cp r24,r18	 ;  _13, LoWaterMark
	cpc r25,r19	 ;  _13, LoWaterMark
	brsh .L45	 ; ,
 ;  pcd8544.h:668: 		LoWaterMark = index;
	sts _ZL11LoWaterMark+1,r25	 ;  LoWaterMark, _13
	sts _ZL11LoWaterMark,r24	 ;  LoWaterMark, _13
.L45:
 ;  pcd8544.h:671: 	if (index > HiWaterMark)
	lds r18,_ZL11HiWaterMark	 ;  HiWaterMark, HiWaterMark
	lds r19,_ZL11HiWaterMark+1	 ;  HiWaterMark, HiWaterMark
	cp r18,r24	 ;  HiWaterMark, _13
	cpc r19,r25	 ;  HiWaterMark, _13
	brsh .L48	 ; ,
 ;  pcd8544.h:674: 		HiWaterMark = index;
	sts _ZL11HiWaterMark+1,r25	 ;  HiWaterMark, _13
	sts _ZL11HiWaterMark,r24	 ;  HiWaterMark, _13
.L48:
 ;  pcd8544.h:671: 	if (index > HiWaterMark)
	ldi r24,0	 ;  <retval>
/* epilogue start */
 ;  pcd8544.h:677: }
	ret
.L42:
 ;  pcd8544.h:651: 	else if (mode == PIXEL_ON)
	cpi r20,lo8(1)	 ;  mode,
	brne .L44	 ; ,
 ;  pcd8544.h:653: 		data |= (0x01 << offset);
	ldi r20,lo8(1)	 ;  tmp85,
	ldi r21,0	 ; 
	rjmp 2f
	1:
	lsl r20	 ;  tmp84
	2:
	dec r22	 ;  _15
	brpl 1b
	or r18,r20	 ;  data, tmp84
	rjmp .L43	 ; 
.L44:
 ;  pcd8544.h:657: 	else if (mode == PIXEL_XOR)
	cpi r20,lo8(2)	 ;  mode,
	brne .L43	 ; ,
 ;  pcd8544.h:659: 		data ^= (0x01 << offset);
	ldi r20,lo8(1)	 ;  tmp88,
	ldi r21,0	 ; 
	rjmp 2f
	1:
	lsl r20	 ;  tmp87
	2:
	dec r22	 ;  _15
	brpl 1b
	eor r18,r20	 ;  data, tmp87
	rjmp .L43	 ; 
.L47:
 ;  pcd8544.h:633: 	if (x > LCD_X_RES) return OUT_OF_BORDER;
	ldi r24,lo8(1)	 ;  <retval>,
	ret
	.size	_Z8LcdPixelcc12LcdPixelMode, .-_Z8LcdPixelcc12LcdPixelMode
.global	_Z7LcdLinecccc12LcdPixelMode
	.type	_Z7LcdLinecccc12LcdPixelMode, @function
_Z7LcdLinecccc12LcdPixelMode:
	push r6	 ; 
	push r7	 ; 
	push r8	 ; 
	push r9	 ; 
	push r10	 ; 
	push r11	 ; 
	push r12	 ; 
	push r13	 ; 
	push r14	 ; 
	push r15	 ; 
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 14 */
.L__stack_usage = 14
	mov r17,r24	 ;  x1, x1
	mov r7,r22	 ;  x2, x2
	mov r13,r20	 ;  y1, y1
	mov r6,r18	 ;  y2, y2
 ;  pcd8544.h:698: 	dy = y2 - y1;
	mov r24,r18	 ; , y2
	sub r24,r20	 ; , y1
	sbc r25,r25	 ; 
	movw r14,r24	 ;  dy,
 ;  pcd8544.h:699: 	dx = x2 - x1;
	mov r24,r22	 ; , x2
	sub r24,r17	 ; , x1
	sbc r25,r25	 ; 
	movw r28,r24	 ;  dx,
 ;  pcd8544.h:709: 		stepy = 1;
	clr r9	 ;  stepy
	inc r9	 ;  stepy
 ;  pcd8544.h:702: 	if (dy < 0)
	sbrs r15,7	 ;  dy,
	rjmp .L50	 ; 
 ;  pcd8544.h:704: 		dy = -dy;
	neg r15	 ;  dy
	neg r14	 ;  dy
	sbc r15,__zero_reg__	 ;  dy
 ;  pcd8544.h:705: 		stepy = -1;
	clr r9	 ;  stepy
	dec r9	 ;  stepy
.L50:
 ;  pcd8544.h:720: 		stepx = 1;
	clr r8	 ;  stepx
	inc r8	 ;  stepx
 ;  pcd8544.h:713: 	if (dx < 0)
	sbrs r29,7	 ;  dx,
	rjmp .L51	 ; 
 ;  pcd8544.h:715: 		dx = -dx;
	neg r29	 ;  dx
	neg r28	 ;  dx
	sbc r29,__zero_reg__	 ;  dx
 ;  pcd8544.h:716: 		stepx = -1;
	clr r8	 ;  stepx
	dec r8	 ;  stepx
.L51:
 ;  pcd8544.h:727: 	response = LcdPixel(x1, y1, mode);
	mov r20,r16	 ; , mode
	mov r22,r13	 ; , y1
	mov r24,r17	 ; , x1
	call _Z8LcdPixelcc12LcdPixelMode	 ; 
	mov r12,r24	 ;  <retval>,
 ;  pcd8544.h:728: 	if (response)
	cpse r24,__zero_reg__	 ;  <retval>,
	rjmp .L49	 ; 
 ;  pcd8544.h:723: 	dx <<= 1;
	lsl r28	 ;  dx
	rol r29	 ;  dx
 ;  pcd8544.h:724: 	dy <<= 1;
	lsl r14	 ;  dy
	rol r15	 ;  dy
 ;  pcd8544.h:732: 	if (dx > dy)
	cp r14,r28	 ;  dy, dx
	cpc r15,r29	 ;  dy, dx
	brge .L53	 ; ,
 ;  pcd8544.h:735: 		fraction = dy - (dx >> 1);
	movw r24,r28	 ;  tmp72, dx
	asr r25	 ;  tmp72
	ror r24	 ;  tmp72
	movw r10,r14	 ;  fraction, dy
	sub r10,r24	 ;  fraction, tmp72
	sbc r11,r25	 ;  fraction,
.L56:
 ;  pcd8544.h:736: 		while (x1 != x2)
	cp r17,r7	 ;  x1, x2
	breq .L49	 ; ,
 ;  pcd8544.h:738: 			if (fraction >= 0)
	sbrc r11,7	 ;  fraction,
	rjmp .L55	 ; 
 ;  pcd8544.h:740: 				y1 += stepy;
	add r13,r9	 ;  y1, stepy
 ;  pcd8544.h:741: 				fraction -= dx;
	sub r10,r28	 ;  fraction, dx
	sbc r11,r29	 ;  fraction, dx
.L55:
 ;  pcd8544.h:743: 			x1 += stepx;
	add r17,r8	 ;  x1, stepx
 ;  pcd8544.h:744: 			fraction += dy;
	add r10,r14	 ;  fraction, dy
	adc r11,r15	 ;  fraction, dy
 ;  pcd8544.h:747: 			response = LcdPixel(x1, y1, mode);
	mov r20,r16	 ; , mode
	mov r22,r13	 ; , y1
	mov r24,r17	 ; , x1
	call _Z8LcdPixelcc12LcdPixelMode	 ; 
 ;  pcd8544.h:748: 			if (response)
	tst r24	 ;  response
	breq .L56	 ; ,
.L62:
 ;  pcd8544.h:747: 			response = LcdPixel(x1, y1, mode);
	mov r12,r24	 ;  <retval>, response
.L49:
 ;  pcd8544.h:777: }
	mov r24,r12	 ; , <retval>
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	pop r11	 ; 
	pop r10	 ; 
	pop r9	 ; 
	pop r8	 ; 
	pop r7	 ; 
	pop r6	 ; 
	ret
.L53:
 ;  pcd8544.h:756: 		fraction = dx - (dy >> 1);
	movw r24,r14	 ;  tmp73, dy
	asr r25	 ;  tmp73
	ror r24	 ;  tmp73
	movw r10,r28	 ;  fraction, dx
	sub r10,r24	 ;  fraction, tmp73
	sbc r11,r25	 ;  fraction,
.L59:
 ;  pcd8544.h:757: 		while (y1 != y2)
	cp r13,r6	 ;  y1, y2
	breq .L49	 ; ,
 ;  pcd8544.h:759: 			if (fraction >= 0)
	sbrc r11,7	 ;  fraction,
	rjmp .L58	 ; 
 ;  pcd8544.h:761: 				x1 += stepx;
	add r17,r8	 ;  x1, stepx
 ;  pcd8544.h:762: 				fraction -= dy;
	sub r10,r14	 ;  fraction, dy
	sbc r11,r15	 ;  fraction, dy
.L58:
 ;  pcd8544.h:764: 			y1 += stepy;
	add r13,r9	 ;  y1, stepy
 ;  pcd8544.h:765: 			fraction += dx;
	add r10,r28	 ;  fraction, dx
	adc r11,r29	 ;  fraction, dx
 ;  pcd8544.h:768: 			response = LcdPixel(x1, y1, mode);
	mov r20,r16	 ; , mode
	mov r22,r13	 ; , y1
	mov r24,r17	 ; , x1
	call _Z8LcdPixelcc12LcdPixelMode	 ; 
 ;  pcd8544.h:769: 			if (response)
	tst r24	 ;  response
	breq .L59	 ; ,
	rjmp .L62	 ; 
	.size	_Z7LcdLinecccc12LcdPixelMode, .-_Z7LcdLinecccc12LcdPixelMode
.global	_Z12LcdSingleBarcccc12LcdPixelMode
	.type	_Z12LcdSingleBarcccc12LcdPixelMode, @function
_Z12LcdSingleBarcccc12LcdPixelMode:
	push r12	 ; 
	push r13	 ; 
	push r15	 ; 
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 7 */
.L__stack_usage = 7
	mov r15,r24	 ;  baseX, baseX
	mov r29,r22	 ;  baseY, baseY
 ;  pcd8544.h:796: 	if ((baseX > LCD_X_RES) || (baseY > LCD_Y_RES)) return OUT_OF_BORDER;
	ldi r24,lo8(84)	 ; ,
	cp r24,r15	 ; , baseX
	brlo .L72	 ; ,
 ;  pcd8544.h:796: 	if ((baseX > LCD_X_RES) || (baseY > LCD_Y_RES)) return OUT_OF_BORDER;
	cpi r22,lo8(49)	 ;  baseY,
	brsh .L72	 ; ,
 ;  pcd8544.h:801: 		tmp = baseY - height;
	mov r28,r22	 ;  tmp, baseY
	sub r28,r20	 ;  tmp, height
 ;  pcd8544.h:798: 	if (height > baseY)
	cp r22,r20	 ;  baseY, height
	brsh .L67	 ; ,
 ;  pcd8544.h:799: 		tmp = 0;
	ldi r28,0	 ;  tmp
.L67:
 ;  pcd8544.h:806: 		for (tmpIdxX = baseX; tmpIdxX < (baseX + width); tmpIdxX++)
	mov r24,r15	 ; , baseX
	add r24,r18	 ; , width
	clr r25	 ; 
	rol r25	 ; 
	movw r12,r24	 ;  tmp65,
.L70:
 ;  pcd8544.h:804: 	for (tmpIdxY = tmp; tmpIdxY < baseY; tmpIdxY++)
	cp r28,r29	 ;  tmp, baseY
	brsh .L74	 ; ,
	mov r17,r15	 ;  tmpIdxX, baseX
.L69:
 ;  pcd8544.h:806: 		for (tmpIdxX = baseX; tmpIdxX < (baseX + width); tmpIdxX++)
	cp r17,r12	 ;  tmpIdxX, tmp65
	cpc __zero_reg__,r13	 ;  tmp65
	brge .L68	 ; ,
 ;  pcd8544.h:808: 			response = LcdPixel(tmpIdxX, tmpIdxY, mode);
	mov r20,r16	 ; , mode
	mov r22,r28	 ; , tmp
	mov r24,r17	 ; , tmpIdxX
	call _Z8LcdPixelcc12LcdPixelMode	 ; 
 ;  pcd8544.h:809: 			if (response)
	cpse r24,__zero_reg__	 ;  <retval>,
	rjmp .L65	 ; 
 ;  pcd8544.h:806: 		for (tmpIdxX = baseX; tmpIdxX < (baseX + width); tmpIdxX++)
	subi r17,lo8(-(1))	 ;  tmpIdxX,
	rjmp .L69	 ; 
.L68:
 ;  pcd8544.h:804: 	for (tmpIdxY = tmp; tmpIdxY < baseY; tmpIdxY++)
	subi r28,lo8(-(1))	 ;  tmp,
	rjmp .L70	 ; 
.L72:
 ;  pcd8544.h:796: 	if ((baseX > LCD_X_RES) || (baseY > LCD_Y_RES)) return OUT_OF_BORDER;
	ldi r24,lo8(1)	 ;  <retval>,
.L65:
/* epilogue start */
 ;  pcd8544.h:818: }
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	pop r13	 ; 
	pop r12	 ; 
	ret
.L74:
 ;  pcd8544.h:817: 	return OK;
	ldi r24,0	 ;  <retval>
	rjmp .L65	 ; 
	.size	_Z12LcdSingleBarcccc12LcdPixelMode, .-_Z12LcdSingleBarcccc12LcdPixelMode
.global	_Z7LcdBarsPcccc
	.type	_Z7LcdBarsPcccc, @function
_Z7LcdBarsPcccc:
	push r11	 ; 
	push r12	 ; 
	push r13	 ; 
	push r14	 ; 
	push r15	 ; 
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 9 */
.L__stack_usage = 9
	mov r29,r20	 ;  width, width
	mov r11,r18	 ;  multiplier, multiplier
	ldi r17,lo8(2)	 ;  _24,
	add r17,r20	 ;  _24, width
	movw r14,r24	 ;  ivtmp.192, data
	movw r12,r24	 ;  _30, ivtmp.192
	add r12,r22	 ;  _30, numbBars
	adc r13,__zero_reg__	 ;  _30
 ;  pcd8544.h:830: {
	ldi r28,lo8(5)	 ;  ivtmp.186,
 ;  pcd8544.h:832: 	char tmpIdx = 0;
	ldi r25,0	 ;  tmpIdx
.L79:
 ;  pcd8544.h:835: 	for (b = 0; b < numbBars; b++)
	cp r14,r12	 ;  ivtmp.192, _30
	cpc r15,r13	 ;  ivtmp.192, _30
	breq .L80	 ; ,
 ;  pcd8544.h:838: 		if (tmpIdx > LCD_X_RES) return OUT_OF_BORDER;
	cpi r25,lo8(85)	 ;  tmpIdx,
	brlo .L77	 ; ,
.L78:
	ldi r24,lo8(1)	 ;  <retval>,
.L75:
/* epilogue start */
 ;  pcd8544.h:853: }
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	pop r11	 ; 
	ret
.L77:
 ;  pcd8544.h:844: 		response = LcdSingleBar(tmpIdx, BAR_Y, data[b] * multiplier, width, PIXEL_ON);
	movw r30,r14	 ; , ivtmp.192
	ld r20,Z+	 ;  _5, MEM[base: _31, offset: 0B]
	movw r14,r30	 ;  ivtmp.192,
	mul r20,r11	 ;  _5, multiplier
	mov r20,r0	 ;  tmp62
	clr r1
	ldi r16,lo8(1)	 ; ,
	mov r18,r29	 ; , width
	ldi r22,lo8(38)	 ; ,
	mov r24,r28	 ; , ivtmp.186
	call _Z12LcdSingleBarcccc12LcdPixelMode	 ; 
	mov r18,r28	 ;  ivtmp.186, ivtmp.186
	add r18,r17	 ;  ivtmp.186, _24
 ;  pcd8544.h:841: 		tmpIdx = ((width + EMPTY_SPACE_BARS) * b) + BAR_X;
	mov r25,r28	 ;  tmpIdx, ivtmp.186
 ;  pcd8544.h:845: 		if (response == OUT_OF_BORDER)
	cpi r24,lo8(1)	 ; ,
	breq .L78	 ; ,
	mov r28,r18	 ;  ivtmp.186, ivtmp.186
	rjmp .L79	 ; 
.L80:
 ;  pcd8544.h:851: 	return OK;
	ldi r24,0	 ;  <retval>
	rjmp .L75	 ; 
	.size	_Z7LcdBarsPcccc, .-_Z7LcdBarsPcccc
.global	_Z7LcdRectcccc12LcdPixelMode
	.type	_Z7LcdRectcccc12LcdPixelMode, @function
_Z7LcdRectcccc12LcdPixelMode:
	push r14	 ; 
	push r15	 ; 
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 6 */
.L__stack_usage = 6
	mov r17,r24	 ;  x1, x1
	mov r15,r22	 ;  x2, x2
	mov r28,r20	 ;  y1, y1
	mov r14,r18	 ;  y2, y2
 ;  pcd8544.h:870: 	if ((x1 > LCD_X_RES) || (x2 > LCD_X_RES) || (y1 > LCD_Y_RES) || (y2 > LCD_Y_RES))
	cpi r24,lo8(85)	 ;  x1,
	brsh .L93	 ; ,
 ;  pcd8544.h:870: 	if ((x1 > LCD_X_RES) || (x2 > LCD_X_RES) || (y1 > LCD_Y_RES) || (y2 > LCD_Y_RES))
	ldi r24,lo8(84)	 ; ,
	cp r24,r22	 ; , x2
	brlo .L93	 ; ,
 ;  pcd8544.h:870: 	if ((x1 > LCD_X_RES) || (x2 > LCD_X_RES) || (y1 > LCD_Y_RES) || (y2 > LCD_Y_RES))
	cpi r20,lo8(49)	 ;  y1,
	brsh .L93	 ; ,
 ;  pcd8544.h:870: 	if ((x1 > LCD_X_RES) || (x2 > LCD_X_RES) || (y1 > LCD_Y_RES) || (y2 > LCD_Y_RES))
	ldi r24,lo8(48)	 ; ,
	cp r24,r18	 ; , y2
	brlo .L93	 ; ,
 ;  pcd8544.h:874: 	if ((x2 > x1) && (y2 > y1))
	cp r17,r22	 ;  x1, x2
	brlo .L86	 ; ,
.L88:
 ;  pcd8544.h:891: 	return OK;
	ldi r24,0	 ;  <retval>
.L84:
/* epilogue start */
 ;  pcd8544.h:892: }
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	pop r14	 ; 
	ret
.L86:
 ;  pcd8544.h:874: 	if ((x2 > x1) && (y2 > y1))
	cp r20,r18	 ;  y1, y2
	brsh .L88	 ; ,
.L87:
 ;  pcd8544.h:865: {
	mov r29,r17	 ;  tmpIdxX, x1
.L89:
 ;  pcd8544.h:882: 				response = LcdPixel(tmpIdxX, tmpIdxY, mode);
	mov r20,r16	 ; , mode
	mov r22,r28	 ; , y1
	mov r24,r29	 ; , tmpIdxX
	call _Z8LcdPixelcc12LcdPixelMode	 ; 
 ;  pcd8544.h:883: 				if (response)
	cpse r24,__zero_reg__	 ;  <retval>,
	rjmp .L84	 ; 
 ;  pcd8544.h:879: 			for (tmpIdxX = x1; tmpIdxX < x2; tmpIdxX++)
	subi r29,lo8(-(1))	 ;  tmpIdxX,
	cpse r15,r29	 ;  x2, tmpIdxX
	rjmp .L89	 ; 
 ;  pcd8544.h:876: 		for (tmpIdxY = y1; tmpIdxY < y2; tmpIdxY++)
	subi r28,lo8(-(1))	 ;  y1,
	cpse r14,r28	 ;  y2, y1
	rjmp .L87	 ; 
	rjmp .L88	 ; 
.L93:
 ;  pcd8544.h:872: 		return OUT_OF_BORDER;
	ldi r24,lo8(1)	 ;  <retval>,
	rjmp .L84	 ; 
	.size	_Z7LcdRectcccc12LcdPixelMode, .-_Z7LcdRectcccc12LcdPixelMode
.global	_Z8LcdImagePKc
	.type	_Z8LcdImagePKc, @function
_Z8LcdImagePKc:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
 ;  pcd8544.h:911: 	memcpy_P(LcdCache, imageData, LCD_CACHE_SIZE);	//Same as aboeve - 6 bytes less and faster instruction
	ldi r20,lo8(-8)	 ; ,
	ldi r21,lo8(1)	 ; ,
	movw r22,r24	 ; , imageData
	ldi r24,lo8(_ZL8LcdCache)	 ; ,
	ldi r25,hi8(_ZL8LcdCache)	 ; ,
	call memcpy_P	 ; 
 ;  pcd8544.h:913: 	LoWaterMark = 0;
	sts _ZL11LoWaterMark+1,__zero_reg__	 ;  LoWaterMark,
	sts _ZL11LoWaterMark,__zero_reg__	 ;  LoWaterMark,
 ;  pcd8544.h:914: 	HiWaterMark = LCD_CACHE_SIZE - 1;
	ldi r24,lo8(-9)	 ;  tmp43,
	ldi r25,lo8(1)	 ; ,
	sts _ZL11HiWaterMark+1,r25	 ;  HiWaterMark, tmp43
	sts _ZL11HiWaterMark,r24	 ;  HiWaterMark, tmp43
/* epilogue start */
 ;  pcd8544.h:918: }
	ret
	.size	_Z8LcdImagePKc, .-_Z8LcdImagePKc
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
.L98:
 ;  spi_hal.h:156: 				while ((readSPSR() & static_cast<typename MicroController::mem_width>(MicroController::SPI::spsr::SPIF0)) == 0);
	in __tmp_reg__,0x2d	 ; 
	sbrs __tmp_reg__,7	 ; 
	rjmp .L98	 ; 
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
 ;  pcd8544.h:968: 	LCD_PORT &= ~(_BV(LCD_CE_PIN));
	cbi 0x5,1	 ; ,
 ;  pcd8544.h:970: 	if (cd == LCD_DATA)
	cpi r22,lo8(1)	 ;  cd,
	brne .L101	 ; ,
 ;  pcd8544.h:972: 		LCD_PORT |= _BV(LCD_DC_PIN);
	sbi 0x5,0	 ; ,
.L102:
 ;  pcd8544.h:980: 	spi::readWriteSingle(data);
	call _ZN5BMCPP3Hal3SPIILh0ELNS0_3spi7ClkRateE0ELb1ENS_3AVR9ATMega328EE15readWriteSingleEh	 ; 
 ;  pcd8544.h:989: 	LCD_PORT |= _BV(LCD_CE_PIN);
	sbi 0x5,1	 ; ,
/* epilogue start */
 ;  pcd8544.h:990: }
	ret
.L101:
 ;  pcd8544.h:976: 		LCD_PORT &= ~(_BV(LCD_DC_PIN));
	cbi 0x5,0	 ; ,
	rjmp .L102	 ; 
	.size	_ZL7LcdSendc10LcdCmdData, .-_ZL7LcdSendc10LcdCmdData
.global	_Z7newLinev
	.type	_Z7newLinev, @function
_Z7newLinev:
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
 ;  pcd8544.h:387: 	for (int i = 0; i < (WIDTH - pixelsInLine); i++) {
	ldi r29,0	 ;  i
	ldi r28,0	 ;  i
	ldi r16,lo8(84)	 ;  tmp49,
	ldi r17,0	 ; 
.L105:
 ;  pcd8544.h:387: 	for (int i = 0; i < (WIDTH - pixelsInLine); i++) {
	lds r24,pixelsInLine	 ;  pixelsInLine, pixelsInLine
	movw r18,r16	 ; , tmp49
	sub r18,r24	 ; , pixelsInLine
	sbc r19,__zero_reg__	 ; 
	cp r28,r18	 ;  i, tmp48
	cpc r29,r19	 ;  i, tmp48
	brge .L104	 ; ,
 ;  pcd8544.h:388: 		LcdSend(0, LcdCmdData::LCD_DATA);
	ldi r22,lo8(1)	 ; ,
	ldi r24,0	 ; 
	call _ZL7LcdSendc10LcdCmdData	 ; 
 ;  pcd8544.h:387: 	for (int i = 0; i < (WIDTH - pixelsInLine); i++) {
	adiw r28,1	 ;  i,
	rjmp .L105	 ; 
.L104:
 ;  pcd8544.h:390: 	pixelsInLine = 0;
	sts pixelsInLine,__zero_reg__	 ;  pixelsInLine,
/* epilogue start */
 ;  pcd8544.h:391: }
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	ret
	.size	_Z7newLinev, .-_Z7newLinev
.global	_Z11LcdContrastc
	.type	_Z11LcdContrastc, @function
_Z11LcdContrastc:
	push r28	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	mov r28,r24	 ;  contrast, contrast
 ;  pcd8544.h:409: 	LcdSend(0x21, LCD_CMD);
	ldi r22,0	 ; 
	ldi r24,lo8(33)	 ; ,
	call _ZL7LcdSendc10LcdCmdData	 ; 
 ;  pcd8544.h:412: 	LcdSend(0x80 | contrast, LCD_CMD);
	ldi r22,0	 ; 
	mov r24,r28	 ; , contrast
	ori r24,lo8(-128)	 ; ,
	call _ZL7LcdSendc10LcdCmdData	 ; 
 ;  pcd8544.h:415: 	LcdSend(0x20, LCD_CMD);
	ldi r22,0	 ; 
	ldi r24,lo8(32)	 ; ,
/* epilogue start */
 ;  pcd8544.h:416: }
	pop r28	 ; 
 ;  pcd8544.h:415: 	LcdSend(0x20, LCD_CMD);
	jmp _ZL7LcdSendc10LcdCmdData	 ; 
	.size	_Z11LcdContrastc, .-_Z11LcdContrastc
.global	_Z9LcdUpdatev
	.type	_Z9LcdUpdatev, @function
_Z9LcdUpdatev:
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
 ;  pcd8544.h:930: 	if (LoWaterMark < 0)
	lds r24,_ZL11LoWaterMark	 ;  LoWaterMark.56_1, LoWaterMark
	lds r25,_ZL11LoWaterMark+1	 ;  LoWaterMark.56_1, LoWaterMark
	sbrs r25,7	 ;  LoWaterMark.56_1,
	rjmp .L108	 ; 
 ;  pcd8544.h:931: 		LoWaterMark = 0;
	sts _ZL11LoWaterMark+1,__zero_reg__	 ;  LoWaterMark,
	sts _ZL11LoWaterMark,__zero_reg__	 ;  LoWaterMark,
.L109:
 ;  pcd8544.h:935: 	if (HiWaterMark < 0)
	lds r24,_ZL11HiWaterMark	 ;  HiWaterMark.58_2, HiWaterMark
	lds r25,_ZL11HiWaterMark+1	 ;  HiWaterMark.58_2, HiWaterMark
	sbrs r25,7	 ;  HiWaterMark.58_2,
	rjmp .L110	 ; 
 ;  pcd8544.h:936: 		HiWaterMark = 0;
	sts _ZL11HiWaterMark+1,__zero_reg__	 ;  HiWaterMark,
	sts _ZL11HiWaterMark,__zero_reg__	 ;  HiWaterMark,
.L111:
 ;  pcd8544.h:941: 	LcdSend(0x80 | (LoWaterMark % LCD_X_RES), LCD_CMD);
	lds r28,_ZL11LoWaterMark	 ;  LoWaterMark.60_3, LoWaterMark
	lds r29,_ZL11LoWaterMark+1	 ;  LoWaterMark.60_3, LoWaterMark
	movw r24,r28	 ; , LoWaterMark.60_3
	ldi r22,lo8(84)	 ; ,
	ldi r23,0	 ; 
	call __divmodhi4
	mov r17,r22	 ;  tmp83,
	ldi r22,0	 ; 
	ori r24,lo8(-128)	 ; ,
	call _ZL7LcdSendc10LcdCmdData	 ; 
 ;  pcd8544.h:942: 	LcdSend(0x40 | (LoWaterMark / LCD_X_RES), LCD_CMD);
	ldi r22,0	 ; 
	mov r24,r17	 ; , tmp83
	ori r24,lo8(64)	 ; ,
	call _ZL7LcdSendc10LcdCmdData	 ; 
	subi r28,lo8(-(_ZL8LcdCache))	 ;  ivtmp.227,
	sbci r29,hi8(-(_ZL8LcdCache))	 ;  ivtmp.227,
.L113:
 ;  pcd8544.h:945: 	for (i = LoWaterMark; i <= HiWaterMark; i++)
	lds r18,_ZL11HiWaterMark	 ;  HiWaterMark, HiWaterMark
	lds r19,_ZL11HiWaterMark+1	 ;  HiWaterMark, HiWaterMark
	movw r24,r28	 ;  tmp74, ivtmp.227
	subi r24,lo8(_ZL8LcdCache)	 ;  tmp74,
	sbci r25,hi8(_ZL8LcdCache)	 ;  tmp74,
	cp r18,r24	 ;  HiWaterMark, tmp74
	cpc r19,r25	 ;  HiWaterMark, tmp74
	brlt .L112	 ; ,
 ;  pcd8544.h:947: 		LcdSend(LcdCache[i], LCD_DATA);
	ldi r22,lo8(1)	 ; ,
	ld r24,Y+	 ; , MEM[base: _37, offset: 0B]
	call _ZL7LcdSendc10LcdCmdData	 ; 
 ;  pcd8544.h:945: 	for (i = LoWaterMark; i <= HiWaterMark; i++)
	rjmp .L113	 ; 
.L108:
 ;  pcd8544.h:932: 	else if (LoWaterMark >= LCD_CACHE_SIZE)
	cpi r24,-8	 ;  LoWaterMark.56_1,
	sbci r25,1	 ;  LoWaterMark.56_1,
	brlt .L109	 ; ,
 ;  pcd8544.h:933: 		LoWaterMark = LCD_CACHE_SIZE - 1;
	ldi r24,lo8(-9)	 ;  tmp62,
	ldi r25,lo8(1)	 ; ,
	sts _ZL11LoWaterMark+1,r25	 ;  LoWaterMark, tmp62
	sts _ZL11LoWaterMark,r24	 ;  LoWaterMark, tmp62
	rjmp .L109	 ; 
.L110:
 ;  pcd8544.h:937: 	else if (HiWaterMark >= LCD_CACHE_SIZE)
	cpi r24,-8	 ;  HiWaterMark.58_2,
	sbci r25,1	 ;  HiWaterMark.58_2,
	brlt .L111	 ; ,
 ;  pcd8544.h:938: 		HiWaterMark = LCD_CACHE_SIZE - 1;
	ldi r24,lo8(-9)	 ;  tmp63,
	ldi r25,lo8(1)	 ; ,
	sts _ZL11HiWaterMark+1,r25	 ;  HiWaterMark, tmp63
	sts _ZL11HiWaterMark,r24	 ;  HiWaterMark, tmp63
	rjmp .L111	 ; 
.L112:
 ;  pcd8544.h:951: 	LoWaterMark = LCD_CACHE_SIZE - 1;
	ldi r24,lo8(-9)	 ;  tmp76,
	ldi r25,lo8(1)	 ; ,
	sts _ZL11LoWaterMark+1,r25	 ;  LoWaterMark, tmp76
	sts _ZL11LoWaterMark,r24	 ;  LoWaterMark, tmp76
 ;  pcd8544.h:952: 	HiWaterMark = 0;
	sts _ZL11HiWaterMark+1,__zero_reg__	 ;  HiWaterMark,
	sts _ZL11HiWaterMark,__zero_reg__	 ;  HiWaterMark,
/* epilogue start */
 ;  pcd8544.h:956: }
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
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
	ldi r22,0	 ; 
	ldi r24,lo8(33)	 ; ,
	call _ZL7LcdSendc10LcdCmdData	 ; 
 ;  pcd8544.h:344: 	LcdSend(0xC8, LCD_CMD); /* Set LCD Vop (Contrast).*/
	ldi r22,0	 ; 
	ldi r24,lo8(-56)	 ; ,
	call _ZL7LcdSendc10LcdCmdData	 ; 
 ;  pcd8544.h:345: 	LcdSend(0x06, LCD_CMD); /* Set Temp coefficent. */
	ldi r22,0	 ; 
	ldi r24,lo8(6)	 ; ,
	call _ZL7LcdSendc10LcdCmdData	 ; 
 ;  pcd8544.h:346: 	LcdSend(0x13, LCD_CMD); /* LCD bias mode 1:48. */
	ldi r22,0	 ; 
	ldi r24,lo8(19)	 ; ,
	call _ZL7LcdSendc10LcdCmdData	 ; 
 ;  pcd8544.h:347: 	LcdSend(0x20, LCD_CMD); /* LCD Standard Commands,Horizontal addressing mode */
	ldi r22,0	 ; 
	ldi r24,lo8(32)	 ; ,
	call _ZL7LcdSendc10LcdCmdData	 ; 
 ;  pcd8544.h:348: 	LcdSend(0x0C, LCD_CMD); /* LCD in normal mode. */
	ldi r22,0	 ; 
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
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	mov r28,r24	 ;  ch, ch
 ;  pcd8544.h:365: 	if (ch < 32) {
	cpi r24,lo8(32)	 ;  ch,
	brsh .L116	 ; ,
 ;  pcd8544.h:366: 		LcdClear();
	call _Z8LcdClearv	 ; 
 ;  pcd8544.h:367: 		printChar('4');
	ldi r24,lo8(52)	 ; ,
	call _Z9printCharc	 ; 
 ;  pcd8544.h:368: 		printChar('2');
	ldi r24,lo8(50)	 ; ,
	call _Z9printCharc	 ; 
.L116:
 ;  pcd8544.h:371: 	spi::readWriteSingle(1);
	ldi r24,lo8(1)	 ; ,
	call _ZN5BMCPP3Hal3SPIILh0ELNS0_3spi7ClkRateE0ELb1ENS_3AVR9ATMega328EE15readWriteSingleEh	 ; 
 ;  pcd8544.h:377: 		auto c = pgm_read_byte(&(FontLookup[ch - 32][i])) << 1;
	subi r28,32	 ;  tmp63,
	sbc r29,r29	 ;  tmp63
	ldi r18,lo8(5)	 ;  tmp64,
	mul r18,r28	 ;  tmp64, tmp63
	movw r16,r0	 ;  _30
	mul r18,r29	 ;  tmp64, tmp63
	add r17,r0	 ;  _30
	clr __zero_reg__
	ldi r29,0	 ;  ivtmp.232
	ldi r28,0	 ;  ivtmp.232
	subi r16,lo8(-(_ZL10FontLookup))	 ;  tmp66,
	sbci r17,hi8(-(_ZL10FontLookup))	 ;  tmp66,
.L119:
	movw r30,r16	 ;  tmp67, tmp66
	add r30,r28	 ;  tmp67, ivtmp.232
	adc r31,r29	 ; , ivtmp.232
/* #APP */
 ;  377 "pcd8544.h" 1
	lpm r24, Z	 ;  __result
	
 ;  0 "" 2
 ;  pcd8544.h:381: 		LcdSend(c, LcdCmdData::LCD_DATA);
/* #NOAPP */
	ldi r22,lo8(1)	 ; ,
	lsl r24	 ; 
	call _ZL7LcdSendc10LcdCmdData	 ; 
 ;  pcd8544.h:382: 		pixelsInLine < WIDTH ? pixelsInLine++ : pixelsInLine = 0;
	lds r24,pixelsInLine	 ;  pixelsInLine.3_7, pixelsInLine
	cpi r24,lo8(84)	 ;  pixelsInLine.3_7,
	brsh .L117	 ; ,
 ;  pcd8544.h:382: 		pixelsInLine < WIDTH ? pixelsInLine++ : pixelsInLine = 0;
	subi r24,lo8(-(1))	 ;  tmp70,
	sts pixelsInLine,r24	 ;  pixelsInLine, tmp70
.L118:
	adiw r28,1	 ;  ivtmp.232,
 ;  pcd8544.h:373: 	for (uint8_t i = 0; i < 5; i++)
	cpi r28,5	 ;  ivtmp.232,
	cpc r29,__zero_reg__	 ;  ivtmp.232
	brne .L119	 ; ,
/* epilogue start */
 ;  pcd8544.h:384: }
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	ret
.L117:
 ;  pcd8544.h:382: 		pixelsInLine < WIDTH ? pixelsInLine++ : pixelsInLine = 0;
	sts pixelsInLine,__zero_reg__	 ;  pixelsInLine,
	rjmp .L118	 ; 
	.size	_Z9printCharc, .-_Z9printCharc
.global	_Z8printStrPKc
	.type	_Z8printStrPKc, @function
_Z8printStrPKc:
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24	 ;  ivtmp.247, str
.L123:
 ;  pcd8544.h:394: 	while (*str) {
	ld r24,Y+	 ;  _1, MEM[base: _11, offset: 0B]
	tst r24	 ;  _1
	breq .L121	 ; ,
 ;  pcd8544.h:395: 		printChar(*str);
	call _Z9printCharc	 ; 
 ;  pcd8544.h:394: 	while (*str) {
	rjmp .L123	 ; 
.L121:
/* epilogue start */
 ;  pcd8544.h:398: }
	pop r29	 ; 
	pop r28	 ; 
	ret
	.size	_Z8printStrPKc, .-_Z8printStrPKc
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"scheiss Lyroit"
.LC1:
	.string	"Neises Nokia"
.LC2:
	.string	"101010"
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
 ;  main.cc:23: 	LcdInit();
	call _Z7LcdInitv	 ; 
 ;  main.cc:46: 	LcdClear();
	call _Z8LcdClearv	 ; 
 ;  main.cc:49: 	printStr("scheiss Lyroit");
	ldi r24,lo8(.LC0)	 ; ,
	ldi r25,hi8(.LC0)	 ; ,
	call _Z8printStrPKc	 ; 
 ;  main.cc:50: 	newLine();
	call _Z7newLinev	 ; 
 ;  main.cc:51: 	printStr("Neises Nokia");
	ldi r24,lo8(.LC1)	 ; ,
	ldi r25,hi8(.LC1)	 ; ,
	call _Z8printStrPKc	 ; 
 ;  main.cc:52: 	newLine();
	call _Z7newLinev	 ; 
 ;  main.cc:53: 	newLine();
	call _Z7newLinev	 ; 
 ;  main.cc:54: 	printStr("101010");
	ldi r24,lo8(.LC2)	 ; ,
	ldi r25,hi8(.LC2)	 ; ,
	call _Z8printStrPKc	 ; 
.L125:
	rjmp .L125	 ; 
	.size	main, .-main
.global	pixelsInLine
	.section .bss
	.type	pixelsInLine, @object
	.size	pixelsInLine, 1
pixelsInLine:
	.zero	1
	.local	_ZL11HiWaterMark
	.comm	_ZL11HiWaterMark,2,1
	.local	_ZL11LoWaterMark
	.comm	_ZL11LoWaterMark,2,1
	.local	_ZL11LcdCacheIdx
	.comm	_ZL11LcdCacheIdx,2,1
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
	.ident	"GCC: (GNU) 7.3.0"
.global __do_copy_data
.global __do_clear_bss
