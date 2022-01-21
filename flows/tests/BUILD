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

load("@bazel_skylib//rules:build_test.bzl", "build_test")
load("@bazel_skylib//rules:diff_test.bzl", "diff_test")
load("//flows:flows.bzl", "flow_to_step", "run_flow")
load("//flows/place_and_route:build_defs.bzl", "openroad_step")

run_flow(
    name = "sky130_synth_only",
    constants = {
        "clock_period_ps": "10000",  # 100 MHz target
        "top": "adder_reg",
    },
    flow = ["//flows/synthesis:synth_sky130"],
    input_files = ["adder_reg.v"],
    input_names = ["rtl"],
    output_files = ["sky130_adder_test.v"],
    output_names = ["netlist"],
)

run_flow(
    name = "sky130_combined_flow",
    constants = {
        "clock_period_ps": "10000",  # 100 MHz target
        "top": "adder_reg",
    },
    flow = [
        "//flows/synthesis:synth_sky130",
        "//flows/place_and_route:read_sky130_step",
        "//flows/place_and_route:read_design",
    ],
    input_files = ["adder_reg.v"],
    input_names = ["rtl"],
    output_files = ["combined_adder.db"],
    output_names = ["db"],
)

build_test(
    name = "sky130_flows",
    targets = [
        ":sky130_synth_only",
        ":sky130_combined_flow",
    ],
)

openroad_step(
    name = "hello_openroad",
    constants = ["name"],
    outputs = ["hello"],
    script = "hello.tcl",
)

openroad_step(
    name = "goodbye_openroad",
    inputs = ["hello"],
    outputs = ["goodbye"],
    script = "goodbye.tcl",
)

run_flow(
    name = "hello_goodbye",
    constants = {
        "name": "TestName",
    },
    flow = [
        "hello_openroad",
        "goodbye_openroad",
    ],
    output_files = ["goodbye.txt"],
    output_names = ["goodbye"],
)

diff_test(
    name = "openroad_step_smoke",
    file1 = "goodbye.txt",
    file2 = "goodbye.txt.golden",
)

flow_to_step(
    name = "hello_goodbye_bin",
    flow = [
        "hello_openroad",
        "goodbye_openroad",
    ],
)
