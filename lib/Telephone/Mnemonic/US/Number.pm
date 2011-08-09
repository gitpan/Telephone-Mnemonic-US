package Telephone::Mnemonic::US::Number;

use 5.010000;
use strict;
use warnings;
use Data::Dumper;
#use Scalar::Util 'looks_like_number';
use Number::Phone::US qw/ is_valid_number /;
#use List::Util qw/ first /;

use base 'Exporter';

our @EXPORT_OK = qw( 
	well_formed_p 
	to_tel_digits
	to_digits
	area_code
	station_code
	house_code
	without_area_code
	beautify
	partial_codes
);

our $VERSION = '0.01';

sub partial_codes {
	my $num = shift;
	return unless well_formed_p($num);
	{ area_code=> area_code($num)||'', 
	  station_code=> station_code($num)||'', 
      house_code=> house_code($num)||'' 
    };
}
sub area_code {
	my $num = shift;
	return unless well_formed_p($num);
	$num = _filter_numbers($num);
	($num =~ s/^ (\d{3}) (\d{7}) $/$1/ox )  ? $num : undef
}
sub station_code {
	my $num = shift;
	$num = without_area_code($num) || return;
	($num =~ s/ (\d{3}) (\d{4}) $/$1/ox )  ? $num : undef
}
sub house_code {
	my $num = shift;
	$num = without_area_code($num) || return;
	($num =~ s/.*(\d{4}) $/$1/ox )  ? $num : undef
}
sub without_area_code {
	my $num = shift;
	return unless well_formed_p($num);
	$num = _filter_numbers($num);
	$num =~ s/^ (\d{3}) (\d{7}) $/$2/ox  ;
	$num =~ s/^ (\d{3}) (\d{7}) $/$2/ox  ;
	$num;
}
sub well_formed_p { 
	&Number::Phone::US::is_valid_number
}
sub _filter_numbers {
	my $num = shift;
    my @nums = $num =~ /(\d+)/g ;	
	join '',@nums;
}
sub to_digits {
	my $alphanum = lc shift;
	my $res;
      for (split //, $alphanum ) {
        given ( $_) {
            when (/[abc]/)   { $res .= '2'}
            when (/[def]/)   { $res .= '3'}
            when (/[ghi]/)   { $res .= '4'}
            when (/[jkl]/)   { $res .= '5'}
            when (/[mno]/)   { $res .= '6'}
            when (/[pqrs]/)  { $res .= '7'}
            when (/[tuv]/)   { $res .= '8'}
            when (/[wxyz]/)  { $res .= '9'}
            when (/[0-9]/)   { $res .= $_ }
		    #default: warn qq(to_digits: "$_"should not happen\n);
        }   
      }   
	  $res;
}
sub to_tel_digits {
	my $alphanum = lc shift;
	my $res = to_digits( $alphanum );
	well_formed_p($res) ? $res : undef;
}
sub beautify {
	my $digits = to_digits(shift) || return;
	return unless  well_formed_p($digits); 
	$digits =~ s/(?<=\d) (\d{4}) $/ $1/xo ;
    $digits =~ s/^ (\d{3}) \s* (\d{3}) (?!\d) /\($1\) $2/xo;
    $digits;
}
1;
__END__

=head1 NAME

Telephone::Mnemonic::US::Number - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Telephone::Mnemonic::US::Number;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Telephone::Mnemonic::US::Number, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

ioannis, E<lt>ioannis@248.218.218.dial1.washington2.level3.netE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2011 by ioannis

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.12.1 or,
at your option, any later version of Perl 5 you may have available.


=cut
