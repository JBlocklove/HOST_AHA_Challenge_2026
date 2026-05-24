#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e 

echo "Starting automated PPA analysis for AES Core..."

# Create output directories
mkdir -p ./metrics
mkdir -p ./synth_outputs

# Yosys for synthesis to skywater130
echo "Running Yosys Synthesis (SkyWater 130nm)..."
yosys -s ./synthesize_aes_sky130.ys

# OpenSTA for static timing analysis
echo "Running OpenSTA Timing Analysis..."
sta ./grade_timing.sta

echo "PPA Pipeline Complete! Metrics are available in the ./metrics/ directory."
