#use Test::More;
use Test::Pod::Coverage tests=>5;


my $trustme = { trustme => [ 	  qr/^combine_one$/  
                                , qr/^combinethem$/ 
                                , qr/^str_pairs$/ 
                                , qr/dict_io$/
                                , qr/to_words$/
                                , ], };


pod_coverage_ok( $_, $trustme )        for 
									    ( 'Telephone::Mnemonic::US::Number'
                                        , 'Telephone::Mnemonic::US::Math'
                                        , 'Telephone::Mnemonic::US::Roles::Words'
                                        , 'Telephone::Mnemonic::US::Roles::Term'
                                        , 'Telephone::Mnemonic::US'
#                                        , 'Telephone::Mnemonic::Phone'
#                                        , 'Telephone::Mnemonic::US::Phone'
) ;


