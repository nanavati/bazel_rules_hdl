# Copyright 2022 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Modular hardware flow tests

load("//flows:flows.bzl", "flow_to_step", "run_flow")

run_flow(
    name = "synth_sky130_test",
    constants = {"top": "adder"},
    flow = ["//flows/synthesis:synth_sky130"],
    input_files = ["verilog_adder.v"],
    input_names = ["rtl"],
    output_files = ["sky130_adder_test.v"],
    output_names = ["netlist"],
)
