# Copyright 2021 Google LLC
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

# Place and Route tool package.

package(default_visibility = ["//flows:__subpackages__"])

load("@rules_pkg//:pkg.bzl", "pkg_tar")
load("//flows:flows.bzl", "flow_to_step", "run_flow")
load("//flows/place_and_route:build_defs.bzl", "openroad_step", "read_libraries_step")

read_libraries_step(
    name = "read_sky130_step",
    standard_cells = "@com_google_skywater_pdk_sky130_fd_sc_hd//:sky130_fd_sc_hd",
)

run_flow(
    name = "read_sky130",
    flow = ["read_sky130_step"],
    output_files = ["read_sky130.db"],
    output_names = ["db"],
)

flow_to_step(
    name = "read_sky130_bin",
    flow = ["read_sky130_step"],
)

pkg_tar(
    name = "read_sky130_pkg",
    srcs = [":read_sky130_bin"],
    include_runfiles = True,
    strip_prefix = "./",
)

openroad_step(
    name = "read_design",
    constants = ["top"],
    inputs = [
        "db",
        "netlist",
    ],
    outputs = ["db"],
    script = "read_design.tcl",
)

openroad_step(
    name = "create_simple_clock",
    constants = [
        "clock_port",
        "clock_period_ps",
    ],
    inputs = ["db"],
    outputs = ["db"],
    script = "create_simple_clock.tcl",
)
