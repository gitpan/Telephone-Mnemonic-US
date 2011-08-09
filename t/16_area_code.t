
use Test::More  'no_plan';
use Telephone::Mnemonic::US::Number qw/ 
				well_formed_p area_code without_area_code 
				station_code house_code partial_codes
/;

*_filter_numbers  = *Telephone::Mnemonic::US::Number::_filter_numbers ;
#*to_digits  = *Telephone::Mnemonic::US::Number::to_digits;

note 'extractable area codes';
is area_code( '(734) 555 1212'), 734 ;
is area_code( '1235551212'), 123 ;

note 'missing area codes';
ok ! area_code( '555 1212');
ok ! area_code( '555 1212');
ok ! area_code( '5551212');
ok ! area_code( 'aaaa');

note 'without area code';
is  without_area_code( '(734) 555 1243'), 5551243 ;
is  without_area_code( '1235551214'), 5551214 ;
is  without_area_code( '555 1212'), 5551212;
is  without_area_code( '5551212'), 5551212;
ok ! without_area_code( 'aaaa');

note 'missing area codes';
ok ! area_code( '555 1212');
ok ! area_code( '555 1212');
ok ! area_code( '5551212');
ok ! area_code( 'aaaa');

note 'station code';
is station_code( '(734) 534 1212'), 534 ;
is station_code( '1235341212'), 534 ;
is station_code( '5341212'), '534';
ok ! station_code( '1212');
ok ! station_code( 'aaaa');

note 'house code';
is house_code( '(734) 534 1212'), 1212 ;
is house_code( '1235341212'), 1212 ;
is house_code( '5341212'), 1212;
ok ! house_code( '1212');
ok ! house_code( 'aaaa');

note 'partial codes';
my $h1 = { area_code=>734, station_code=>534, house_code=>1212 };
is_deeply partial_codes( '(734) 534 1212'), $h1  ;
my $h2 = { area_code=>'', station_code=>534, house_code=>1212 };
is_deeply partial_codes( '5341212'), $h2, 
