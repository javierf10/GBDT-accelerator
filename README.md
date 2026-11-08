# GBDT Tree Accelerator in VHDL

![VHDL](https://img.shields.io/badge/VHDL-00599C?style=for-the-badge&logo=vhdl&logoColor=white)

This repository contains the hardware implementation and design of an accelerator for Gradient Boosted Decision Trees (GBDT) in VHDL, developed for the **Embedded Systems Laboratory (LSE)** course.

---

## Project Overview

The system processes an $8 \times 16$-bit input vector and computes the output by sequentially executing a set of decision trees stored in an internal ROM memory.

### Key Features:
* **Input:** $8 \times 16$-bit vector.
* **Control:** Synchronization via `start` (begins processing) and `done` (indicates completion) signals.
* **Storage:** Internal $128 \times 16$-bit ROM memory initialized with tree node data[cite: 1].

---

## ROM Memory Format (Nodes)

The $16$-bit entries in the ROM use different structures depending on the node type[cite: 1]:

### Branch Nodes (bit 15 = `0` / comparison):
* **Bit 15:** Node type (`0` for branch node)[cite: 1].
* **Bits 14–12:** Index of the input feature to compare ($0$ to $7$)[cite: 1].
* **Bits 11–8:** Offset to the right child node[cite: 1].
* **Bits 7–0:** Reference value for comparison[cite: 1].

### Leaf Nodes (bit 15 = `1` / result):
* **Bit 15:** Node type (`1` for leaf node)[cite: 1].
* **Bits 14–12:** *Reserved / Unused*.
* **Bits 11–8:** Offset to the next tree (`1111` indicates the final node/tree to process)[cite: 1].
* **Bits 7–0:** Output value contributed by the current tree[cite: 1].

---

## Repository Structure

* `src/GBDT.vhd`: Top-level entity integrating the datapath and Control Unit (CU)[cite: 1].
* `src/memoriaROM_128x16.vhd`: Internal ROM pre-loaded with the evaluation trees[cite: 1].
* `src/reg.vhd`, `src/mux.vhd`, `src/mux2.vhd`, `src/adder8.vhd`, `src/adder16.vhd`: Auxiliary datapath components[cite: 1].
* `tb/gbdt_test.vhd`: Testbench for functional simulation and verification[cite: 1].

---

## Simulation and Verification

1. Compile the VHDL source files in **ModelSim / QuestaSim**:
   ```bash
   vlib work
   vcom src/*.vhd tb/gbdt_test.vhd

2. Run the simulation using the testbench:
   ```bash
   vsim work.gbdt_test
   ```
3. Test case included in ROM[cite: 1]:
   * **Entrada de prueba:** `X"A0B1C30E00F10200"`
   * **Salida esperada:** `"11100100"`
   
