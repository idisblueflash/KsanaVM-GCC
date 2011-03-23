#!/usr/bin/perl

use strict;
use warnings;
push( @INC, '..' );
use Test::More tests => 2;
use Data::Dumper ;

use_ok('Vm') or exit;

my $cmd;    # buffer to hold input command

my $virtualMachine = Vm->new();    # the instance of virtual machine
                       # lack of [create the virtual machine]
isa_ok( $virtualMachine, 'Vm' );

print "Tutorial of Ksana Minimal Virtual Machine\n";
print "http://tutor.ksana.tw\n";

while (1) {
    print "ok>";
    $cmd = <STDIN>;          # get the command from console
    chomp($cmd);             # cut off the \n  

    $virtualMachine->KVMSetTib($cmd);    # set it as Vm's terminal input buffer
    
    lesson2($virtualMachine);

    last if ( $virtualMachine->{terminate} );
}

sub lesson2 {
    my $vm = shift;
    foreach my $token (@{$vm->{tib}}) { 	
	if ( $token eq '+' ){
	    $vm->KVMAdd();
	}elsif ( $token eq '*'){
		$vm->KVMMultiply();
	}elsif ( $token eq 'bye'){
		$vm->{terminate} = 1;	
	}else{
            my $v = 0 + $token ;

	    if ( $v == 0 && 0 != ($token eq '0')){
		print "unkonw command $token\n";
            }else{
	        $vm->KVMPush($token);	
	    }
	}
    }
    $vm->KVMDumpStack(); 
}
