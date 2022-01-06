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

load("@rules_pkg//:pkg.bzl", "pkg_tar")

load("//flows:flows.bzl", "flow_to_step", "run_flow")
load("//flows/place_and_route:build_defs.bzl", "openroad_step", "read_libraries_step")

openroad_step(
    name = "hello_openroad",
    script = "hello.tcl",
    outputs = ["hello"],
)

openroad_step(
    name = "goodbye_openroad",
    script = "goodbye.tcl",
    inputs = ["hello"],
    outputs = ["goodbye"],
)

run_flow(
    name = "hello_goodbye",
    flow = ["hello_openroad", "goodbye_openroad"],
    output_names = ["goodbye"],
    output_files = ["goodbye.txt"],
)

flow_to_step(
    name = "hello_goodbye_bin",
    flow = ["hello_openroad", "goodbye_openroad"],
)

read_libraries_step(
    name = "read_sky130_step",
    standard_cells = "@com_google_skywater_pdk_sky130_fd_sc_hd//:sky130_fd_sc_hd",
)

run_flow(
    name = "read_sky130",
    flow = ["read_sky130_step"],
    output_names = ["db"],
    output_files = ["read_sky130.db"],
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
