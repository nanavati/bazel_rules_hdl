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

# TODO(amfv): Instead of having a separate reporting step, we should add a
# metrics input to all steps that take a db input (since that means OpenROAD has
# run in a previous step) and combine metrics JSON files across OpenROAD steps.
set input_db $::env(INPUT_DB)
read_db $input_db

utl::metric "instance_count" [sta::network_instance_count]
