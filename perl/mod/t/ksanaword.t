#!/usr/bin/perl

use strict;
use warnings;
push( @INC, '..' );
use Test::More tests => 2;

use_ok('Ksanaword') or exit;

my $ksanaword= Ksanaword->new();    # the instance of Ksanaword  
isa_ok( $ksanaword, 'Ksanaword' );
