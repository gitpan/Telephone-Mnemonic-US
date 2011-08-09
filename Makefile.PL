use 5.010000;
#use ExtUtils::MakeMaker;
use inc::Module::Install;

name           'Telephone-Mnemonic-US'          ;
license        'perl'                           ;
all_from       'lib/Telephone/Mnemonic/US.pm'   ;
abstract_from  'lib/Telephone/Mnemonic/US.pm'   ;
install_script 'script/tel2num.pl'              ;
install_script 'script/tel_mnemonic.pl'         ;
no_index       'directory'   => 'examples'      ;

requires #'Log::Log4perl'       => '1.06',
	     'Data::Dumper'        => '2.121_08',
	     'Carp::Assert'        => '0.18',
	     'Getopt::Compact'     => '0',
	     'List::MoreUtils'     => '0',
	     'List::Util'          => '0',
	     'Tie::DictFile'       => '0',
	     #'Math:::Combinatorics'         => '0',
;
test_requires 'Test::Pod::Coverage' => '1.0',
              'Test::Pod'           => '1.0',
              'Test::Pod::Coverage' => '1.08',
              'Test::HasVersion'    => '0.012',
              'Test::CPAN::Meta'    => '0.18',
              'Test::Dependencies'  => '0.12',
              'Test::MinimumVersion'=> '0.101080',
              'Test::Strict'        => '0.14', 
;
auto_install;
WriteAll;
 grep { -f $_} qw{ /usr/dict/words /usr/share/dict/words } or
warn "WARNING: Could not find your dict/words file in the standard places. Until you get it, you can ony map mneumerics to numbers.\n";
