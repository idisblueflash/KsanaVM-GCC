#!/usr/bin/perl

use strict;
use warnings;
push (@INC, '..');

use Test::More tests => 6;

use_ok( 'Vm' ) or exit;

my $vm = Vm->new();
isa_ok($vm,'Vm'); 
my $cmd = "1 2 3 a b c";
ok($vm->KVMSetTib($cmd));

is($vm->{tib},'1 2 3 a b c','添加成功');

ok($vm->KVMSetTib(" q "),'额外推入cmd测试');
is($vm->{tib},'1 2 3 a b c q ','推入成功');
