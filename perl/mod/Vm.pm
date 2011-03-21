package Vm;

use strict;
use warnings;


sub new
{
	my ($class,%args) = @_;
	bless \%args, $class ;
}

sub KVMSetTib
{
	my $vm = shift;
	my $cmd  = shift;
    	my @tokens = split( /\s/, $cmd );
	$vm->{tib} = \@tokens;
}

my $STACK_DEPTH = 8 ;
sub KVMPush
{
	my $vm = shift;
	my $v    = shift;
   	if ($vm->{sp} >= $STACK_DEPTH ){
		print "Stack Overflow\n";
		return; 
	}
	
	$vm->{sp}++;
	${$vm->{datastak}}[$vm->{sp}] = $v ;
	
}
sub KVMPop
{
	my $vm = shift;
	if ( $vm->{sp} < 0 ){
	    print "Stack under flow\n";
	    return 0;
	}
	my $v = ${$vm->{datastak}}[$vm->{sp}];
	$vm->{sp}--;
	return $v;
}
# stack effect diagram ( n1 n2 -- r )
sub KVMAdd
{
	my $vm = shift;
	my $n2 = $vm->KVMPop(); 	# pop second operand
	my $n1 = $vm->KVMPop();		# pop first  operand
	my $r  = $n1 + $n2 ; 		# do  addition
	$vm->KVMPush($r); 		# push to stack
}

# stack effect diagram ( n1 n2 -- r )
sub KVMMultiply
{
	my $vm = shift;
	my $n2 = $vm->KVMPop(); 	# pop second operand
	my $n1 = $vm->KVMPop();		# pop first  operand
	my $r  = $n1 * $n2 ; 		# do  addition
	$vm->KVMPush($r); 		# push to stack
}
sub KVMDumpStack
{
	my $vm = shift ; 
	if ( $vm->{sp} < 0 ) {
		print "Empty stack\n";
		return ;
	}
	my $buf = '' ;
        my $str = '' ;	
	for (my $i = 0 ; $i <= $vm->{sp} ; $i++){
		$str = ${$vm->{datastak}}[$i] ; 
		$buf = $buf . " " . $str ;
	}
	print "$buf\n";
}
1;
