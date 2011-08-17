#use Test::More;
use Test::Pod::Coverage tests=>4;


my $trustme = { trustme => [ 	  qr/^combine_one$/  
                                , qr/^combinethem$/ 
                                , qr/^str_pairs$/ 
                                , ], };


pod_coverage_ok( $_, $trustme )        for 
									    ( 'Telephone::Mnemonic::US::Number'
                                        , 'Telephone::Mnemonic::US::Math'
                                        , 'Telephone::Mnemonic::US::Words'
                                        , 'Telephone::Mnemonic::US'
#                                        , 'Telephone::Mnemonic::Phone'
#                                        , 'Telephone::Mnemonic::US::Phone'
) ;


