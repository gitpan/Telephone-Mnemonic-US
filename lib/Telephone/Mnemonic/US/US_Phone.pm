=head1 NAME

Telephone::Mnemonic::Phone - US Telephone Object

=cut
package Telephone::Mnemonic::US::Phone;
use strict;
use warnings;
use 5.010000;
our @EXPORT_OK = qw( to_num to_words printthem);
our $VERSION   = '0.04';
use Data::Dumper;
use Telephone::Mnemonic::US::Number qw/ area_code station_code house_code beautify /;

use Moose;
use namespace::autoclean;
extends 'Telephone::Mnemonic::Phone';
#with 'pretty';

has 'area__code'    => (is=>'rw', default=>sub{ area_code(shift->num)});
has 'station__code' => (is=>'rw', default=>sub{ station_code(shift->num)});
has 'house__code'   => (is=>'rw', default=>sub{ station_code(shift->num)});


sub pretty { beautify(shift->num)}

no Moose;
no namespace::autoclean;
__PACKAGE__->meta->make_immutable;
1;
=pod

=head1 SYNOPSIS

 use Telephone::Mnemonic::US::Phone;
 
 $tel = new Telephone::Mnemonic::US::Phone num=>'703 111 2222';
 $tel1->area_code;          => '703'
 $tell->pretty;             => '(703) 111 2222'

=head1 DESCRIPTION

=head2  Implements a US telephone object


=head2 EXPORT

None by default.



=head1 SEE ALSO

L<Tie::Dict>

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

Ioannis Tambouras E<lt>ioannis@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2011 by Ioannis Tambouras

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.12.1 or,
at your option, any later version of Perl 5 you may have available.


=cut
