#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e 

echo "Starting automated PPA analysis for CV32E40P..."

# Create output directories
mkdir -p ./metrics
mkdir -p ./synth_outputs

# sv2v to flatten the SystemVerilog into Verilog-2001

echo "Running sv2v conversion..."
sv2v \
	../rtl/include/cv32e40p_apu_core_pkg.sv \
	../rtl/include/cv32e40p_fpu_pkg.sv \
	../rtl/include/cv32e40p_pkg.sv \
	../rtl/cv32e40p_if_stage.sv \
	../rtl/cv32e40p_cs_registers.sv \
	../rtl/cv32e40p_register_file_ff.sv \
	../rtl/cv32e40p_load_store_unit.sv \
	../rtl/cv32e40p_id_stage.sv \
	../rtl/cv32e40p_aligner.sv \
	../rtl/cv32e40p_decoder.sv \
	../rtl/cv32e40p_compressed_decoder.sv \
	../rtl/cv32e40p_fifo.sv \
	../rtl/cv32e40p_prefetch_buffer.sv \
	../rtl/cv32e40p_hwloop_regs.sv \
	../rtl/cv32e40p_mult.sv \
	../rtl/cv32e40p_int_controller.sv \
	../rtl/cv32e40p_ex_stage.sv \
	../rtl/cv32e40p_alu_div.sv \
	../rtl/cv32e40p_alu.sv \
	../rtl/cv32e40p_ff_one.sv \
	../rtl/cv32e40p_popcnt.sv \
	../rtl/cv32e40p_apu_disp.sv \
	../rtl/cv32e40p_controller.sv \
	../rtl/cv32e40p_obi_interface.sv \
	../rtl/cv32e40p_prefetch_controller.sv \
	../rtl/cv32e40p_sleep_unit.sv \
	../rtl/cv32e40p_core.sv \
	./cv32e40p_clock_gate.sv \
	../rtl/cv32e40p_top.sv \
    > ./synth_outputs/cv32e40p_flattened.v

# Yosys for synthesis to skywater130
echo "Running Yosys Synthesis (SkyWater 130nm)..."
yosys -s ./synthesize_cv32e40p_sky130.ys

# 4. OpenSTA for static timing analysis
echo "Running OpenSTA Timing Analysis..."
sta ./grade_timing.sta

echo "PPA Pipeline Complete! Metrics are available in the ./metrics/ directory."
