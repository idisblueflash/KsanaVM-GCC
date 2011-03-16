package Vm;

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
	my $n2 = $vm->KVMPop();
	my $n1 = $vm->KVMPop();
	my $r  = $n1 + $n2 ;
	$vm->KVMPush($r);
}

1;
