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
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
 ;  SPI.h:90: 			*portAddress |= MISO;
	in r24,0x5	 ;  MEM[(uintptr_t *)37B], MEM[(uintptr_t *)37B]
	in r25,0x5+1	 ;  MEM[(uintptr_t *)37B], MEM[(uintptr_t *)37B]
	ori r24,64	 ;  tmp55,
	out 0x5+1,r25	 ;  MEM[(uintptr_t *)37B], tmp55
	out 0x5,r24	 ;  MEM[(uintptr_t *)37B], tmp55
 ;  SPI.h:91: 			*ddrAddress |= (MOSI | SCK) 	  // set outputs
	in r24,0x6	 ;  MEM[(uintptr_t *)38B], MEM[(uintptr_t *)38B]
	in r25,0x6+1	 ;  MEM[(uintptr_t *)38B], MEM[(uintptr_t *)38B]
	ori r24,160	 ;  tmp59,
	out 0x6+1,r25	 ;  MEM[(uintptr_t *)38B], tmp59
	out 0x6,r24	 ;  MEM[(uintptr_t *)38B], tmp59
 ;  SPI.h:94: 			volatile uintptr_t* spcr_adr = (uintptr_t*)BMCPP::Hal::SPI<0>::spcr();
	in r30,0x2c	 ;  _12, MEM[(volatile uintptr_t &)76B]
	in r31,0x2c+1	 ;  _12, MEM[(volatile uintptr_t &)76B]
 ;  SPI.h:95: 			*spcr_adr = spcr;
	ldi r24,lo8(117)	 ;  tmp62,
	ldi r25,0	 ; 
	std Z+1,r25	 ;  *spcr_adr_13, tmp62
	st Z,r24	 ;  *spcr_adr_13, tmp62
 ;  SPI.h:96: 			volatile uintptr_t* spsr_adr = (uintptr_t*)BMCPP::Hal::SPI<0>::spsr();
	in r30,0x2e	 ;  _14, MEM[(volatile uintptr_t &)76B + 2]
	in r31,0x2e+1	 ;  _14, MEM[(volatile uintptr_t &)76B + 2]
 ;  SPI.h:98: 			*spsr_adr = clockspeed;
	ldi r24,lo8(1)	 ;  tmp64,
	ldi r25,0	 ; 
	std Z+1,r25	 ;  *spsr_adr_15, tmp64
	st Z,r24	 ;  *spsr_adr_15, tmp64
 ;  main.cc:37: 	DDRB |= (1 << PB5);
	sbi 0x4,5	 ; ,
.L2:
 ;  f:\users\keven\downloads\avr-gcc-7.3.0-x64-mingw\avr\include\util\delay.h:187: 	__builtin_avr_delay_cycles(__ticks_dc);
	ldi r18,lo8(1599999)	 ; ,
	ldi r24,hi8(1599999)	 ; ,
	ldi r25,hlo8(1599999)	 ; ,
1:	subi r18,1	 ; 
	sbci r24,0	 ; 
	sbci r25,0	 ; 
	brne 1b
	rjmp .
	nop
	rjmp .L2	 ; 
	.size	main, .-main
	.ident	"GCC: (GNU) 7.3.0"
