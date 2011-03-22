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
    print "ok>\n";
    $cmd = <STDIN>;          # get the command from console
    chomp($cmd);             # cut off the \n  

    $virtualMachine->KVMSetTib($cmd);    # set it as Vm's terminal input buffer
    
    lesson3($virtualMachine);

    last if ( $virtualMachine->{terminate} );
}

sub lesson3 {
    my $vm = shift ; 
    my $xt = shift ;
    my $v ;
    
    if ( $vm->KVMFindWord("+") ne '+' ){
        $vm->addbasicword();
	print "add basic word finished.\n";
    }
   
    foreach my $token (@{$vm->{tib}}){
        $xt = $vm->KVMFindWord($token);


        if ($xt){
         print Dumper  $xt . "xt 的返回值" ;  #excute!
         $xt->($vm) ;  #excute!
        }else{
            $v = 0 + $token ;
            if ( $v == 0 && 0 != ( $token eq '0') ) {
                print "Unkown Command $token.\n";
            }else{
                $vm->KVMPush($token);
            }
        }
    }
    $vm->KVMDumpStack();
    
}

