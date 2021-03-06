#
# Author:: Benjamin Black (<b@b3k.us>) and Sean Cribbs (<sean@basho.com>)
# Cookbook Name:: riak
#
# Copyright (c) 2010 Basho Technologies, Inc.
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

if node.riak_search.kv.storage_backend == :riak_kv_innostore_backend
	default.riak_search.innostore.log_buffer_size = 8388608
	default.riak_search.innostore.log_files_in_group = 8
	default.riak_search.innostore.log_file_size = 268435456
	default.riak_search.innostore.flush_log_at_trx_commit = 1
	default.riak_search.innostore.data_home_dir = "/var/lib/riak/innodb"
	default.riak_search.innostore.log_group_home_dir = "/var/lib/riak/innodb"
	if node[:riak_search][:package][:type].eql?("source")
		default.riak_search.innostore.data_home_dir = "data/innodb"
		default.riak_search.innostore.log_group_home_dir = "data/innodb"  
	end
	default.riak_search.innostore.buffer_pool_size = 2147483648
	default.riak_search.innostore.flush_method = "O_DIRECT"
end
