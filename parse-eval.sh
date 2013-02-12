#! /bin/sh
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.  You may obtain
# a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
# License for the specific language governing permissions and limitations
# under the License.
#
# Parses a section of treebank and evaluates the parser output using evalb
#
# Should be called with the treebank source files as an argument

second-stage/programs/prepare-data/ptb -c $* | parse.sh -K > parse-trees.tmp
second-stage/programs/prepare-data/ptb -e $* > gold-trees.tmp
evalb/evalb -p evalb/new.prm gold-trees.tmp parse-trees.tmp
rm parse-trees.tmp gold-trees.tmp
