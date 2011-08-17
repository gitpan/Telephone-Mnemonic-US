=head1 NAME

Telephone::Mnemonic::US::Words - Maps US telephone numbers from mnemonic 'easy-to-remember' words to digits, it
can also attempts the reverse and maps telephone digits to mnemonic words.

=cut

package Telephone::Mnemonic::US::Words;

#use 5.012001;
use strict;
use warnings;
use Data::Dumper;
use Tie::DictFile;
use Moose::Role;
use strict;
use warnings;
#use Telephone::Mnemonic::US::Math qw/ str_pairs dict_path find_valids /;
#use Telephone::Mnemonic::US::Number qw/ to_tel_digits to_digits beautify/;
#use Scalar::Util 'looks_like_number';
#use List::Util qw/ first /;

use 5.010000;
our $VERSION = '0.01';


=pod

=head2 to_num
 Translates a mnemonic tel number to digits
 Input: an alphanumeric sting, like '(g03) verison'
 Output: a string like, like '(703) 232 3333'
=cut

1;

=pod

=head1 SYNOPSIS

 use Telephone::Mnemonic::US::Words;
	with 'Telephone::Mnemonc::US::Words";

=head1 DESCRIPTION

=head2 Role Words


=head2 EXPORT

None by default.


=head1 SEE ALSO

L<Tie::Dict>

=head1 AUTHOR

Ioannis Tambouras E<lt>ioannis@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2011 by Ioannis Tambouras

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.12.1 or,
at your option, any later version of Perl 5 you may have available.


=cut
