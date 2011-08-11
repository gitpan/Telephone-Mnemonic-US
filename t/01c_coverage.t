#use Test::More;
use Test::Pod::Coverage tests=>3;


my $trustme = { trustme => [ 	  qr/^combine_one$/  
                                , qr/^combinethem$/ 
                                , qr/^str_pairs$/ 
                                , ], };


pod_coverage_ok( $_, $trustme )        for 
									    ( 'Telephone::Mnemonic::US::Number'
                                        , 'Telephone::Mnemonic::US::Math'
                                        , 'Telephone::Mnemonic::US'
) ;


