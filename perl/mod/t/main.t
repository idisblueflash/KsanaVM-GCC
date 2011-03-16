#!/usr/bin/perl

use strict;
use warnings;
push( @INC, '..' );
use Test::More tests => 2;

use_ok('Vm') or exit;

my $cmd;    # buffer to hold input command

my $vm = Vm->new();    # the instance of virtual machine
                       # lack of [create the virtual machine]
isa_ok( $vm, 'Vm' );

print "Tutorial of Ksana Minimal Virtual Machine\n";
print "http://tutor.ksana.tw\n";

while (1) {
    print "ok>\n";
    $cmd = <STDIN>;          # get the command from console
    chomp($cmd);             # cut off the \n  
    $vm->KVMSetTib($cmd);    # set it as Vm's terminal input buffer
    lesson1($vm);

    last if ( $vm->{terminate} );
}

sub lesson1 {
    my $self = shift;
    my @tokens = split( /\s/, $self->{tib} );
    while (@tokens) {
        my $token = shift(@tokens);
        if ( $token eq 'bye' ) {
            $vm->{terminate} = 1;
        }
        else {
            print "$token\n";
        }

    }
}
