#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;
push (@INC, '..');

use Test::More tests => 17;
use Test::Differences;

use_ok( 'Vm' ) or exit;

my $vm = Vm->new( sp => -1 );
isa_ok($vm,'Vm'); 

is($vm->{sp},-1,'sp初值为-1');
my $cmd = "1 2 3 a b c";
ok($vm->KVMSetTib($cmd));

eq_or_diff($vm->{tib},['1', '2', '3', 'a', 'b', 'c'],'添加成功');

ok($vm->KVMSetTib(" q "),'额外推入cmd测试');
eq_or_diff($vm->{tib},['','q'],'添加成功');
my $STACK_DEPTH = 8 ;
ok($vm->{sp} <= $STACK_DEPTH,'没超过栈深度');
ok($vm->KVMPush('1'),'push功能');
print Dumper $vm->{datastak};
ok($vm->KVMPush('2'),'push功能');
#ok($vm->KVMPush('2'),'push功能');
#ok($vm->KVMPop(),'Pop功能');
print Dumper $vm->{datastak};
#ok($vm->KVMAdd(),'Add功能');
ok($vm->KVMMultiply(),'Multiplay功能');
is(${$vm->{datastak}}[0],2,'乘法结果为2');
print Dumper $vm->{datastak};
ok($vm->KVMDumpStack(),'KVMDumpStack函数运行');
is ( Vm->nwordcount , 0 , 'nword数值检测' );
is ( Vm->maxwordvalue, 256 , 'MAXWORD数值检测' );
ok ( $vm->KVMAddWord("Divide",'divide_handle'),'KVMAddWord->Ksanaword 创建测试' );
is ( Vm->nwordcount , 1 , 'nword数值检测' );

