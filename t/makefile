.PHONY: $(shell ls)
.SILENT: 

#  00_load.t            01b_pod.t           01c_coverage.t  
#  02_hasversion.t      03_meta.t           04_dependencies.t-   
#  05_minimumversion.t- 07_strict.t
#  10_basic.t  11_tel2num.t 20_mnemonic.t  21_combine.t
# 11_phone.t            12_phone.t  13_beautify.t   14_str_pairs.t
# 15_to_word.t 16_area_code.t  
 
MODULES  =  -MData::Dumper -MCarp   -M5.010000
MODULES +=  -MTest::More   -Mblib=../blib
vi =  vi  -pc 'set nofoldenable'


current = 04_dependencies.t
current = 05_minimumversion.t
current = 10_basic.t
current = 11_tel2num.t
current = 13_beautify.t
current = 14_str_pairs.t
current = 15_to_word.t
current = 16_area_code.t
current = 17_partial_codes.t
current = 20_mnemonic.t
current = 21_combine.t
current = 12_phone.t
current = 01c_coverage.t  


#all: mpod
all: $(current)

tel2num tel_mnemonic:
	perl -Mblib=../blib/lib  ../script/$@.pl $(if $(findstring tel2num,$@),ameritrade,2628)

2* 1* 0*:
	perl -w -Mstrict -Mblib  $(MODULES)   $@  
pod:
	PAGER="less" perldoc  ../blib/lib/Telephone/Mnemonic/US.pm
npod:
	PAGER="less" perldoc  ../blib/lib/Telephone/Mnemonic/US/Number.pm
mpod:
	PAGER="less" perldoc  ../blib/lib/Telephone/Mnemonic/US/Math.pm
cp:
	cp  ../blib/lib/Telephone/Mnemonic/US.pm    ../lib/Telephone/Mnemonic/
	cp  ../blib/lib/Telephone/Mnemonic/US/*.pm  ../lib/Telephone/Mnemonic/US/
w: 
	chmod -R u+w  ../blib/lib/Telephone
vi :  w
	$(vi) ../blib/lib/Telephone/Mnemonic/US.pm  
vip :  w
	$(vi) +/NAME ../blib/lib/Telephone/Mnemonic/US.pm  
t2n t2m :  w
	$(vi) ../script/tel2num.pl  ../blib/lib/Telephone/Mnemonic/US.pm  
bnum: w
	PAGER="less" $(vi) -p  $(current) ../blib/lib/Telephone/Mnemonic/US/Number.pm 
b: w
	PAGER="less" $(vi) -p  $(current) ../blib/lib/Telephone/Mnemonic/US.pm 
bmath: w
	PAGER="less" $(vi) -p  $(current) ../blib/lib/Telephone/Mnemonic/US/Math.pm 
	
vipod: w
	$(vi) -c 'syntax clear' '+/__END__' ../blib/lib/Telephone/US/US.pm 
math: w
	$(vi) ../blib/lib/Telephone/Mnemonic/Math.pm  
test:
	make -C .. test
help:
	echo pod vi num b bmath  vipod math test t2n t2m  el2num tel_numeric:
