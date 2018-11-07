
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
TASK0_PATH = ../applications/synthetic/taskA.c
TASK0_INCLUDE = ids_synthetic.h
TASK0_NAME = taskA
TASK0_ID = 0
TASK0_TARGET = $(TASK0_NAME)_$(TASK0_ID)

TASK1_PATH = ../applications/synthetic/taskB.c
TASK1_INCLUDE = ids_synthetic.h
TASK1_NAME = taskB
TASK1_ID = 1
TASK1_TARGET = $(TASK1_NAME)_$(TASK1_ID)

TASK2_PATH = ../applications/synthetic/taskC.c
TASK2_INCLUDE = ids_synthetic.h
TASK2_NAME = taskC
TASK2_ID = 2
TASK2_TARGET = $(TASK2_NAME)_$(TASK2_ID)

TASK3_PATH = ../applications/synthetic/taskD.c
TASK3_INCLUDE = ids_synthetic.h
TASK3_NAME = taskD
TASK3_ID = 3
TASK3_TARGET = $(TASK3_NAME)_$(TASK3_ID)

TASK4_PATH = ../applications/synthetic/taskE.c
TASK4_INCLUDE = ids_synthetic.h
TASK4_NAME = taskE
TASK4_ID = 4
TASK4_TARGET = $(TASK4_NAME)_$(TASK4_ID)

TASK5_PATH = ../applications/synthetic/taskF.c
TASK5_INCLUDE = ids_synthetic.h
TASK5_NAME = taskF
TASK5_ID = 5
TASK5_TARGET = $(TASK5_NAME)_$(TASK5_ID)

TASK256_PATH = ../applications/mpeg/idct.c
TASK256_INCLUDE = ids_mpeg.h
TASK256_NAME = idct
TASK256_ID = 256
TASK256_TARGET = $(TASK256_NAME)_$(TASK256_ID)

TASK257_PATH = ../applications/mpeg/iquant.c
TASK257_INCLUDE = ids_mpeg.h
TASK257_NAME = iquant
TASK257_ID = 257
TASK257_TARGET = $(TASK257_NAME)_$(TASK257_ID)

TASK258_PATH = ../applications/mpeg/ivlc.c
TASK258_INCLUDE = ids_mpeg.h
TASK258_NAME = ivlc
TASK258_ID = 258
TASK258_TARGET = $(TASK258_NAME)_$(TASK258_ID)

TASK259_PATH = ../applications/mpeg/print.c
TASK259_INCLUDE = ids_mpeg.h
TASK259_NAME = print
TASK259_ID = 259
TASK259_TARGET = $(TASK259_NAME)_$(TASK259_ID)

TASK260_PATH = ../applications/mpeg/start.c
TASK260_INCLUDE = ids_mpeg.h
TASK260_NAME = start
TASK260_ID = 260
TASK260_TARGET = $(TASK260_NAME)_$(TASK260_ID)

TASK512_PATH = ../applications/dijkstra/dijkstra_0.c
TASK512_INCLUDE = ids_dijkstra.h
TASK512_NAME = dijkstra_0
TASK512_ID = 512
TASK512_TARGET = $(TASK512_NAME)_$(TASK512_ID)

TASK513_PATH = ../applications/dijkstra/dijkstra_1.c
TASK513_INCLUDE = ids_dijkstra.h
TASK513_NAME = dijkstra_1
TASK513_ID = 513
TASK513_TARGET = $(TASK513_NAME)_$(TASK513_ID)

TASK514_PATH = ../applications/dijkstra/dijkstra_2.c
TASK514_INCLUDE = ids_dijkstra.h
TASK514_NAME = dijkstra_2
TASK514_ID = 514
TASK514_TARGET = $(TASK514_NAME)_$(TASK514_ID)

TASK515_PATH = ../applications/dijkstra/dijkstra_3.c
TASK515_INCLUDE = ids_dijkstra.h
TASK515_NAME = dijkstra_3
TASK515_ID = 515
TASK515_TARGET = $(TASK515_NAME)_$(TASK515_ID)

TASK516_PATH = ../applications/dijkstra/dijkstra_4.c
TASK516_INCLUDE = ids_dijkstra.h
TASK516_NAME = dijkstra_4
TASK516_ID = 516
TASK516_TARGET = $(TASK516_NAME)_$(TASK516_ID)

TASK517_PATH = ../applications/dijkstra/divider.c
TASK517_INCLUDE = ids_dijkstra.h
TASK517_NAME = divider
TASK517_ID = 517
TASK517_TARGET = $(TASK517_NAME)_$(TASK517_ID)

TASK768_PATH = ../applications/MPEG4/ADSP_0.c
TASK768_INCLUDE = ids_MPEG4.h
TASK768_NAME = ADSP_0
TASK768_ID = 768
TASK768_TARGET = $(TASK768_NAME)_$(TASK768_ID)

TASK769_PATH = ../applications/MPEG4/AU_0.c
TASK769_INCLUDE = ids_MPEG4.h
TASK769_NAME = AU_0
TASK769_ID = 769
TASK769_TARGET = $(TASK769_NAME)_$(TASK769_ID)

TASK770_PATH = ../applications/MPEG4/BAB_0.c
TASK770_INCLUDE = ids_MPEG4.h
TASK770_NAME = BAB_0
TASK770_ID = 770
TASK770_TARGET = $(TASK770_NAME)_$(TASK770_ID)

TASK771_PATH = ../applications/MPEG4/IDCT_0.c
TASK771_INCLUDE = ids_MPEG4.h
TASK771_NAME = IDCT_0
TASK771_ID = 771
TASK771_TARGET = $(TASK771_NAME)_$(TASK771_ID)

TASK772_PATH = ../applications/MPEG4/MCPU_0.c
TASK772_INCLUDE = ids_MPEG4.h
TASK772_NAME = MCPU_0
TASK772_ID = 772
TASK772_TARGET = $(TASK772_NAME)_$(TASK772_ID)

TASK773_PATH = ../applications/MPEG4/RAST_0.c
TASK773_INCLUDE = ids_MPEG4.h
TASK773_NAME = RAST_0
TASK773_ID = 773
TASK773_TARGET = $(TASK773_NAME)_$(TASK773_ID)

TASK774_PATH = ../applications/MPEG4/RISC_0.c
TASK774_INCLUDE = ids_MPEG4.h
TASK774_NAME = RISC_0
TASK774_ID = 774
TASK774_TARGET = $(TASK774_NAME)_$(TASK774_ID)

TASK775_PATH = ../applications/MPEG4/SDRAM_0.c
TASK775_INCLUDE = ids_MPEG4.h
TASK775_NAME = SDRAM_0
TASK775_ID = 775
TASK775_TARGET = $(TASK775_NAME)_$(TASK775_ID)

TASK776_PATH = ../applications/MPEG4/SRAM1_0.c
TASK776_INCLUDE = ids_MPEG4.h
TASK776_NAME = SRAM1_0
TASK776_ID = 776
TASK776_TARGET = $(TASK776_NAME)_$(TASK776_ID)

TASK777_PATH = ../applications/MPEG4/SRAM2_0.c
TASK777_INCLUDE = ids_MPEG4.h
TASK777_NAME = SRAM2_0
TASK777_ID = 777
TASK777_TARGET = $(TASK777_NAME)_$(TASK777_ID)

TASK778_PATH = ../applications/MPEG4/UPSAMP_0.c
TASK778_INCLUDE = ids_MPEG4.h
TASK778_NAME = UPSAMP_0
TASK778_ID = 778
TASK778_TARGET = $(TASK778_NAME)_$(TASK778_ID)

TASK779_PATH = ../applications/MPEG4/VU_0.c
TASK779_INCLUDE = ids_MPEG4.h
TASK779_NAME = VU_0
TASK779_ID = 779
TASK779_TARGET = $(TASK779_NAME)_$(TASK779_ID)

TASK1024_PATH = ../applications/dtw/bank.c
TASK1024_INCLUDE = ids_dtw.h
TASK1024_NAME = bank
TASK1024_ID = 1024
TASK1024_TARGET = $(TASK1024_NAME)_$(TASK1024_ID)

TASK1025_PATH = ../applications/dtw/p1.c
TASK1025_INCLUDE = ids_dtw.h
TASK1025_NAME = p1
TASK1025_ID = 1025
TASK1025_TARGET = $(TASK1025_NAME)_$(TASK1025_ID)

TASK1026_PATH = ../applications/dtw/p2.c
TASK1026_INCLUDE = ids_dtw.h
TASK1026_NAME = p2
TASK1026_ID = 1026
TASK1026_TARGET = $(TASK1026_NAME)_$(TASK1026_ID)

TASK1027_PATH = ../applications/dtw/p3.c
TASK1027_INCLUDE = ids_dtw.h
TASK1027_NAME = p3
TASK1027_ID = 1027
TASK1027_TARGET = $(TASK1027_NAME)_$(TASK1027_ID)

TASK1028_PATH = ../applications/dtw/p4.c
TASK1028_INCLUDE = ids_dtw.h
TASK1028_NAME = p4
TASK1028_ID = 1028
TASK1028_TARGET = $(TASK1028_NAME)_$(TASK1028_ID)

TASK1029_PATH = ../applications/dtw/recognizer.c
TASK1029_INCLUDE = ids_dtw.h
TASK1029_NAME = recognizer
TASK1029_ID = 1029
TASK1029_TARGET = $(TASK1029_NAME)_$(TASK1029_ID)

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
	$(AS_MIPS) --defsym sp_addr=65535 -o $(BOOT_TASK).o $(BOOT_TASK_SRC)

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

taskA_0:
	$(GCC_MIPS_APP) $(TASK0_PATH) -o $(TASK0_TARGET).o --include $(TASK0_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK0_TARGET).map -s -N -o $(TASK0_TARGET).bin $(BOOT_TASK).o $(TASK0_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK0_TARGET)_debug.map -o $(TASK0_TARGET)_debug.bin $(BOOT_TASK).o $(TASK0_TARGET).o
	$(DUMP_MIPS) -S $(TASK0_TARGET)_debug.bin > $(TASK0_TARGET).lst
	$(COPY_MIPS) $(TASK0_TARGET).bin $(TASK0_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK0_TARGET).dump > $(TASK0_TARGET).txt
taskB_1:
	$(GCC_MIPS_APP) $(TASK1_PATH) -o $(TASK1_TARGET).o --include $(TASK1_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK1_TARGET).map -s -N -o $(TASK1_TARGET).bin $(BOOT_TASK).o $(TASK1_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK1_TARGET)_debug.map -o $(TASK1_TARGET)_debug.bin $(BOOT_TASK).o $(TASK1_TARGET).o
	$(DUMP_MIPS) -S $(TASK1_TARGET)_debug.bin > $(TASK1_TARGET).lst
	$(COPY_MIPS) $(TASK1_TARGET).bin $(TASK1_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK1_TARGET).dump > $(TASK1_TARGET).txt
taskC_2:
	$(GCC_MIPS_APP) $(TASK2_PATH) -o $(TASK2_TARGET).o --include $(TASK2_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK2_TARGET).map -s -N -o $(TASK2_TARGET).bin $(BOOT_TASK).o $(TASK2_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK2_TARGET)_debug.map -o $(TASK2_TARGET)_debug.bin $(BOOT_TASK).o $(TASK2_TARGET).o
	$(DUMP_MIPS) -S $(TASK2_TARGET)_debug.bin > $(TASK2_TARGET).lst
	$(COPY_MIPS) $(TASK2_TARGET).bin $(TASK2_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK2_TARGET).dump > $(TASK2_TARGET).txt
taskD_3:
	$(GCC_MIPS_APP) $(TASK3_PATH) -o $(TASK3_TARGET).o --include $(TASK3_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK3_TARGET).map -s -N -o $(TASK3_TARGET).bin $(BOOT_TASK).o $(TASK3_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK3_TARGET)_debug.map -o $(TASK3_TARGET)_debug.bin $(BOOT_TASK).o $(TASK3_TARGET).o
	$(DUMP_MIPS) -S $(TASK3_TARGET)_debug.bin > $(TASK3_TARGET).lst
	$(COPY_MIPS) $(TASK3_TARGET).bin $(TASK3_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK3_TARGET).dump > $(TASK3_TARGET).txt
taskE_4:
	$(GCC_MIPS_APP) $(TASK4_PATH) -o $(TASK4_TARGET).o --include $(TASK4_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK4_TARGET).map -s -N -o $(TASK4_TARGET).bin $(BOOT_TASK).o $(TASK4_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK4_TARGET)_debug.map -o $(TASK4_TARGET)_debug.bin $(BOOT_TASK).o $(TASK4_TARGET).o
	$(DUMP_MIPS) -S $(TASK4_TARGET)_debug.bin > $(TASK4_TARGET).lst
	$(COPY_MIPS) $(TASK4_TARGET).bin $(TASK4_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK4_TARGET).dump > $(TASK4_TARGET).txt
taskF_5:
	$(GCC_MIPS_APP) $(TASK5_PATH) -o $(TASK5_TARGET).o --include $(TASK5_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK5_TARGET).map -s -N -o $(TASK5_TARGET).bin $(BOOT_TASK).o $(TASK5_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK5_TARGET)_debug.map -o $(TASK5_TARGET)_debug.bin $(BOOT_TASK).o $(TASK5_TARGET).o
	$(DUMP_MIPS) -S $(TASK5_TARGET)_debug.bin > $(TASK5_TARGET).lst
	$(COPY_MIPS) $(TASK5_TARGET).bin $(TASK5_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK5_TARGET).dump > $(TASK5_TARGET).txt
idct_256:
	$(GCC_MIPS_APP) $(TASK256_PATH) -o $(TASK256_TARGET).o --include $(TASK256_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK256_TARGET).map -s -N -o $(TASK256_TARGET).bin $(BOOT_TASK).o $(TASK256_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK256_TARGET)_debug.map -o $(TASK256_TARGET)_debug.bin $(BOOT_TASK).o $(TASK256_TARGET).o
	$(DUMP_MIPS) -S $(TASK256_TARGET)_debug.bin > $(TASK256_TARGET).lst
	$(COPY_MIPS) $(TASK256_TARGET).bin $(TASK256_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK256_TARGET).dump > $(TASK256_TARGET).txt
iquant_257:
	$(GCC_MIPS_APP) $(TASK257_PATH) -o $(TASK257_TARGET).o --include $(TASK257_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK257_TARGET).map -s -N -o $(TASK257_TARGET).bin $(BOOT_TASK).o $(TASK257_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK257_TARGET)_debug.map -o $(TASK257_TARGET)_debug.bin $(BOOT_TASK).o $(TASK257_TARGET).o
	$(DUMP_MIPS) -S $(TASK257_TARGET)_debug.bin > $(TASK257_TARGET).lst
	$(COPY_MIPS) $(TASK257_TARGET).bin $(TASK257_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK257_TARGET).dump > $(TASK257_TARGET).txt
ivlc_258:
	$(GCC_MIPS_APP) $(TASK258_PATH) -o $(TASK258_TARGET).o --include $(TASK258_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK258_TARGET).map -s -N -o $(TASK258_TARGET).bin $(BOOT_TASK).o $(TASK258_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK258_TARGET)_debug.map -o $(TASK258_TARGET)_debug.bin $(BOOT_TASK).o $(TASK258_TARGET).o
	$(DUMP_MIPS) -S $(TASK258_TARGET)_debug.bin > $(TASK258_TARGET).lst
	$(COPY_MIPS) $(TASK258_TARGET).bin $(TASK258_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK258_TARGET).dump > $(TASK258_TARGET).txt
print_259:
	$(GCC_MIPS_APP) $(TASK259_PATH) -o $(TASK259_TARGET).o --include $(TASK259_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK259_TARGET).map -s -N -o $(TASK259_TARGET).bin $(BOOT_TASK).o $(TASK259_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK259_TARGET)_debug.map -o $(TASK259_TARGET)_debug.bin $(BOOT_TASK).o $(TASK259_TARGET).o
	$(DUMP_MIPS) -S $(TASK259_TARGET)_debug.bin > $(TASK259_TARGET).lst
	$(COPY_MIPS) $(TASK259_TARGET).bin $(TASK259_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK259_TARGET).dump > $(TASK259_TARGET).txt
start_260:
	$(GCC_MIPS_APP) $(TASK260_PATH) -o $(TASK260_TARGET).o --include $(TASK260_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK260_TARGET).map -s -N -o $(TASK260_TARGET).bin $(BOOT_TASK).o $(TASK260_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK260_TARGET)_debug.map -o $(TASK260_TARGET)_debug.bin $(BOOT_TASK).o $(TASK260_TARGET).o
	$(DUMP_MIPS) -S $(TASK260_TARGET)_debug.bin > $(TASK260_TARGET).lst
	$(COPY_MIPS) $(TASK260_TARGET).bin $(TASK260_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK260_TARGET).dump > $(TASK260_TARGET).txt
dijkstra_0_512:
	$(GCC_MIPS_APP) $(TASK512_PATH) -o $(TASK512_TARGET).o --include $(TASK512_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK512_TARGET).map -s -N -o $(TASK512_TARGET).bin $(BOOT_TASK).o $(TASK512_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK512_TARGET)_debug.map -o $(TASK512_TARGET)_debug.bin $(BOOT_TASK).o $(TASK512_TARGET).o
	$(DUMP_MIPS) -S $(TASK512_TARGET)_debug.bin > $(TASK512_TARGET).lst
	$(COPY_MIPS) $(TASK512_TARGET).bin $(TASK512_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK512_TARGET).dump > $(TASK512_TARGET).txt
dijkstra_1_513:
	$(GCC_MIPS_APP) $(TASK513_PATH) -o $(TASK513_TARGET).o --include $(TASK513_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK513_TARGET).map -s -N -o $(TASK513_TARGET).bin $(BOOT_TASK).o $(TASK513_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK513_TARGET)_debug.map -o $(TASK513_TARGET)_debug.bin $(BOOT_TASK).o $(TASK513_TARGET).o
	$(DUMP_MIPS) -S $(TASK513_TARGET)_debug.bin > $(TASK513_TARGET).lst
	$(COPY_MIPS) $(TASK513_TARGET).bin $(TASK513_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK513_TARGET).dump > $(TASK513_TARGET).txt
dijkstra_2_514:
	$(GCC_MIPS_APP) $(TASK514_PATH) -o $(TASK514_TARGET).o --include $(TASK514_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK514_TARGET).map -s -N -o $(TASK514_TARGET).bin $(BOOT_TASK).o $(TASK514_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK514_TARGET)_debug.map -o $(TASK514_TARGET)_debug.bin $(BOOT_TASK).o $(TASK514_TARGET).o
	$(DUMP_MIPS) -S $(TASK514_TARGET)_debug.bin > $(TASK514_TARGET).lst
	$(COPY_MIPS) $(TASK514_TARGET).bin $(TASK514_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK514_TARGET).dump > $(TASK514_TARGET).txt
dijkstra_3_515:
	$(GCC_MIPS_APP) $(TASK515_PATH) -o $(TASK515_TARGET).o --include $(TASK515_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK515_TARGET).map -s -N -o $(TASK515_TARGET).bin $(BOOT_TASK).o $(TASK515_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK515_TARGET)_debug.map -o $(TASK515_TARGET)_debug.bin $(BOOT_TASK).o $(TASK515_TARGET).o
	$(DUMP_MIPS) -S $(TASK515_TARGET)_debug.bin > $(TASK515_TARGET).lst
	$(COPY_MIPS) $(TASK515_TARGET).bin $(TASK515_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK515_TARGET).dump > $(TASK515_TARGET).txt
dijkstra_4_516:
	$(GCC_MIPS_APP) $(TASK516_PATH) -o $(TASK516_TARGET).o --include $(TASK516_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK516_TARGET).map -s -N -o $(TASK516_TARGET).bin $(BOOT_TASK).o $(TASK516_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK516_TARGET)_debug.map -o $(TASK516_TARGET)_debug.bin $(BOOT_TASK).o $(TASK516_TARGET).o
	$(DUMP_MIPS) -S $(TASK516_TARGET)_debug.bin > $(TASK516_TARGET).lst
	$(COPY_MIPS) $(TASK516_TARGET).bin $(TASK516_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK516_TARGET).dump > $(TASK516_TARGET).txt
divider_517:
	$(GCC_MIPS_APP) $(TASK517_PATH) -o $(TASK517_TARGET).o --include $(TASK517_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK517_TARGET).map -s -N -o $(TASK517_TARGET).bin $(BOOT_TASK).o $(TASK517_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK517_TARGET)_debug.map -o $(TASK517_TARGET)_debug.bin $(BOOT_TASK).o $(TASK517_TARGET).o
	$(DUMP_MIPS) -S $(TASK517_TARGET)_debug.bin > $(TASK517_TARGET).lst
	$(COPY_MIPS) $(TASK517_TARGET).bin $(TASK517_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK517_TARGET).dump > $(TASK517_TARGET).txt
ADSP_0_768:
	$(GCC_MIPS_APP) $(TASK768_PATH) -o $(TASK768_TARGET).o --include $(TASK768_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK768_TARGET).map -s -N -o $(TASK768_TARGET).bin $(BOOT_TASK).o $(TASK768_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK768_TARGET)_debug.map -o $(TASK768_TARGET)_debug.bin $(BOOT_TASK).o $(TASK768_TARGET).o
	$(DUMP_MIPS) -S $(TASK768_TARGET)_debug.bin > $(TASK768_TARGET).lst
	$(COPY_MIPS) $(TASK768_TARGET).bin $(TASK768_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK768_TARGET).dump > $(TASK768_TARGET).txt
AU_0_769:
	$(GCC_MIPS_APP) $(TASK769_PATH) -o $(TASK769_TARGET).o --include $(TASK769_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK769_TARGET).map -s -N -o $(TASK769_TARGET).bin $(BOOT_TASK).o $(TASK769_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK769_TARGET)_debug.map -o $(TASK769_TARGET)_debug.bin $(BOOT_TASK).o $(TASK769_TARGET).o
	$(DUMP_MIPS) -S $(TASK769_TARGET)_debug.bin > $(TASK769_TARGET).lst
	$(COPY_MIPS) $(TASK769_TARGET).bin $(TASK769_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK769_TARGET).dump > $(TASK769_TARGET).txt
BAB_0_770:
	$(GCC_MIPS_APP) $(TASK770_PATH) -o $(TASK770_TARGET).o --include $(TASK770_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK770_TARGET).map -s -N -o $(TASK770_TARGET).bin $(BOOT_TASK).o $(TASK770_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK770_TARGET)_debug.map -o $(TASK770_TARGET)_debug.bin $(BOOT_TASK).o $(TASK770_TARGET).o
	$(DUMP_MIPS) -S $(TASK770_TARGET)_debug.bin > $(TASK770_TARGET).lst
	$(COPY_MIPS) $(TASK770_TARGET).bin $(TASK770_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK770_TARGET).dump > $(TASK770_TARGET).txt
IDCT_0_771:
	$(GCC_MIPS_APP) $(TASK771_PATH) -o $(TASK771_TARGET).o --include $(TASK771_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK771_TARGET).map -s -N -o $(TASK771_TARGET).bin $(BOOT_TASK).o $(TASK771_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK771_TARGET)_debug.map -o $(TASK771_TARGET)_debug.bin $(BOOT_TASK).o $(TASK771_TARGET).o
	$(DUMP_MIPS) -S $(TASK771_TARGET)_debug.bin > $(TASK771_TARGET).lst
	$(COPY_MIPS) $(TASK771_TARGET).bin $(TASK771_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK771_TARGET).dump > $(TASK771_TARGET).txt
MCPU_0_772:
	$(GCC_MIPS_APP) $(TASK772_PATH) -o $(TASK772_TARGET).o --include $(TASK772_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK772_TARGET).map -s -N -o $(TASK772_TARGET).bin $(BOOT_TASK).o $(TASK772_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK772_TARGET)_debug.map -o $(TASK772_TARGET)_debug.bin $(BOOT_TASK).o $(TASK772_TARGET).o
	$(DUMP_MIPS) -S $(TASK772_TARGET)_debug.bin > $(TASK772_TARGET).lst
	$(COPY_MIPS) $(TASK772_TARGET).bin $(TASK772_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK772_TARGET).dump > $(TASK772_TARGET).txt
RAST_0_773:
	$(GCC_MIPS_APP) $(TASK773_PATH) -o $(TASK773_TARGET).o --include $(TASK773_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK773_TARGET).map -s -N -o $(TASK773_TARGET).bin $(BOOT_TASK).o $(TASK773_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK773_TARGET)_debug.map -o $(TASK773_TARGET)_debug.bin $(BOOT_TASK).o $(TASK773_TARGET).o
	$(DUMP_MIPS) -S $(TASK773_TARGET)_debug.bin > $(TASK773_TARGET).lst
	$(COPY_MIPS) $(TASK773_TARGET).bin $(TASK773_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK773_TARGET).dump > $(TASK773_TARGET).txt
RISC_0_774:
	$(GCC_MIPS_APP) $(TASK774_PATH) -o $(TASK774_TARGET).o --include $(TASK774_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK774_TARGET).map -s -N -o $(TASK774_TARGET).bin $(BOOT_TASK).o $(TASK774_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK774_TARGET)_debug.map -o $(TASK774_TARGET)_debug.bin $(BOOT_TASK).o $(TASK774_TARGET).o
	$(DUMP_MIPS) -S $(TASK774_TARGET)_debug.bin > $(TASK774_TARGET).lst
	$(COPY_MIPS) $(TASK774_TARGET).bin $(TASK774_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK774_TARGET).dump > $(TASK774_TARGET).txt
SDRAM_0_775:
	$(GCC_MIPS_APP) $(TASK775_PATH) -o $(TASK775_TARGET).o --include $(TASK775_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK775_TARGET).map -s -N -o $(TASK775_TARGET).bin $(BOOT_TASK).o $(TASK775_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK775_TARGET)_debug.map -o $(TASK775_TARGET)_debug.bin $(BOOT_TASK).o $(TASK775_TARGET).o
	$(DUMP_MIPS) -S $(TASK775_TARGET)_debug.bin > $(TASK775_TARGET).lst
	$(COPY_MIPS) $(TASK775_TARGET).bin $(TASK775_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK775_TARGET).dump > $(TASK775_TARGET).txt
SRAM1_0_776:
	$(GCC_MIPS_APP) $(TASK776_PATH) -o $(TASK776_TARGET).o --include $(TASK776_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK776_TARGET).map -s -N -o $(TASK776_TARGET).bin $(BOOT_TASK).o $(TASK776_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK776_TARGET)_debug.map -o $(TASK776_TARGET)_debug.bin $(BOOT_TASK).o $(TASK776_TARGET).o
	$(DUMP_MIPS) -S $(TASK776_TARGET)_debug.bin > $(TASK776_TARGET).lst
	$(COPY_MIPS) $(TASK776_TARGET).bin $(TASK776_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK776_TARGET).dump > $(TASK776_TARGET).txt
SRAM2_0_777:
	$(GCC_MIPS_APP) $(TASK777_PATH) -o $(TASK777_TARGET).o --include $(TASK777_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK777_TARGET).map -s -N -o $(TASK777_TARGET).bin $(BOOT_TASK).o $(TASK777_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK777_TARGET)_debug.map -o $(TASK777_TARGET)_debug.bin $(BOOT_TASK).o $(TASK777_TARGET).o
	$(DUMP_MIPS) -S $(TASK777_TARGET)_debug.bin > $(TASK777_TARGET).lst
	$(COPY_MIPS) $(TASK777_TARGET).bin $(TASK777_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK777_TARGET).dump > $(TASK777_TARGET).txt
UPSAMP_0_778:
	$(GCC_MIPS_APP) $(TASK778_PATH) -o $(TASK778_TARGET).o --include $(TASK778_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK778_TARGET).map -s -N -o $(TASK778_TARGET).bin $(BOOT_TASK).o $(TASK778_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK778_TARGET)_debug.map -o $(TASK778_TARGET)_debug.bin $(BOOT_TASK).o $(TASK778_TARGET).o
	$(DUMP_MIPS) -S $(TASK778_TARGET)_debug.bin > $(TASK778_TARGET).lst
	$(COPY_MIPS) $(TASK778_TARGET).bin $(TASK778_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK778_TARGET).dump > $(TASK778_TARGET).txt
VU_0_779:
	$(GCC_MIPS_APP) $(TASK779_PATH) -o $(TASK779_TARGET).o --include $(TASK779_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK779_TARGET).map -s -N -o $(TASK779_TARGET).bin $(BOOT_TASK).o $(TASK779_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK779_TARGET)_debug.map -o $(TASK779_TARGET)_debug.bin $(BOOT_TASK).o $(TASK779_TARGET).o
	$(DUMP_MIPS) -S $(TASK779_TARGET)_debug.bin > $(TASK779_TARGET).lst
	$(COPY_MIPS) $(TASK779_TARGET).bin $(TASK779_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK779_TARGET).dump > $(TASK779_TARGET).txt
bank_1024:
	$(GCC_MIPS_APP) $(TASK1024_PATH) -o $(TASK1024_TARGET).o --include $(TASK1024_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK1024_TARGET).map -s -N -o $(TASK1024_TARGET).bin $(BOOT_TASK).o $(TASK1024_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK1024_TARGET)_debug.map -o $(TASK1024_TARGET)_debug.bin $(BOOT_TASK).o $(TASK1024_TARGET).o
	$(DUMP_MIPS) -S $(TASK1024_TARGET)_debug.bin > $(TASK1024_TARGET).lst
	$(COPY_MIPS) $(TASK1024_TARGET).bin $(TASK1024_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK1024_TARGET).dump > $(TASK1024_TARGET).txt
p1_1025:
	$(GCC_MIPS_APP) $(TASK1025_PATH) -o $(TASK1025_TARGET).o --include $(TASK1025_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK1025_TARGET).map -s -N -o $(TASK1025_TARGET).bin $(BOOT_TASK).o $(TASK1025_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK1025_TARGET)_debug.map -o $(TASK1025_TARGET)_debug.bin $(BOOT_TASK).o $(TASK1025_TARGET).o
	$(DUMP_MIPS) -S $(TASK1025_TARGET)_debug.bin > $(TASK1025_TARGET).lst
	$(COPY_MIPS) $(TASK1025_TARGET).bin $(TASK1025_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK1025_TARGET).dump > $(TASK1025_TARGET).txt
p2_1026:
	$(GCC_MIPS_APP) $(TASK1026_PATH) -o $(TASK1026_TARGET).o --include $(TASK1026_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK1026_TARGET).map -s -N -o $(TASK1026_TARGET).bin $(BOOT_TASK).o $(TASK1026_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK1026_TARGET)_debug.map -o $(TASK1026_TARGET)_debug.bin $(BOOT_TASK).o $(TASK1026_TARGET).o
	$(DUMP_MIPS) -S $(TASK1026_TARGET)_debug.bin > $(TASK1026_TARGET).lst
	$(COPY_MIPS) $(TASK1026_TARGET).bin $(TASK1026_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK1026_TARGET).dump > $(TASK1026_TARGET).txt
p3_1027:
	$(GCC_MIPS_APP) $(TASK1027_PATH) -o $(TASK1027_TARGET).o --include $(TASK1027_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK1027_TARGET).map -s -N -o $(TASK1027_TARGET).bin $(BOOT_TASK).o $(TASK1027_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK1027_TARGET)_debug.map -o $(TASK1027_TARGET)_debug.bin $(BOOT_TASK).o $(TASK1027_TARGET).o
	$(DUMP_MIPS) -S $(TASK1027_TARGET)_debug.bin > $(TASK1027_TARGET).lst
	$(COPY_MIPS) $(TASK1027_TARGET).bin $(TASK1027_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK1027_TARGET).dump > $(TASK1027_TARGET).txt
p4_1028:
	$(GCC_MIPS_APP) $(TASK1028_PATH) -o $(TASK1028_TARGET).o --include $(TASK1028_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK1028_TARGET).map -s -N -o $(TASK1028_TARGET).bin $(BOOT_TASK).o $(TASK1028_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK1028_TARGET)_debug.map -o $(TASK1028_TARGET)_debug.bin $(BOOT_TASK).o $(TASK1028_TARGET).o
	$(DUMP_MIPS) -S $(TASK1028_TARGET)_debug.bin > $(TASK1028_TARGET).lst
	$(COPY_MIPS) $(TASK1028_TARGET).bin $(TASK1028_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK1028_TARGET).dump > $(TASK1028_TARGET).txt
recognizer_1029:
	$(GCC_MIPS_APP) $(TASK1029_PATH) -o $(TASK1029_TARGET).o --include $(TASK1029_INCLUDE) -D PLASMA -I $(INCLUDE)
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK1029_TARGET).map -s -N -o $(TASK1029_TARGET).bin $(BOOT_TASK).o $(TASK1029_TARGET).o
	$(LD_MIPS) -Ttext 0 -eentry -Map $(TASK1029_TARGET)_debug.map -o $(TASK1029_TARGET)_debug.bin $(BOOT_TASK).o $(TASK1029_TARGET).o
	$(DUMP_MIPS) -S $(TASK1029_TARGET)_debug.bin > $(TASK1029_TARGET).lst
	$(COPY_MIPS) $(TASK1029_TARGET).bin $(TASK1029_TARGET).dump
	hexdump -v -e '1/1 "%02x" 1/1 "%02x" 1/1 "%02x" 1/1 "%02x" "\n"' $(TASK1029_TARGET).dump > $(TASK1029_TARGET).txt

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

all: bootTask kernel_master kernel_plasma taskA_0 taskB_1 taskC_2 taskD_3 taskE_4 taskF_5 idct_256 iquant_257 ivlc_258 print_259 start_260 dijkstra_0_512 dijkstra_1_513 dijkstra_2_514 dijkstra_3_515 dijkstra_4_516 divider_517 ADSP_0_768 AU_0_769 BAB_0_770 IDCT_0_771 MCPU_0_772 RAST_0_773 RISC_0_774 SDRAM_0_775 SRAM1_0_776 SRAM2_0_777 UPSAMP_0_778 VU_0_779 bank_1024 p1_1025 p2_1026 p3_1027 p4_1028 recognizer_1029 ram_gen