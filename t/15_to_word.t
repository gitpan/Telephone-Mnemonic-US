use Test::More  'no_plan';
use List::MoreUtils  qw/ any none/;
use Telephone::Mnemonic::US::Math qw/  to_word dict_path/;
use Tie::DictFile;

my %dict;
tie %dict, 'Tie::DictFile', dict_path() ;
 

sub contains {
	my ($value, @list) = @_;
	$value || @list || return;
	any { $_ eq $value } @list;
}

ok   contains  'boat',  to_word('2628',\%dict) ;
ok   contains  'coat',  to_word('2628',\%dict) ;
ok   contains  'anat',  to_word('2628',\%dict) ;
ok ! contains  'fail',  to_word('2628',\%dict) ;

ok ! to_word('22222222263-748-7233',\%dict,1), 'with timeout';


SKIP: {
	my $dev_testing = (getlogin eq 'ioannis') && 0 ;
	skip 'dev testing' unless $dev_testing ;
	ok any {$_ eq 'boat'}  to_word('263-748-7233',\%dict),'ameritrade', 'dev testing';

}
