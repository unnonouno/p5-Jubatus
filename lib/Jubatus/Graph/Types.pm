# This file is auto-generated from graph.idl
# *** DO NOT EDIT ***


package Jubatus::Graph::Node;

use strict;
use warnings;
use utf8;
use autodie;
use AnyEvent::MPRPC;

sub new {
  my ($self, $property, $in_edges, $out_edges) = @_;
  my %hash = (
    'property' => $property,
    'in_edges' => $in_edges,
    'out_edges' => $out_edges,
  );
  bless \%hash, $self;
}

sub to_msgpack {
  my ($self) = @_;
  return [ 
        $self->{property},
        $self->{in_edges},
        $self->{out_edges},
   ];
}

sub from_msgpack {
  my ($self, $arg) = @_;
  my $node = Jubatus::Graph::Node->new($arg->[0], [ map { $_} @{ $arg->[1] } ],
       [ map { $_} @{ $arg->[2] } ]);
  return $node;
}

1;

package Jubatus::Graph::PresetQuery;

use strict;
use warnings;
use utf8;
use autodie;
use AnyEvent::MPRPC;

sub new {
  my ($self, $edge_query, $node_query) = @_;
  my %hash = (
    'edge_query' => $edge_query,
    'node_query' => $node_query,
  );
  bless \%hash, $self;
}

sub to_msgpack {
  my ($self) = @_;
  return [ 
        $self->{edge_query},
        $self->{node_query},
   ];
}

sub from_msgpack {
  my ($self, $arg) = @_;
  my $preset_query = Jubatus::Graph::PresetQuery->new([ map {  [ $_->[0],
       $_->[1] ] } @{ $arg->[0] } ], [ map {  [ $_->[0],
       $_->[1] ] } @{ $arg->[1] } ]);
  return $preset_query;
}

1;

package Jubatus::Graph::Edge;

use strict;
use warnings;
use utf8;
use autodie;
use AnyEvent::MPRPC;

sub new {
  my ($self, $property, $source, $target) = @_;
  my %hash = (
    'property' => $property,
    'source' => $source,
    'target' => $target,
  );
  bless \%hash, $self;
}

sub to_msgpack {
  my ($self) = @_;
  return [ 
        $self->{property},
        $self->{source},
        $self->{target},
   ];
}

sub from_msgpack {
  my ($self, $arg) = @_;
  my $edge = Jubatus::Graph::Edge->new($arg->[0], $arg->[1], $arg->[2]);
  return $edge;
}

1;

package Jubatus::Graph::ShortestPathQuery;

use strict;
use warnings;
use utf8;
use autodie;
use AnyEvent::MPRPC;

sub new {
  my ($self, $source, $target, $max_hop, $query) = @_;
  my %hash = (
    'source' => $source,
    'target' => $target,
    'max_hop' => $max_hop,
    'query' => $query,
  );
  bless \%hash, $self;
}

sub to_msgpack {
  my ($self) = @_;
  return [ 
        $self->{source},
        $self->{target},
        $self->{max_hop},
        $self->{query}->to_msgpack(),
   ];
}

sub from_msgpack {
  my ($self, $arg) = @_;
  my $shortest_path_query = Jubatus::Graph::ShortestPathQuery->new($arg->[0],
       $arg->[1], $arg->[2], Jubatus::Graph::PresetQuery->from_msgpack(
      $arg->[3]));
  return $shortest_path_query;
}

1;

package Jubatus::Graph::Types;

use strict;
use warnings;
use utf8;
use autodie;
use AnyEvent::MPRPC;

1;

__END__

=pod

=encoding utf-8

=head1 NAME

Jubatus::Graph::Types - Perl extension for treating a data structure
to use interface of graph mining server 'jubagraph'

=head1 SYNOPSIS

    use Jubatus::Graph::Types;

    # If you want to any Jubatus::Graph::* packages,
    # all one need to do is write "use Jubatus::Graph::Types;"

=head1 DESCRIPTION

This module provide the constructors and the methods to use interface of
recommendation server 'jubagraph'.

=head1 METHODS

Jubatus::Graph::Types will provide many packages and constructors, methods.
These are used in Jubatus::Graph::Clients.

See L<Jubatus::Graph::Client> for more detail.

=head2 Packages

=head3 Jubatus::Graph::Datum

If you want to use this package, all one need to do is write "use Jubatus::Graph::Types;"

=head4 Constructors

=head4 Jubatus::Graph::Datum->new($string_values, $num_values);

Input:

    - $string_values is a array reference which are allowed to locate many array
      references. Each of located arrry references should have two string
      value which are called "key" and "value".

    - $num_values is a array reference which are allowed to locate many array
      references. Each of located arrry references should have two values.
      First string value which are called "key" and second float value which
      are called "value".

Output:

    - Jubatus::Graph::Datum object.

      This object have two fields.
      'string_values' field locate the array reference which was inputed as
      $string_values in constructor.
      'num_values' field locate the array reference which was inputed as
      $num_values in constructor.

=head4 Functions

=head4 to_msgpack->()

Input:

    - None

Output:

    - A array reference

      This array reference locate $string_values and $num_values which are given
      in constructor.

      This array reference certainly locate two array references. First
      reference are allowed to locate many array references. Each of located
      arrry references should have two string value which are called "key"
      and "value". Second reference are allowed to locate many array references.
      Each of located arrry references should have two values. First string
      value which are called "key" and second float value which are called
      "value".

=head4 from_msgpack->($return_value_from_msgpack)

Input:

    - $return_value_from_msgpack is a array reference.

      This array reference certainly locate two array references. First
      reference are allowed to locate many array references. Each of located
      arrry references should have two string value which are called "key"
      and "value". Second reference are allowed to locate many array references.
      Each of located arrry references should have two values. First string
      value which are called "key" and second float value which are called
      "value".

Output:

    - Jubatus::Graph::Datum object.

=head3 Jubatus::Graph::Node

If you want to use this package, all one need to do is write "use Jubatus::Graph::Types;"

=head4 Constructors

=head4 Jubatus::Graph::Node->new($property, $in_edges, $out_edges);

Input:
    - $property is a hash reference which are allowed to contain many
      "key-value" pairs. This property hash reference is used in a query
      match process of get_shotest_path() and get_centrality().

      In the query match process, $property needs to contain all key-value pair
      of a search query.

      $property is allowed to Nothing be included. You can use {};

    - $in_edges is a array reference of the ids of the incoming edge.
      Each ids are id of edge which can get when you create the edge.
      Therefore you should record the all of ids of edges when you create.

    - $out_edges is a array reference of the ids of the incoming edge.
      Each ids are id of edge which can get when you create the edge.
      Therefore you should record the all of ids of edges when you create.

Output:

    - Jubatus::Graph::Node object.

      This object have three fields.
      'property' field locate the hash reference which was inputed as
      $property in constructor.
      'in_edges' field locate the array reference which was inputed as
      $in_edges in constructor.
      'out_edges' field locate the array reference which was inputed as
      $out_edges in constructor.

=head4 Functions

=head4 from_msgpack->($return_value_from_msgpack)

Input:

    - $return_value_from_msgpack is three reference.

      First reference is locate the hash reference which may be include some
      "key-value" pairs which are used as a "property" in a query match
      process.

      Second reference is locate the array reference which maybe include some
      ids of edges which are  "incomming edge ids".

      Third reference is locate the array reference which maybe include some
      ids of edges which are "outgoing edge ids".

Output:

    - Jubatus::Graph::Node object.

=head4 to_msgpack->()

Input:

    - None

Output:

    - A array reference

      This array reference locate $property and $in_edges, $out_edges which
      are given in constructor.

=head3 Jubatus::Graph::PresetQuery;

If you want to use this package, all one need to do is write "use Jubatus::Graph::Types;"

=head4 Constructors

=head4 Jubatus::Graph::PresetQuery->new($edge_query, $node_query);

Input:

    - $edge_query is a array reference which are allowed to locate many array
      references. Each of located arrry references should have two string
      value which are called "key" and "value". These pairs are used in a query
      match process of get_shotest_path() and get_centrality(). If you set
      $edge_query, you can get a result include the edges which have a property
      field which includes all key-value pairs of $edge_query.

    - $node_query is a array reference which are allowed to locate many array
      references. Each of located arrry references should have two string
      value which are called "key" and "value". These pairs are used in a query
      match process of get_shotest_path() and get_centrality(). If you set
      $node_query, you can get a result include the nodes which have a property
      field which includes all key-value pairs of $node_query.

Output:

    - Jubatus::Graph::PresetQuery object.

      This object have two fields.
      'edge_query' field locate the array reference which was inputed as
      $edge_query in constructor.
      'node_query' field locate the array reference which was inputed as
      $node_query in constructor.

=head4 Functions

=head4 from_msgpack->($return_value_from_msgpack)

Input:

    - $return_value_from_msgpack is a array reference.

      This array reference certainly locate two array reference. Each
      references are used to call constructor of Jubatus::Graph::PresetQuery.

Output:

    - Jubatus::Graph::PresetQuery object

=head4 to_msgpack->()

Input:

    - None

Output:

    - A araay reference

      This array reference locate $edge_query and $node_query which are given
      in constructor.

=head3 Jubatus::Graph::Edge;

If you want to use this package, all one need to do is write "use Jubatus::Graph::Types;"

=head4 Constructors

=head4 Jubatus::Graph::Edge->new($property, $source, $target);

Input:

    - $property is a hash reference which are allowed to contain many
      "key-value" pairs. This property hash reference is used in a query
      match process of get_shotest_path() and get_centrality().

      In the query match process, $property needs to contain all key-value pair
      of a search query.

      $property is allowed to Nothing be included. You can use {};

    - $source is a id of node to create out going edge. When you create the node,
      you can receive the node id. Therefore you should record the all of ids of
      the node when you create.

    - $target is a id of node to create in coming edge. When you create the node,
      you can receive the node id. Therefore you should record the all of ids of
      the node when you create.

Output:

    - Jubatus::Graph::Edge object.

      This object have three fields.
      'property' field locate the hash reference which was inputed as $property
       in constructor.
      'source' field locate the array reference which was inputed as $source in
      constructor.
      'target' field locate the array reference which was inputed as $target in
      constructor.

=head4 Functions

=head4 from_msgpack->($return_value_from_msgpack)

Input:

    - $return_value_from_msgpack is a array reference.

      First reference is locate the hash reference which may be include some
      "key-value" pairs which are used as a "property" in a query match
      process.

      Second reference is locate the string value which is id of a node which
      have outgoing edge.

      Third reference is locate the string value which is id of a node which
      have outgoing edge.

Output:

    - Jubatus::Graph::Edge object.

=head4 to_msgpack->()

Input:

    - None

Output:

    - A array reference

      This array reference locate $property and $source, $target which are
      given in constructor.

=head3 Jubatus::Graph::ShortestPathQuery;

If you want to use this package, all one need to do is write "use Jubatus::Graph::Types;"

=head4 Constructors

=head4 Jubatus::Graph::ShortestPathQuery->new($source, $target, $max_hop, $query);

Input:

    - $source is string value of a id of node which is a start point of the
      shortest path which you want.

    - $target is string value of a id of node which is a end point of the
      shortest path which you want.

    - $max_hop is int value of the max number of the nodes. This number
      restrains result of mining by jubagraph.

    - $query is reference of Jubatus::Graph::PresetQuery object.

Output:

    - Jubatus::Graph::ShortestPathQuery object.

      This object have four fields.

      'source' field locate the string value of a id of node which was inputed
      as $source in the constructor.

      'target' field locate the string value of a id of node which was inputed
      as $target in the constructor.

      'max_hop' field locate the int value of a id of node which was inputed
      as $max_hop in the constructor.

      'query' field locate the Jubatus::Graph::PresetQuery object which was
      inputed as $query in the constructor.

=head4 Functions

=head4 from_msgpack->($return_value_from_msgpack)

Input:

    - $return_value_from_msgpack is a array reference.

      First reference is locate the string value which is id of a node which
      is a start point node.

      Second reference is locate the string value which is id of a node which
      is a end point node.

      Third reference is locate int value which is max number of nodes. This
      number restrains result of mining by jubagraph.

Output:

    - Jubatus::Graph::ShortestPathQuery object.

=head4 to_msgpack->()

Input:

    - None

Output:

    - A array reference

      This array reference locate $source and $target, $max_hop, $query which
      are given in constructor.

=head1 SEE ALSO

L<Jubatus::Graph::Client>

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

