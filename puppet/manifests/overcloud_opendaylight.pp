# Copyright 2015 Red Hat, Inc.
# All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.

include ::tripleo::packages

if count(hiera('ntp::servers')) > 0 {
  include ::ntp
}

class {"opendaylight":
  extra_features => any2array(hiera('opendaylight_features', 'odl-ovsdb-openstack')),
  odl_rest_port  => hiera('opendaylight_port'),
  enable_l3      => hiera('opendaylight_enable_l3', 'no'),
}

