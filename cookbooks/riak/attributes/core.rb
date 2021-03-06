#
# Authors:: Benjamin Black (<b@b3k.us>) and Sean Cribbs (<sean@basho.com>)
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

default.riak.core.cluster_name = "default"
default.riak.core.http = [["127.0.0.1",8098]]
default.riak.core.ring_state_dir = "/var/lib/riak/ring"
if node[:riak][:package][:type].eql?("source")
	default.riak.core.ring_state_dir = "data/ring"
end

default.riak.core.handoff_port = 8099
