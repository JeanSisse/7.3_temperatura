LIB=work

#this environment variable must point to the hemps path, where the hardware, software and tools folders are located
BASE_PATH=$(HEMPS_PATH)
HW_PATH=hardware

#VHDL files
PKG_SRC=HeMPS_defaults.vhd
PKG_DIR=$(HW_PATH)
PKG_PATH=$(addprefix $(PKG_DIR)/,$(PKG_SRC))

SCENARIO_SRC=HeMPS_PKG repository
SCENARIO_DIR=./
SCENARIO_PATH=$(addprefix $(SCENARIO_DIR)/,$(SCENARIO_SRC))

MPACK_SRC=mlite_pack.vhd UartFile.vhd
MPACK_DIR=$(HW_PATH)/plasma/rtl
MPACK_PATH=$(addprefix $(MPACK_DIR)/,$(MPACK_SRC))

MLITE_SRC=alu.vhd bus_mux.vhd control.vhd mem_ctrl.vhd mult.vhd pc_next.vhd pipeline.vhd reg_bank.vhd shifter.vhd mlite_cpu.vhd
MLITE_DIR=$(HW_PATH)/plasma/rtl
MLITE_PATH=$(addprefix $(MLITE_DIR)/,$(MLITE_SRC))

DMNI_SRC=dmni.vhd
DMNI_DIR=$(HW_PATH)/dmni/rtl
DMNI_PATH=$(addprefix $(DMNI_DIR)/,$(DMNI_SRC))

ROUTER_SRC=Hermes_buffer.vhd Hermes_crossbar.vhd Hermes_switchcontrol.vhd RouterCC.vhd
ROUTER_DIR=$(HW_PATH)/router/rtl
ROUTER_PATH=$(addprefix $(ROUTER_DIR)/,$(ROUTER_SRC))

PLASMA_RAM_SRC=ram_master ram_plasma
PLASMA_RAM_DIR=$(SCENARIO_DIR)/plasma_ram/rtl
PLASMA_RAM_PATH=$(addprefix $(PLASMA_RAM_DIR)/,$(PLASMA_RAM_SRC))

PLASMA_SRC=access_repository.vhd plasma.vhd
PLASMA_DIR=$(HW_PATH)/plasma/rtl
PLASMA_PATH=$(addprefix $(PLASMA_DIR)/,$(PLASMA_SRC))

TOP_SRC=processing_element.vhd HeMPS.vhd test_bench.vhd
TOP_DIR=$(HW_PATH)
TOP_PATH=$(addprefix $(TOP_DIR)/,$(TOP_SRC))

#SystemC files
SC_NOC_DIR=$(SCENARIO_DIR)/hardware/router/sc
SC_MLITE_DIR=$(HW_PATH)/plasma/sc
SC_RAM_DIR=$(SCENARIO_DIR)/plasma_ram/sc
SC_PLASMA_DIR=$(HW_PATH)/plasma/sc
SC_TESTBENCH_DIR=$(HW_PATH)/sc
SC_DMNI_DIR=$(HW_PATH)/dmni/sc
SC_ACCESS_REPO_DIR=$(HW_PATH)/plasma/sc

SC_NOC_SRC=queue switchcontrol_XY router_cc 
SC_MLITE_SRC=mlite_cpu.cpp
SC_RAM_SRC=ram_master ram_plasma
SC_PLASMA_SRC=plasma.cpp
SC_TESTBENCH_SRC=hemps.cpp test_bench.cpp
SC_DMNI_SRC=dmni.cpp
SC_ACCESS_REPO_SRC=


SC_NOC_PATH=$(addprefix $(SC_NOC_DIR)/,$(SC_NOC_SRC))
SC_MLITE_PATH=$(addprefix $(SC_MLITE_DIR)/,$(SC_MLITE_SRC))
SC_RAM_PATH=$(addprefix $(SC_RAM_DIR)/,$(SC_RAM_SRC))
SC_PLASMA_PATH=$(addprefix $(SC_PLASMA_DIR)/,$(SC_PLASMA_SRC))
SC_TESTBENCH_PATH=$(addprefix $(SC_TESTBENCH_DIR)/,$(SC_TESTBENCH_SRC))
SC_DMNI_PATH=$(addprefix $(SC_DMNI_DIR)/,$(SC_DMNI_SRC))
SC_ACCESS_REPO_PATH=$(addprefix $(SC_ACCESS_REPO_DIR)/,$(SC_ACCESS_REPO_SRC))

#compilers definitions
INC=-Iplasma_ram/sc/ -I./  -I$(SCENARIO_DIR)hardware/router/sc/ -I$(SCENARIO_DIR)build/
VHD_C=@vcom
GEN=g++ -I. -I/usr/local/systemc231/include -o HeMPS *.o -L. -L/usr/local/system231/lib-linux64 -lsystemc -lm

#modelsim gcc compiler
#SC_C=@sccom -work $(LIB) -g
#systemc g++ compiler
SC_C=g++ -c -g -Wall -O2 -fpermissive -I. -I/usr/local/systemc231/include -L. -L/usr/local/system231/lib-linux64 -lsystemc -lm


default:
	@echo "Makefile for the hemps in systemc"
	@echo "---------------------------------------"
	@echo "Make options:"
	@echo "   default: Echo these instructions"
	@echo "       lib: Generate work dir and map its library"
	@echo "       vhd: Compile vhd HeMPS description files"
	@echo "       iss: Compile vhd and SystemC HeMPS description files"
	@echo "       all: Compile sytemc and vhd files"
	@echo "     clean: Remove all compiled and generated files"
	@echo

iss: lib $(SCENARIO_PATH) $(PKG_PATH) $(MPACK_PATH) $(SC_MLITE_PATH) $(DMNI_PATH) $(ROUTER_PATH) $(SC_RAM_PATH) $(MBLITE_STD_PATH) $(MBLITE_CORE_PATH) $(SC_MBLITE_RAM_PATH) $(MBLITE_PATH) $(PLASMA_PATH) $(TOP_PATH)
	@sccom -link
	

scmod: lib $(SC_NOC_PATH) $(SC_MLITE_PATH) $(SC_RAM_PATH) $(SC_ACCESS_REPO_PATH) $(SC_DMNI_PATH) $(SC_PLASMA_PATH) $(SC_TESTBENCH_PATH)
	@sccom -link
	

sc: $(SC_NOC_PATH) $(SC_MLITE_PATH) $(SC_RAM_PATH) $(SC_ACCESS_REPO_PATH) $(SC_DMNI_PATH) $(SC_PLASMA_PATH) $(SC_TESTBENCH_PATH)
	$(GEN)

vhd: lib $(SCENARIO_PATH) $(PKG_PATH) $(MPACK_PATH) $(MLITE_PATH) $(DMNI_PATH) $(ROUTER_PATH) $(PLASMA_RAM_PATH) $(MBLITE_STD_PATH) $(MBLITE_CORE_PATH) $(MBLITE_RAM_PATH) $(MBLITE_PATH) $(PLASMA_PATH) $(TOP_PATH)
	
$(SCENARIO_PATH):
	$(VHD_C) -work $(LIB) $(@).vhd
	
$(PLASMA_RAM_PATH):
	$(VHD_C) -work $(LIB) $(@).vhd
	
$(SC_NOC_PATH):
	$(SC_C) $(@).cpp  $(INC)
	
$(SC_RAM_PATH):
	$(SC_C) $(@).cpp  $(INC)
	
%.vhd:
	$(VHD_C) -work $(LIB) $(BASE_PATH)/$*.vhd
	
%.cpp:
	$(SC_C) $(BASE_PATH)/$*.cpp  $(INC)
	
sim:
	do sim.do
	
lib:
	@vlib $(LIB)
	@vmap $(LIB) $(LIB)
	
clean:
	@rm -r -f $(LIB)
	@rm -f transcript
	@rm -f modelsim.ini
	@rm -f vsim.wlf
	@rm -f *~
	@rm -f *.o
	@rm -f *.exe
	@rm -f HeMPS
	
all: sc
	
