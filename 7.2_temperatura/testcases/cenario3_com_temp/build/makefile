
#this environment variable must point to the hemps path, where the hardware, software and tools folders are located

#Definition of Plasma toolchain
CFLAGS     = -Os -Wall -fms-extensions -c -s -std=c99 -G 0
CFLAGS_APP = -Os -Wall -fms-extensions -c -s -std=c99 -G 0
GCC_MIPS   = mips-elf-gcc $(CFLAGS)
GCC_MIPS_APP   = mips-elf-gcc $(CFLAGS_APP)
AS_MIPS    = mips-elf-as
LD_MIPS    = mips-elf-ld
DUMP_MIPS  = mips-elf-objdump
COPY_MIPS = mips-elf-objcopy -I elf32-bigmips -O binary
					
#Definition of MB-Lite toolchain
MB         = mb-gcc
AS         = mb-as
LD         = mb-ld
MB_OBJCOPY = mb-objcopy
MB_OBJDUMP = mb-objdump
XILFLAGS   =-mxl-soft-div -msoft-float -mxl-barrel-shift -mno-xl-soft-mul
CXXFLAGS   =-g -std=c99 -pedantic -Wall -O2
LNKFLAGS   =-Wl,-defsym -Wl,_STACK_SIZE=0x3000 -Wl,-defsym -Wl,_HEAP_SIZE=0x0000
LNKFLAGS2  =-Wl,-defsym -Wl,_STACK_SIZE=0x2000 -Wl,-defsym -Wl,_HEAP_SIZE=0x0000
MB_GCC     = $(MB) $(XILFLAGS) $(CXXFLAGS) $(LNKFLAGS2) $(LIBFLAGS) $(INCFLAGS) $(CCFLAGS)

#TOOLS
BIN2MEM       = bin2mem
RAM_GENERATOR = ram_generator

INCLUDE       = $(HEMPS_PATH)/software/include

#TASKS
TASK0_PATH = ../applications/mpeg/idct.c
TASK0_INCLUDE = ids_mpeg.h
TASK0_NAME = idct
TASK0_ID = 0
TASK0_TARGET = $(TASK0_NAME)_$(TASK0_ID)

TASK1_PATH = ../applications/mpeg/iquant.c
TASK1_INCLUDE = ids_mpeg.h
TASK1_NAME = iquant
TASK1_ID = 1
TASK1_TARGET = $(TASK1_NAME)_$(TASK1_ID)

TASK2_PATH = ../applications/mpeg/ivlc.c
TASK2_INCLUDE = ids_mpeg.h
TASK2_NAME = ivlc
TASK2_ID = 2
TASK2_TARGET = $(TASK2_NAME)_$(TASK2_ID)

TASK3_PATH = ../applications/mpeg/print.c
TASK3_INCLUDE = ids_mpeg.h
TASK3_NAME = print
TASK3_ID = 3
TASK3_TARGET = $(TASK3_NAME)_$(TASK3_ID)

TASK4_PATH = ../applications/mpeg/start.c
TASK4_INCLUDE = ids_mpeg.h
TASK4_NAME = start
TASK4_ID = 4
TASK4_TARGET = $(TASK4_NAME)_$(TASK4_ID)

#tasks boot code for Plasma processor
BOOT_TASK_SRC     = $(HEMPS_PATH)/software/include/bootTask.asm
BOOT_TASK         = bootTask

#kernel master source files
BOOT_MASTER_SRC   = $(HEMPS_PATH)/software/kernel/master/boot.S
BOOT_MASTER       = boot_master
KERNEL_MASTER_SRC = $(HEMPS_PATH)/software/kernel/master/kernel_master.c
KERNEL_MASTER     = kernel_master

#kernel slave plasma source files
BOOT_PLASMA_SRC   = $(HEMPS_PATH)/software/kernel/slave/boot.S
BOOT_PLASMA       = boot_plasma
KERNEL_PLASMA_SRC = $(HEMPS_PATH)/software/kernel/slave/kernel_slave.c
KERNEL_PLASMA     = kernel_plasma

bootTask:
	$(AS_MIPS) --defsym sp_addr=16383 -o $(BOOT_TASK).o $(BOOT_TASK_SRC)

kernel_master:
	$(AS_MIPS) --defsym sp_addr=524287 -o $(BOOT_MASTER).o $(BOOT_MASTER_SRC)
	$(GCC_MIPS) -DHOP_NUMBER=3 -DWithoutLoad -o $(KERNEL_MASTER).o $(KERNEL_MASTER_SRC) --include ids_master.h
	$(LD_MIPS) -Ttext 0 -eentry -Map $(KERNEL_MASTER).map -s -N -o $(KERNEL_MASTER).bin $(BOOT_MASTER).o $(KERNEL_MASTER).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(KERNEL_MASTER)_debug.map -o $(KERNEL_MASTER)_debug.bin  $(BOOT_MASTER).o $(KERNEL_MASTER).o
	$(DUMP_MIPS) -S $(KERNEL_MASTER)_debug.bin > $(KERNEL_MASTER).lst
	$(COPY_MIPS) $(KERNEL_MASTER).bin $(KERNEL_MASTER).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(KERNEL_MASTER).dump > $(KERNEL_MASTER).txt

kernel_plasma:
	$(AS_MIPS) --defsym sp_addr=262143 -o $(BOOT_PLASMA).o $(BOOT_PLASMA_SRC)
	$(GCC_MIPS) -o $(KERNEL_PLASMA).o $(KERNEL_PLASMA_SRC) --include ids_slave.h -D PLASMA
	$(LD_MIPS) -Ttext 0 -eentry -Map $(KERNEL_PLASMA).map -s -N -o $(KERNEL_PLASMA).bin  $(BOOT_PLASMA).o $(KERNEL_PLASMA).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(KERNEL_PLASMA)_debug.map -o $(KERNEL_PLASMA)_debug.bin  $(BOOT_PLASMA).o $(KERNEL_PLASMA).o
	$(DUMP_MIPS) -S $(KERNEL_PLASMA)_debug.bin > $(KERNEL_PLASMA).lst
	$(COPY_MIPS) $(KERNEL_PLASMA).bin $(KERNEL_PLASMA).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(KERNEL_PLASMA).dump > $(KERNEL_PLASMA).txt

idct_0:
	$(GCC_MIPS_APP) $(TASK0_PATH) -o $(TASK0_TARGET).o --include $(TASK0_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK0_TARGET).map -s -N -o $(TASK0_TARGET).bin $(BOOT_TASK).o $(TASK0_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK0_TARGET)_debug.map -o $(TASK0_TARGET)_debug.bin $(BOOT_TASK).o $(TASK0_TARGET).o
	$(DUMP_MIPS) -S $(TASK0_TARGET)_debug.bin > $(TASK0_TARGET).lst
	$(COPY_MIPS) $(TASK0_TARGET).bin $(TASK0_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK0_TARGET).dump > $(TASK0_TARGET).txt
iquant_1:
	$(GCC_MIPS_APP) $(TASK1_PATH) -o $(TASK1_TARGET).o --include $(TASK1_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK1_TARGET).map -s -N -o $(TASK1_TARGET).bin $(BOOT_TASK).o $(TASK1_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK1_TARGET)_debug.map -o $(TASK1_TARGET)_debug.bin $(BOOT_TASK).o $(TASK1_TARGET).o
	$(DUMP_MIPS) -S $(TASK1_TARGET)_debug.bin > $(TASK1_TARGET).lst
	$(COPY_MIPS) $(TASK1_TARGET).bin $(TASK1_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK1_TARGET).dump > $(TASK1_TARGET).txt
ivlc_2:
	$(GCC_MIPS_APP) $(TASK2_PATH) -o $(TASK2_TARGET).o --include $(TASK2_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK2_TARGET).map -s -N -o $(TASK2_TARGET).bin $(BOOT_TASK).o $(TASK2_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK2_TARGET)_debug.map -o $(TASK2_TARGET)_debug.bin $(BOOT_TASK).o $(TASK2_TARGET).o
	$(DUMP_MIPS) -S $(TASK2_TARGET)_debug.bin > $(TASK2_TARGET).lst
	$(COPY_MIPS) $(TASK2_TARGET).bin $(TASK2_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK2_TARGET).dump > $(TASK2_TARGET).txt
print_3:
	$(GCC_MIPS_APP) $(TASK3_PATH) -o $(TASK3_TARGET).o --include $(TASK3_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK3_TARGET).map -s -N -o $(TASK3_TARGET).bin $(BOOT_TASK).o $(TASK3_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK3_TARGET)_debug.map -o $(TASK3_TARGET)_debug.bin $(BOOT_TASK).o $(TASK3_TARGET).o
	$(DUMP_MIPS) -S $(TASK3_TARGET)_debug.bin > $(TASK3_TARGET).lst
	$(COPY_MIPS) $(TASK3_TARGET).bin $(TASK3_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK3_TARGET).dump > $(TASK3_TARGET).txt
start_4:
	$(GCC_MIPS_APP) $(TASK4_PATH) -o $(TASK4_TARGET).o --include $(TASK4_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK4_TARGET).map -s -N -o $(TASK4_TARGET).bin $(BOOT_TASK).o $(TASK4_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK4_TARGET)_debug.map -o $(TASK4_TARGET)_debug.bin $(BOOT_TASK).o $(TASK4_TARGET).o
	$(DUMP_MIPS) -S $(TASK4_TARGET)_debug.bin > $(TASK4_TARGET).lst
	$(COPY_MIPS) $(TASK4_TARGET).bin $(TASK4_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK4_TARGET).dump > $(TASK4_TARGET).txt

ram_gen: ram_master ram_plasma

ram_master:
	$(RAM_GENERATOR) 512 -rtl kernel_master.txt > ram_master.vhd
	cp ram_master.vhd ../plasma_ram/rtl
	$(RAM_GENERATOR) 512 -h kernel_master.txt > ram_master.h
	cp -rf $(HEMPS_PATH)/hardware/sc_ram/ram_master.cpp ../plasma_ram/sc
	cp ram_master.h ../plasma_ram/sc

ram_plasma:
	$(RAM_GENERATOR) 512 -rtl kernel_plasma.txt > ram_plasma.vhd
	cp ram_plasma.vhd ../plasma_ram/rtl
	$(RAM_GENERATOR) 512 -h kernel_plasma.txt > ram_plasma.h
	cp -rf $(HEMPS_PATH)/hardware/sc_ram/ram_plasma.cpp ../plasma_ram/sc
	cp ram_plasma.h ../plasma_ram/sc

clean:
	rm -rf *.bin
	rm -rf *.txt
	rm -rf *.mem
	rm -rf *.dump
	rm -rf *.lst
	rm -rf *.o
	rm -rf *.map
	rm -rf ram*.h
	rm -rf *.vhd
	rm -rf *.elf

all: bootTask kernel_master kernel_plasma idct_0 iquant_1 ivlc_2 print_3 start_4 ram_gen