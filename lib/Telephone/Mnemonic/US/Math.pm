package Telephone::Mnemonic::US::Math;

use 5.010000;
use strict;
use Data::Dumper;
use warnings;
use List::Util 'first';
our $VERSION = '0.01';
use base 'Exporter';


our @EXPORT_OK = qw(  combinethem  sets2candidates
	str_pairs to_word find_valids dict_path
);

sub str_pairs {
	my $str = shift || return;
	my $len = length $str;
	my $stop = $len-2;
	my (@pairs,$parts);
	for (1..length $str) {
		my $lpart = substr $str, 0 , $_;
		my $rpart = substr $str, length ($lpart) ;
		push @pairs, [$lpart, $rpart];
		#$pairs{$lpart} = $rpart;
	}
	[@pairs];
}
sub to_word {
	my ($num, $dict, $timeout) = @_ ;
	$timeout //=0;
	my $letters = _sets_of_letters( $num ) || return;
	my ($candidates, @valid)  ;
	eval {
		local $SIG{ALRM} = sub {die};
		alarm $timeout ;
		$candidates = sets2candidates( $letters ) || return;
		for (@$candidates) {
			push @valid, $_ if exists $dict->{$_};
		}
		alarm 0;
	};
    #say Dumper $letters; exit;
    #say Dumper @valid; #exit;
    @valid ;
}
sub dict_path {
	  first {-f $_} (qw{ /usr/share/dict/words /usr/lib/dict/words});
}
sub find_valids {
	my ($pairs, $dict, $timeout) = @_;
	return unless @$pairs;
	my $res;
	for (@$pairs) {
		my $h;
		$h->{lpart} = $_->[0];
        $h->{rpart} = $_->[1];
		my $llen =  length($_->[0])||0;
		my $rlen =  length($_->[1])||0;
        $h->{max_seg} = ($llen > $rlen) ? $llen : $rlen ;
		$h->{lvalid} = [to_word( $_->[0], $dict, $timeout)];
		$h->{rvalid} = [to_word( $_->[1], $dict, $timeout)];
		$h->{l_nval} = @{$h->{lvalid}};
		$h->{r_nval} = @{$h->{rvalid}};
		$h->{max_valid} = ($h->{l_nval} > $h->{r_nval}) ? $h->{l_nval} : $h->{r_nval} ;
		push @$res, $h;
	}
	$res;
}
sub sets2candidates {
	my $sets = shift;
    my $fragments=[];
    #TODO sanity checks

	#say Dumper $sets; exit;
	#$fragments = combinethem($sets->[1], $fragments) ;
	#$fragments = combinethem($sets->[0], $fragments) ;
	#say Dumper $fragments; exit;

	$fragments =  combinethem($_,$fragments) for reverse (@$sets); 
	$fragments;
}

sub combinethem {
	my ($chars, $fragments) = @_ ;
	return $chars unless @$fragments ;
	my @res;
	push @res, @{combine_one($_,$fragments)} for @$chars;
	[@res];
}

sub combine_one {
	my ($char, $fragments) = @_ ;
	 [ map { $_=$char . $_}  @{[@$fragments]}  ]
	
}

sub _sets_of_letters {
    my $num = shift ||return;
    # error checking
    $num =~ s/[-\s]+//g;
    my @letters ;
    # filter input
    $num =~ s/\D+//;
    for (split //, $num ) {
        given (lc $_) {
            when ('2')   { push @letters,  [qw/a b c/]   }
            when ('3')   { push @letters,  [qw/d e f/]   }
            when ('4')   { push @letters,  [qw/g h i/]   }
            when ('5')   { push @letters,  [qw/j k l/]   }
            when ('6')   { push @letters,  [qw/m n o/]   }
            when ('7')   { push @letters,  [qw/p q r s/]  }
            when ('8')   { push @letters,  [qw/t u v/]   }
            when ('9')   { push @letters,  [qw/w x y z/]  }
            when (/[01]/)   { warn "can't map tel numbers containing 0 or 1\n";return}
            default:   { warn qq(to_word: "$_" should not happen)}
        }
    }
    [@letters];
}
1;
__END__

=head1 NAME

Telephone::Mnemonic::US::Math - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Telephone::Mnemonic::US::Math;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Telephone::Mnemonic::US::Math, created by h2xs. It looks like the
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
