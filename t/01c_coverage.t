use Test::More tests=> 1 ;

eval "use Test::Pod::Coverage 1.00";
plan skip_all => "Test::Pod::Coverage 1.00 required for POD coverage" if $@;

#all_pod_coverage_ok();


my $trustme = { trustme => [ 	qr/^.*$/  , 
                           ],
              };

#pod_coverage_ok( 'Pg::Pcurse' );
pod_coverage_ok( 'Telephone::Mnemonic::US', { trustme => [ 
                                qr/^house_code$/         , 
                                qr/^station_code$/       , 
                                qr/^area_code$/          , 
                                qr/^without_area_code$/  , 
                                qr/^beautify$/           , 
                                qr/^partial_codes$/      , 
                                qr/^well_formed_p$/      , 
			     	qr/^xs_content$/  ,
]});

