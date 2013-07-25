# This file is auto-generated from recommender.idl
# *** DO NOT EDIT ***

package Jubatus::Recommender::Client;

use strict;
use warnings;
use utf8;
use autodie;
use AnyEvent::MPRPC;

use Jubatus::Recommender::Types;

sub new {
  my ($class, $host, $port) = @_;
  my $client = AnyEvent::MPRPC::Client->new(
    'host' => $host,
    'port' => $port,
  );
  my %hash = ('client' => $client);
  bless \%hash, $class;
}

sub get_client {
  my ($self) = @_;
  return $self->{client};
}

sub get_config {
  my ($self, $name) = @_;
  my $retval = $self->{client}->call('get_config' => [ $name ] )->recv;
  return $retval;
}

sub clear_row {
  my ($self, $name, $id) = @_;
  my $retval = $self->{client}->call('clear_row' => [ $name, $id ] )->recv;
  return $retval;
}

sub update_row {
  my ($self, $name, $id, $row) = @_;
  my $retval = $self->{client}->call('update_row' => [ $name, $id,
       $row->to_msgpack() ] )->recv;
  return $retval;
}

sub clear {
  my ($self, $name) = @_;
  my $retval = $self->{client}->call('clear' => [ $name ] )->recv;
  return $retval;
}

sub complete_row_from_id {
  my ($self, $name, $id) = @_;
  my $retval = $self->{client}->call('complete_row_from_id' => [ $name,
       $id ] )->recv;
  return Jubatus::Recommender::Datum->from_msgpack($retval);
}

sub complete_row_from_datum {
  my ($self, $name, $row) = @_;
  my $retval = $self->{client}->call('complete_row_from_datum' => [ $name,
       $row->to_msgpack() ] )->recv;
  return Jubatus::Recommender::Datum->from_msgpack($retval);
}

sub similar_row_from_id {
  my ($self, $name, $id, $size) = @_;
  my $retval = $self->{client}->call('similar_row_from_id' => [ $name, $id,
       $size ] )->recv;
  return Jubatus::Recommender::SimilarResult->from_msgpack($retval);
}

sub similar_row_from_datum {
  my ($self, $name, $row, $size) = @_;
  my $retval = $self->{client}->call('similar_row_from_datum' => [ $name,
       $row->to_msgpack(), $size ] )->recv;
  return Jubatus::Recommender::SimilarResult->from_msgpack($retval);
}

sub decode_row {
  my ($self, $name, $id) = @_;
  my $retval = $self->{client}->call('decode_row' => [ $name, $id ] )->recv;
  return Jubatus::Recommender::Datum->from_msgpack($retval);
}

sub get_all_rows {
  my ($self, $name) = @_;
  my $retval = $self->{client}->call('get_all_rows' => [ $name ] )->recv;
  return [ map { $_} @{ $retval } ];
}

sub calc_similarity {
  my ($self, $name, $lhs, $rhs) = @_;
  my $retval = $self->{client}->call('calc_similarity' => [ $name,
       $lhs->to_msgpack(), $rhs->to_msgpack() ] )->recv;
  return $retval;
}

sub calc_l2norm {
  my ($self, $name, $row) = @_;
  my $retval = $self->{client}->call('calc_l2norm' => [ $name, $row->to_msgpack(
      ) ] )->recv;
  return $retval;
}

sub save {
  my ($self, $name, $id) = @_;
  my $retval = $self->{client}->call('save' => [ $name, $id ] )->recv;
  return $retval;
}

sub load {
  my ($self, $name, $id) = @_;
  my $retval = $self->{client}->call('load' => [ $name, $id ] )->recv;
  return $retval;
}

sub get_status {
  my ($self, $name) = @_;
  my $retval = $self->{client}->call('get_status' => [ $name ] )->recv;
  return $retval;
}

1;

__END__

=encoding utf-8

=head1 NAME

Jubatus::Recommender::Client - Perl extension for interfacing with recommendation server 'jubarecommender'

=head1 SYNOPSIS

    use Jubatus;

    my $cluster_name = "jubatus_perl_doc";
    # even if it isn't in a distributed environment using ZooKeeper and Jubatus keepers.

    my $host_name_or_ip_address = "localhost"; # master node's
    my $port_number_of_juba_process = 13714; # meanless

    my $juba_client_type = "recommender";
    # you can select from (recommender|regression|clasifier|stat|graph|anomaly)

    my $reco_client = Jubatus->get_client($host_name_or_ip_address, $port_number_of_juba_process, $juba_client_type);
    # got Jubatus::Recommender::Client object

    # In the following example, get maximum value from sample array using Jubatus::Recommender::Client object

    my $is_clear = $reco_client->clear($name);

    {
        my $row_id = "red";
        my $string_values = [["name", "red"], ["image", "warm"],];
        my $num_values = [["R", 255.0], ["G", 0.0], ["B", 0.0]];
        my $datum = Jubatus::Recommender::Datum->new($string_values, $num_values);
        my $is_update = $reco_client->update_row($name, $row_id, $datum);
    }
    {
        my $row_id = "blue";
        my $string_values = [["name", "blue"], ["image", "cold"],];
        my $num_values = [["R", 0.0], ["G", 0.0], ["B", 255.0]];
        my $datum = Jubatus::Recommender::Datum->new($string_values, $num_values);
        my $is_update = $reco_client->update_row($name, $row_id, $datum);
    }
    {
        my $row_id = "cyan";
        my $string_values = [["name", "cyan"], ["image", "cold"],];
        my $num_values = [["R", 0.0], ["G", 255.0], ["B", 255.0]];
        my $datum = Jubatus::Recommender::Datum->new($string_values, $num_values);
        my $is_update = $reco_client->update_row($name, $row_id, $datum);
    }
    {
        my $row_id = "magenta";
        my $string_values = [["name", "magenta"], ["image", "warm"],];
        my $num_values = [["R", 255.0], ["G", 0.0], ["B", 255.0]];
        my $datum = Jubatus::Recommender::Datum->new($string_values, $num_values);
        my $is_update = $reco_client->update_row($name, $row_id, $datum);
    }
    {
        my $row_id = "yellow";
        my $string_values = [["name", "yellow"], ["image", "warm"],];
        my $num_values = [["R", 255.0], ["G", 255.0], ["B", 0.0]];
        my $datum = Jubatus::Recommender::Datum->new($string_values, $num_values);
        my $is_update = $reco_client->update_row($name, $row_id, $datum);
    }
    {
        my $row_id = "green";
        my $string_values = [["name", "green"], ["image", "cold"],];
        my $num_values = [["R", 0.0], ["G", 255.0], ["B", 0.0]];
        my $datum = Jubatus::Recommender::Datum->new($string_values, $num_values);

        my $max_result_num = 10;
        my $similar_row = $reco_client->similar_row_from_datum($name, $datum, $max_result_num);
        # return cyan, yellow, blue

        my $is_update = $reco_client->update_row($name, $row_id, $datum);
    }
    {
        my $similar_row = $reco_client->similar_row_from_id($name, "green", $max_result_num);
        # return green, cyan, yellow, blue
    }

=head1 DESCRIPTION

This module provide a interface of recommendation server 'jubarecommender' by TCP-based MessagePack RPC protocol using L<AnyEvent::MPRPC::Client>

=head1 METHODS

Jubatus::Recommender::Client provide many methods.

=head2 Constructors

This constructors can die when invalid parameters are given.

=head3 Jubatus::Recommender::Client->new($name, $port);

This code will create Jubatus::Recommender::Client object and return it.
You should set $host and $port in agreement to running jubastat server apprication.

    use Jubatus::Recommender::Client;
    my $host = 'localhost';
    my $port = '13714';
    my $obj = Jubatus::Recommender::Client->new($host, $port);

The above code is equivalent to:

    use Jubatus;
    my $host = 'localhost';
    my $port = '13714';
    my $juba_client_type = 'recommender';
    my $reco_client = Jubatus->get_client($host, $port, $juba_client_type);

See L<Jubatus> for more detail.

=head1 FUNCTIONS

=head1 SEE ALSO

L<http://jubat.us/>
L<https://github.com/jubatus>

L<AnyEvent::MPRPC>
L<AnyEvent::MPRPC::Client>
L<http://msgpack.org/>
L<http://wiki.msgpack.org/display/MSGPACK/RPC+specification>

L<https://github.com/overlast/p5-Jubatus>

=head1 LICENSE

Copyright (C) 2013 by Toshinori Sato (@overlast).

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

The licence of Jubatus is LGPL 2.1.

    Jubatus: Online machine learning framework for distributed environment
    Copyright (C) 2011,2012 Preferred Infrastructure and Nippon Telegraph and Telephone Corporation.

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License version 2.1 as published by the Free Software Foundation.

However Jubatus.pm and Jubatus::*.pm is the pure Perl modules.
Therefor the licence of Jubatus.pm and Jubatus::*.pm is the Perl's licence.

=head1 AUTHOR

Toshinori Sato (@overlast) E<lt>overlasting@gmail.comE<gt>

=cut

