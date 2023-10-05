CROSS_COMPILE ?= arm-linux-gnueabihf-
TARGET ?= beeper_lab

CC := $(CROSS_COMPILE)gcc
LD := $(CROSS_COMPILE)ld
OBJDUMP := $(CROSS_COMPILE)objdump
OBJCOPY := $(CROSS_COMPILE)objcopy

INCUDIRS := imx6ull \
			  bsp/clk \
			  bsp/delay \
			  bsp/led \
			  bsp/beeper \

SRCDIRS := project \
		   bsp/clk \
		   bsp/delay \
		   bsp/led \
		   bsp/beeper \

OUTPUTDIR := build

INCLUDE := $(patsubst %, -I %, $(INCUDIRS))

SFILES := $(foreach dir, $(SRCDIRS), $(wildcard $(dir)/*.s))
CFILES := $(foreach dir, $(SRCDIRS), $(wildcard $(dir)/*.c))

SFILESNDIR := $(notdir $(SFILES))
CFILESNDIR := $(notdir $(CFILES))

SOBJS := $(patsubst %, build/%, $(SFILESNDIR:.s=.o))
COBJS := $(patsubst %, build/%, $(CFILESNDIR:.c=.o))

OBJS := $(SOBJS)$(COBJS)

VPATH := $(SRCDIRS)

$(TARGET).bin : $(SOBJS)$(COBJS)
	$(LD) -Tledsdk.ld -o $(OUTPUTDIR)/$(TARGET).elf $^
	$(OBJCOPY) -O binary -S $(OUTPUTDIR)/$(TARGET).elf $@

$(SOBJS) : $(OUTPUTDIR)/%.o : %.s
	$(CC) -nostdlib -Wall -c -g $(INCLUDE) $< -o $@
	
$(COBJS) : $(OUTPUTDIR)/%.o : %.c
	$(CC) -nostdlib -Wall -c -g $(INCLUDE) $< -o $@

.PHONY : print
print : 
	@echo $(INCLUDE)
	@echo $(SFILES)
	@echo $(CFILES)

.PHONY : clean
clean : 
	rm ./build/* ./*.bin
