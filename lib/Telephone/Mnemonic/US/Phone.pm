=head1 NAME

Telephone::Mnemonic::Phone - US Telephone Object

=cut
package Telephone::Mnemonic::US::Phone;
use strict;
use warnings;
use 5.010000;
#use MooseX::FollowPBP;
use Data::Dumper;
#use Telephone::Mnemonic::US::Number qw/ area_code station_code house_code valid_formed_p beautify /;
use Telephone::Mnemonic::US::Number();
our $VERSION   = '0.04';

use Moose;
extends 'Telephone::Mnemonic::Phone';

use Moose::Util::TypeConstraints;
subtype 'Tel_Number_US'
	=> as 'Str'
	=> where {
		Telephone::Mnemonic::US::Number::well_formed_p($_);
};

coerce 'Tel_Number_US'
	=> from 'Str'
	=> via {
		Telephone::Mnemonic::US::Number::to_tel_digits($_) ;
};
			

has '+num'      => (is =>'rw' , 
					isa=>'Tel_Number_US', 
					required=>1, 
					lazy=>0, 
					coerce=>1, 
					#initializer=>'ini' 
);

sub to_word { };

sub ini { my ($self, $num) = @_ ; } 
has area_code =>(is=>'rw',lazy=>1,default=>sub{ Telephone::Mnemonic::US::Number::area_code(shift->num)}); 
has station_code =>(is=>'rw',lazy=>1,default=>sub{ Telephone::Mnemonic::US::Number::station_code(shift->num)}); 
has house_code =>(is=>'rw',lazy=>1,default=>sub{ Telephone::Mnemonic::US::Number::house_code(shift->num)}); 

sub without_area_code { Telephone::Mnemonic::US::Number::without_area_code(shift->num)}
sub pretty { Telephone::Mnemonic::US::Number::beautify(shift->num)}

no Moose;
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
