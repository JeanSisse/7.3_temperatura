
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

TASK256_PATH = ../applications/MPEG4/ADSP_0.c
TASK256_INCLUDE = ids_MPEG4.h
TASK256_NAME = ADSP_0
TASK256_ID = 256
TASK256_TARGET = $(TASK256_NAME)_$(TASK256_ID)

TASK257_PATH = ../applications/MPEG4/AU_0.c
TASK257_INCLUDE = ids_MPEG4.h
TASK257_NAME = AU_0
TASK257_ID = 257
TASK257_TARGET = $(TASK257_NAME)_$(TASK257_ID)

TASK258_PATH = ../applications/MPEG4/BAB_0.c
TASK258_INCLUDE = ids_MPEG4.h
TASK258_NAME = BAB_0
TASK258_ID = 258
TASK258_TARGET = $(TASK258_NAME)_$(TASK258_ID)

TASK259_PATH = ../applications/MPEG4/IDCT_0.c
TASK259_INCLUDE = ids_MPEG4.h
TASK259_NAME = IDCT_0
TASK259_ID = 259
TASK259_TARGET = $(TASK259_NAME)_$(TASK259_ID)

TASK260_PATH = ../applications/MPEG4/MCPU_0.c
TASK260_INCLUDE = ids_MPEG4.h
TASK260_NAME = MCPU_0
TASK260_ID = 260
TASK260_TARGET = $(TASK260_NAME)_$(TASK260_ID)

TASK261_PATH = ../applications/MPEG4/RAST_0.c
TASK261_INCLUDE = ids_MPEG4.h
TASK261_NAME = RAST_0
TASK261_ID = 261
TASK261_TARGET = $(TASK261_NAME)_$(TASK261_ID)

TASK262_PATH = ../applications/MPEG4/RISC_0.c
TASK262_INCLUDE = ids_MPEG4.h
TASK262_NAME = RISC_0
TASK262_ID = 262
TASK262_TARGET = $(TASK262_NAME)_$(TASK262_ID)

TASK263_PATH = ../applications/MPEG4/SDRAM_0.c
TASK263_INCLUDE = ids_MPEG4.h
TASK263_NAME = SDRAM_0
TASK263_ID = 263
TASK263_TARGET = $(TASK263_NAME)_$(TASK263_ID)

TASK264_PATH = ../applications/MPEG4/SRAM1_0.c
TASK264_INCLUDE = ids_MPEG4.h
TASK264_NAME = SRAM1_0
TASK264_ID = 264
TASK264_TARGET = $(TASK264_NAME)_$(TASK264_ID)

TASK265_PATH = ../applications/MPEG4/SRAM2_0.c
TASK265_INCLUDE = ids_MPEG4.h
TASK265_NAME = SRAM2_0
TASK265_ID = 265
TASK265_TARGET = $(TASK265_NAME)_$(TASK265_ID)

TASK266_PATH = ../applications/MPEG4/UPSAMP_0.c
TASK266_INCLUDE = ids_MPEG4.h
TASK266_NAME = UPSAMP_0
TASK266_ID = 266
TASK266_TARGET = $(TASK266_NAME)_$(TASK266_ID)

TASK267_PATH = ../applications/MPEG4/VU_0.c
TASK267_INCLUDE = ids_MPEG4.h
TASK267_NAME = VU_0
TASK267_ID = 267
TASK267_TARGET = $(TASK267_NAME)_$(TASK267_ID)

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
	$(AS_MIPS) --defsym sp_addr=262143 -o $(BOOT_MASTER).o $(BOOT_MASTER_SRC)
	$(GCC_MIPS) -DHOP_NUMBER=3 -DWithLoad -o $(KERNEL_MASTER).o $(KERNEL_MASTER_SRC) --include ids_master.h
	$(LD_MIPS) -Ttext 0 -eentry -Map $(KERNEL_MASTER).map -s -N -o $(KERNEL_MASTER).bin $(BOOT_MASTER).o $(KERNEL_MASTER).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(KERNEL_MASTER)_debug.map -o $(KERNEL_MASTER)_debug.bin  $(BOOT_MASTER).o $(KERNEL_MASTER).o
	$(DUMP_MIPS) -S $(KERNEL_MASTER)_debug.bin > $(KERNEL_MASTER).lst
	$(COPY_MIPS) $(KERNEL_MASTER).bin $(KERNEL_MASTER).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(KERNEL_MASTER).dump > $(KERNEL_MASTER).txt

kernel_plasma:
	$(AS_MIPS) --defsym sp_addr=131071 -o $(BOOT_PLASMA).o $(BOOT_PLASMA_SRC)
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
ADSP_0_256:
	$(GCC_MIPS_APP) $(TASK256_PATH) -o $(TASK256_TARGET).o --include $(TASK256_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK256_TARGET).map -s -N -o $(TASK256_TARGET).bin $(BOOT_TASK).o $(TASK256_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK256_TARGET)_debug.map -o $(TASK256_TARGET)_debug.bin $(BOOT_TASK).o $(TASK256_TARGET).o
	$(DUMP_MIPS) -S $(TASK256_TARGET)_debug.bin > $(TASK256_TARGET).lst
	$(COPY_MIPS) $(TASK256_TARGET).bin $(TASK256_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK256_TARGET).dump > $(TASK256_TARGET).txt
AU_0_257:
	$(GCC_MIPS_APP) $(TASK257_PATH) -o $(TASK257_TARGET).o --include $(TASK257_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK257_TARGET).map -s -N -o $(TASK257_TARGET).bin $(BOOT_TASK).o $(TASK257_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK257_TARGET)_debug.map -o $(TASK257_TARGET)_debug.bin $(BOOT_TASK).o $(TASK257_TARGET).o
	$(DUMP_MIPS) -S $(TASK257_TARGET)_debug.bin > $(TASK257_TARGET).lst
	$(COPY_MIPS) $(TASK257_TARGET).bin $(TASK257_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK257_TARGET).dump > $(TASK257_TARGET).txt
BAB_0_258:
	$(GCC_MIPS_APP) $(TASK258_PATH) -o $(TASK258_TARGET).o --include $(TASK258_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK258_TARGET).map -s -N -o $(TASK258_TARGET).bin $(BOOT_TASK).o $(TASK258_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK258_TARGET)_debug.map -o $(TASK258_TARGET)_debug.bin $(BOOT_TASK).o $(TASK258_TARGET).o
	$(DUMP_MIPS) -S $(TASK258_TARGET)_debug.bin > $(TASK258_TARGET).lst
	$(COPY_MIPS) $(TASK258_TARGET).bin $(TASK258_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK258_TARGET).dump > $(TASK258_TARGET).txt
IDCT_0_259:
	$(GCC_MIPS_APP) $(TASK259_PATH) -o $(TASK259_TARGET).o --include $(TASK259_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK259_TARGET).map -s -N -o $(TASK259_TARGET).bin $(BOOT_TASK).o $(TASK259_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK259_TARGET)_debug.map -o $(TASK259_TARGET)_debug.bin $(BOOT_TASK).o $(TASK259_TARGET).o
	$(DUMP_MIPS) -S $(TASK259_TARGET)_debug.bin > $(TASK259_TARGET).lst
	$(COPY_MIPS) $(TASK259_TARGET).bin $(TASK259_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK259_TARGET).dump > $(TASK259_TARGET).txt
MCPU_0_260:
	$(GCC_MIPS_APP) $(TASK260_PATH) -o $(TASK260_TARGET).o --include $(TASK260_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK260_TARGET).map -s -N -o $(TASK260_TARGET).bin $(BOOT_TASK).o $(TASK260_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK260_TARGET)_debug.map -o $(TASK260_TARGET)_debug.bin $(BOOT_TASK).o $(TASK260_TARGET).o
	$(DUMP_MIPS) -S $(TASK260_TARGET)_debug.bin > $(TASK260_TARGET).lst
	$(COPY_MIPS) $(TASK260_TARGET).bin $(TASK260_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK260_TARGET).dump > $(TASK260_TARGET).txt
RAST_0_261:
	$(GCC_MIPS_APP) $(TASK261_PATH) -o $(TASK261_TARGET).o --include $(TASK261_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK261_TARGET).map -s -N -o $(TASK261_TARGET).bin $(BOOT_TASK).o $(TASK261_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK261_TARGET)_debug.map -o $(TASK261_TARGET)_debug.bin $(BOOT_TASK).o $(TASK261_TARGET).o
	$(DUMP_MIPS) -S $(TASK261_TARGET)_debug.bin > $(TASK261_TARGET).lst
	$(COPY_MIPS) $(TASK261_TARGET).bin $(TASK261_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK261_TARGET).dump > $(TASK261_TARGET).txt
RISC_0_262:
	$(GCC_MIPS_APP) $(TASK262_PATH) -o $(TASK262_TARGET).o --include $(TASK262_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK262_TARGET).map -s -N -o $(TASK262_TARGET).bin $(BOOT_TASK).o $(TASK262_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK262_TARGET)_debug.map -o $(TASK262_TARGET)_debug.bin $(BOOT_TASK).o $(TASK262_TARGET).o
	$(DUMP_MIPS) -S $(TASK262_TARGET)_debug.bin > $(TASK262_TARGET).lst
	$(COPY_MIPS) $(TASK262_TARGET).bin $(TASK262_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK262_TARGET).dump > $(TASK262_TARGET).txt
SDRAM_0_263:
	$(GCC_MIPS_APP) $(TASK263_PATH) -o $(TASK263_TARGET).o --include $(TASK263_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK263_TARGET).map -s -N -o $(TASK263_TARGET).bin $(BOOT_TASK).o $(TASK263_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK263_TARGET)_debug.map -o $(TASK263_TARGET)_debug.bin $(BOOT_TASK).o $(TASK263_TARGET).o
	$(DUMP_MIPS) -S $(TASK263_TARGET)_debug.bin > $(TASK263_TARGET).lst
	$(COPY_MIPS) $(TASK263_TARGET).bin $(TASK263_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK263_TARGET).dump > $(TASK263_TARGET).txt
SRAM1_0_264:
	$(GCC_MIPS_APP) $(TASK264_PATH) -o $(TASK264_TARGET).o --include $(TASK264_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK264_TARGET).map -s -N -o $(TASK264_TARGET).bin $(BOOT_TASK).o $(TASK264_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK264_TARGET)_debug.map -o $(TASK264_TARGET)_debug.bin $(BOOT_TASK).o $(TASK264_TARGET).o
	$(DUMP_MIPS) -S $(TASK264_TARGET)_debug.bin > $(TASK264_TARGET).lst
	$(COPY_MIPS) $(TASK264_TARGET).bin $(TASK264_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK264_TARGET).dump > $(TASK264_TARGET).txt
SRAM2_0_265:
	$(GCC_MIPS_APP) $(TASK265_PATH) -o $(TASK265_TARGET).o --include $(TASK265_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK265_TARGET).map -s -N -o $(TASK265_TARGET).bin $(BOOT_TASK).o $(TASK265_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK265_TARGET)_debug.map -o $(TASK265_TARGET)_debug.bin $(BOOT_TASK).o $(TASK265_TARGET).o
	$(DUMP_MIPS) -S $(TASK265_TARGET)_debug.bin > $(TASK265_TARGET).lst
	$(COPY_MIPS) $(TASK265_TARGET).bin $(TASK265_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK265_TARGET).dump > $(TASK265_TARGET).txt
UPSAMP_0_266:
	$(GCC_MIPS_APP) $(TASK266_PATH) -o $(TASK266_TARGET).o --include $(TASK266_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK266_TARGET).map -s -N -o $(TASK266_TARGET).bin $(BOOT_TASK).o $(TASK266_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK266_TARGET)_debug.map -o $(TASK266_TARGET)_debug.bin $(BOOT_TASK).o $(TASK266_TARGET).o
	$(DUMP_MIPS) -S $(TASK266_TARGET)_debug.bin > $(TASK266_TARGET).lst
	$(COPY_MIPS) $(TASK266_TARGET).bin $(TASK266_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK266_TARGET).dump > $(TASK266_TARGET).txt
VU_0_267:
	$(GCC_MIPS_APP) $(TASK267_PATH) -o $(TASK267_TARGET).o --include $(TASK267_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK267_TARGET).map -s -N -o $(TASK267_TARGET).bin $(BOOT_TASK).o $(TASK267_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK267_TARGET)_debug.map -o $(TASK267_TARGET)_debug.bin $(BOOT_TASK).o $(TASK267_TARGET).o
	$(DUMP_MIPS) -S $(TASK267_TARGET)_debug.bin > $(TASK267_TARGET).lst
	$(COPY_MIPS) $(TASK267_TARGET).bin $(TASK267_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK267_TARGET).dump > $(TASK267_TARGET).txt

ram_gen: ram_master ram_plasma

ram_master:
	$(RAM_GENERATOR) 256 -rtl kernel_master.txt > ram_master.vhd
	cp ram_master.vhd ../plasma_ram/rtl
	$(RAM_GENERATOR) 256 -h kernel_master.txt > ram_master.h
	cp -rf $(HEMPS_PATH)/hardware/sc_ram/ram_master.cpp ../plasma_ram/sc
	cp ram_master.h ../plasma_ram/sc

ram_plasma:
	$(RAM_GENERATOR) 256 -rtl kernel_plasma.txt > ram_plasma.vhd
	cp ram_plasma.vhd ../plasma_ram/rtl
	$(RAM_GENERATOR) 256 -h kernel_plasma.txt > ram_plasma.h
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

all: bootTask kernel_master kernel_plasma idct_0 iquant_1 ivlc_2 print_3 start_4 ADSP_0_256 AU_0_257 BAB_0_258 IDCT_0_259 MCPU_0_260 RAST_0_261 RISC_0_262 SDRAM_0_263 SRAM1_0_264 SRAM2_0_265 UPSAMP_0_266 VU_0_267 ram_gen