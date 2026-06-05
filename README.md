#Event-driven neuromorphic accelerator architecture implemented in synthesizable Verilog for FPGA prototyping and ASIC-oriented research.

## Overview

This repository presents a synthesizable RTL implementation of an event-driven Spiking Neural Network (SNN) accelerator based on the Leaky Integrate-and-Fire (LIF) neuron model.

The architecture is developed using Verilog-2001 and is intended for FPGA prototyping on AMD Zynq UltraScale+ devices while maintaining compatibility with future ASIC implementation flows.

The project serves as a foundational neuromorphic computing platform for exploring event-driven processing, spike-based communication, memory-efficient neural architectures, and hardware acceleration techniques for next-generation artificial intelligence systems.

---

## Key Features

* Pure Verilog-2001 RTL implementation
* Event-driven neuromorphic architecture
* Leaky Integrate-and-Fire (LIF) neuron model
* Synthesizable FPGA design
* Modular and scalable architecture
* ASIC-oriented design methodology
* Simulation-ready verification environment

---

## System Architecture

The accelerator follows an event-driven processing pipeline:

Input Spike Events
→ Event Scheduler
→ Weight Memory
→ LIF Compute Engine
→ Neuron State Memory
→ Spike Router
→ Output Spike Events

The architecture minimizes unnecessary computations by activating processing elements only when spike events are present, enabling efficient hardware utilization and reduced switching activity.

---

## RTL Module Hierarchy

rtl/
├── lif_compute.v
├── neuron_state_ram.v
├── event_fifo.v
├── scheduler.v
├── spike_router.v
├── weight_memory.v
├── snn_core.v
└── snn_top.v

---

## Design Objectives

* Develop a reusable neuromorphic hardware framework
* Investigate event-driven neural processing architectures
* Evaluate FPGA implementation efficiency
* Enable seamless migration toward ASIC implementation
* Support future extensions including on-chip learning and sparse connectivity

---

## Target Platform

Primary FPGA Target:

AMD Zynq UltraScale+

Future ASIC Flow Compatibility:

* RTL Synthesis
* Static Timing Analysis
* Physical Design
* Clock Tree Synthesis
* Place and Route
* Signoff Verification

---

## Verification

The repository includes simulation infrastructure for validating neuron functionality and spike propagation behavior.

Simulation outputs can be inspected using standard waveform viewers and RTL simulation tools.

---

## Future Enhancements

Planned research extensions include:

* Multi-neuron parallel processing
* Sparse spike routing networks
* Synaptic plasticity (STDP)
* Quantized neuromorphic computation
* Hierarchical memory architectures
* High-throughput event schedulers
* FPGA-to-ASIC implementation flow

---

## Research Relevance

This project provides a baseline neuromorphic accelerator framework suitable for:

* FPGA-based neuromorphic computing research
* Hardware accelerator development
* Digital VLSI design exploration
* ASIC prototyping studies
* Academic and industrial research projects

---

## Author

Nandini Kendre

Senior Research Fellow – C2S Program (MeitY)
FPGA / ASIC Design Engineer
Neuromorphic Computing and Hardware Acceleration Research
