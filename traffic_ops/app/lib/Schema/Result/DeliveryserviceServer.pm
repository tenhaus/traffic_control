use utf8;
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
package Schema::Result::DeliveryserviceServer;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Schema::Result::DeliveryserviceServer

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<deliveryservice_server>

=cut

__PACKAGE__->table("deliveryservice_server");

=head1 ACCESSORS

=head2 deliveryservice

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 server

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 last_updated

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "deliveryservice",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "server",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "last_updated",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 1,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</deliveryservice>

=item * L</server>

=back

=cut

__PACKAGE__->set_primary_key("deliveryservice", "server");

=head1 RELATIONS

=head2 deliveryservice

Type: belongs_to

Related object: L<Schema::Result::Deliveryservice>

=cut

__PACKAGE__->belongs_to(
  "deliveryservice",
  "Schema::Result::Deliveryservice",
  { id => "deliveryservice" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 server

Type: belongs_to

Related object: L<Schema::Result::Server>

=cut

__PACKAGE__->belongs_to(
  "server",
  "Schema::Result::Server",
  { id => "server" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2014-01-02 16:19:05
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:oJbYZdWDUcj3SBXPxwmalQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;