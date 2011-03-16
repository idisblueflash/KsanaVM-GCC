#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;
push (@INC, '..');

use Test::More tests => 12;
use Test::Differences;

use_ok( 'Vm' ) or exit;

my $vm = Vm->new();
isa_ok($vm,'Vm'); 
my $cmd = "1 2 3 a b c";
ok($vm->KVMSetTib($cmd));

eq_or_diff($vm->{tib},['1', '2', '3', 'a', 'b', 'c'],'添加成功');

ok($vm->KVMSetTib(" q "),'额外推入cmd测试');
eq_or_diff($vm->{tib},['','q'],'添加成功');
my $STACK_DEPTH = 8 ;
$vm->{sp}=0;
ok($vm->{sp} <= $STACK_DEPTH,'没超过栈深度');
ok($vm->KVMPush('1'),'push功能');
ok($vm->KVMPush('2'),'push功能');
ok($vm->KVMPush('2'),'push功能');
print Dumper $vm->{datastak};
ok($vm->KVMPop(),'Pop功能');
print Dumper $vm->{datastak};
ok($vm->KVMAdd(),'Add功能');
print Dumper $vm->{datastak};
