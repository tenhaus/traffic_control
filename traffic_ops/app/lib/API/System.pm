package API::System;
#
# Copyright 2015 Comcast Cable Communications Management, LLC
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
#
#
use Mojo::Base 'Mojolicious::Controller';

sub get_info {
	my $self = shift;
	my $data_obj;
	my $rs_data = $self->db->resultset("Parameter")->search( { config_file => 'global' } );
	while ( my $row = $rs_data->next ) {
		$data_obj->{'parameters'}->{$row->name} = $row->value;
	}
	$self->success($data_obj);
}
1;