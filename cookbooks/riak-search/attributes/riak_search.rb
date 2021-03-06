#
# Author:: Taliesin Sisson (<taliesins@yahoo.com>)
# Cookbook Name:: riaksearch
#
# Copyright (c) 2011 Talifun Ltd.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default.riak_search.riak_search.search_backend = :merge_index_backend
default.riak_search.riak_search.java_home = "/usr"
default.riak_search.riak_search.max_search_results = 100000