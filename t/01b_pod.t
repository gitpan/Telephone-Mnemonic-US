use Test::More;


my $dir  = $ENV{PWD} =~ m#\/t$#  ? '../' : '';
my @files =   (    "${dir}blib/lib/Telephone/Mnemonic/US.pm" ,
                   "${dir}blib/lib/Telephone/Mnemonic/US/Math.pm" ,
                   "${dir}blib/lib/Telephone/Mnemonic/US/Number.pm" ,
		   "${dir}script/tel2num.pl", "${dir}script/tel2mnemonic.pl" ,
);
plan  tests=> scalar @files;

eval 'use Test::Pod' ;


SKIP: {        
		skip  'no Test::Pod', scalar @files    if $@ ;
		pod_file_ok( $_,  $_)   for @files;
};

