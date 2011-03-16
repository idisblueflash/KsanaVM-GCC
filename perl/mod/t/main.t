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
    
    #lesson1($vm);
    lesson2($vm);

    last if ( $vm->{terminate} );
}
sub lesson2 {
    my $self = shift;
    foreach my $token (@{$self->{tib}}) { 	
	if ( $token eq '+' ){
	    $self->KVMAdd();
	}else{
	    if ($token ~=/^-?\\d+$/){
	        $vm->KVMPush($token);	
            }else{
		print "unkonw command $token\n";
	    }
	}
    }
	
}
sub lesson1 {
    # fetch all token,  and print it out
    my $self = shift;

    foreach my $token (@{$self->{tib}}) { 	
	print "$token\n";
        if ( $token eq 'bye' ) { $vm->{terminate} = 1 ; }
    }
}
