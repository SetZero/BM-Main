# comment
TARGET = main
#env
CXX = avr-g++
#env
CC = avr-gcc
#env
LD = avr-ld
#env
CPPFLAGS += -DF_CPU=16000000
CPPFLAGS += -I./include
CXXFLAGS += -mmcu=atmega328p -Wall -Wextra -Wconversion -std=c++17 -Os -fconcepts 
CFLAGS += -mmcu=atmega328p -Wall -Wextra -Wconversion -std=c11 -Os  
CXXFLAGS += -fno-exceptions -fno-unwind-tables -fno-rtti -fno-threadsafe-statics #-Wgnu-string-literal-operator-template
CXXFLAGS += -funsigned-char -funsigned-bitfields -fshort-enums 

ASMFLAGS += -fverbose-asm
ASMFLAGS +=  -Wa,-adhln

LDFLAGS = $(MCUFLAGS) -Wl,-Map=main.map,--cref 
LDFLAGS += "-Wl,--section-start=.mmcu=0x910000"

CCSRC = $(wildcard *.cc)
CCOBJ = $(patsubst %.cc, %.o, $(CCSRC))
CCDEP = $(patsubst %.cc, %.d, $(CCSRC))
CCASM = $(patsubst %.cc, %.s, $(CCSRC))

DEP += $(CCDEP)

all: $(CCDEP) main.hex main.s

main.elf: main.o
	$(LINK.c) -o $@ $?

%.s: %.cc
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) $(ASMFLAGS) -S -o $@ $<

%.d: %.cc
	$(CXX) -MM -MG $(CPPFLAGS) $(CXXFLAGS) $< | sed "s/$*\.o/& $@/g" > $@

clean:
	$(RM) *.elf
	$(RM) *.o
	$(RM) *.s
	$(RM) *.d
	$(RM) *.hex
	$(RM) *.map
	
rebuild: clean all

# Program the device.  
program: $(TARGET).hex
	$(AVRDUDE) $(AVRDUDE_FLAGS) $(AVRDUDE_WRITE_FLASH)
	
-include $(DEP)

# Define programs and commands.
SHELL = sh
CC = avr-gcc
OBJCOPY = avr-objcopy
OBJDUMP = avr-objdump
SIZE = avr-size
NM = avr-nm
AVRDUDE = avrdude
REMOVE = rm -f
COPY = cp
FORMAT = ihex
MSG_FLASH = Creating load file for Flash:

# Create final output files (.hex, .eep) from ELF output file.
%.hex: %.elf
	@echo
	@echo $(MSG_FLASH) $@
	$(OBJCOPY) -O $(FORMAT) -R .flash $< $@


# Programming support using avrdude. Settings and variables.

# Programming hardware: alf avr910 avrisp bascom bsd 
# dt006 pavr picoweb pony-stk200 sp12 stk200 stk500
#
# Type: avrdude -c ?
# to get a full listing.
#

AVRDUDE_PROGRAMMER = arduino

AVRDUDE_PORT = COM3    # programmer connected to serial device

AVRDUDE_WRITE_FLASH = -U flash:w:$(TARGET).hex
#AVRDUDE_WRITE_EEPROM = -U eeprom:w:$(TARGET).eep

MCU = m328p

# Uncomment the following if you want avrdude's erase cycle counter.
# Note that this counter needs to be initialized first using -Yn,
# see avrdude manual.
#AVRDUDE_ERASE_COUNTER = -y

# Uncomment the following if you do /not/ wish a verification to be
# performed after programming the device.
#AVRDUDE_NO_VERIFY = -V

# Increase verbosity level.  Please use this when submitting bug
# reports about avrdude. See <http://savannah.nongnu.org/projects/avrdude> 
# to submit bug reports.
#AVRDUDE_VERBOSE = -v -v

AVRDUDE_FLAGS = -p $(MCU) -P $(AVRDUDE_PORT) -c $(AVRDUDE_PROGRAMMER) #-b $(BAUDRATE)
AVRDUDE_FLAGS += $(AVRDUDE_NO_VERIFY)
AVRDUDE_FLAGS += $(AVRDUDE_VERBOSE)
AVRDUDE_FLAGS += $(AVRDUDE_ERASE_COUNTER)