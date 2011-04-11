package Compiler;

use strict;
use warnings;

sub new
{
	my ($class,%args) = @_;
	bless \%args, $class ;
}

sub KVMhere{
    my $vm = shift;
    $vm->KVMPush($vm->{here});
}

sub KVMComma{
    my $vm = shift;
    $vm->DictComiple($vm->KVMPop());

}

sub DictComiple{
    my $vm = shift;
    my $i  = shift;
    # write an integer to the dictionary
    $vm->dictionary[$vm->{here}] = $i ;
    # advance the here pointer
    $vm->{here} += $CELLSIZE ;

}
return 1;
