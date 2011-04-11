#!/usr/bin/perl

use strict;
use warnings;
push( @INC, '..' );
use Test::More tests => 2;
use Data::Dumper ;

use_ok('Vm') or exit;
use_ok('Compiler') or exit;

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
    
    lesson4($virtualMachine);
    lesson3($virtualMachine);

    last if ( $virtualMachine->{terminate} );
}

sub adddictword{
    my $vm = shift;
    $vm->KVMAddWord("here",\&KVMhere);
    $vm->KVMAddWord(",",\&KVMComma);

}
sub lesson4{
    my $vm = shift;

    if ( $vm->KVMFindWord(",") ne ',' ){
        $vm->adddictword();
	#print "add basic word finished.\n";
    }
    
}
sub lesson3 {
    my $vm = shift ; 
    my $xt = shift ;
    my $v ;
    
    if ( $vm->KVMFindWord("+") ne '+' ){
        $vm->addbasicword();
	#print "add basic word finished.\n";
    }
   
    foreach my $token (@{$vm->{tib}}){
        $xt = $vm->KVMFindWord($token);


	#is($xt,"dup",'测试KVMFindWord返回值') ;
        if ($xt){
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

