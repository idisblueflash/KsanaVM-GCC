#!/usr/bin/perl

use strict;
use warnings;
push (@INC, '..');

use Test::More tests => 2;

use_ok( 'Vm' ) or exit;

my $vm = Vm->new();
isa_ok($vm,'Vm'); 


