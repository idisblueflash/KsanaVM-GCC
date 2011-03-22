package Vm;

use strict;
use warnings;
use Ksanaword ;
use Data::Dumper ;

my $ksanaword = Ksanaword->new();

my $MAXWORD = 256 ;
my $nword = 0 ;
my @vectors ;

sub new
{
	my ($class,%args) = @_;
	bless \%args, $class ;
}

sub nwordcount 
{
    $nword;
}

sub maxwordvalue{
    $MAXWORD;
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

sub KVMAddWord{
    my $vm      = shift ;
    my $name    = shift ;
    my $KVMXT   = shift ;

    if ( $nword >= $MAXWORD ){
        print "Too many words!\n";
        return ;
    }

    my $ksanaword = Ksanaword->new($name,$KVMXT);
    print Dumper $ksanaword ; #debug line
    $vectors[$nword] = $ksanaword ;
    print Dumper @vectors ; #debug line
    $nword++ ;
    return 1;

}

sub KVMFindWord{
    my $vm 	= shift ;
    my $name	= shift ;

    my $word 	= Ksanaword->new() ;
    my $i ;
    for ($i=$nword ; $i>=0 ; $i-- ){
        $word  	= $vectors[$i] ;
        if ($word->{name} eq $name) {
            return $word->{KVMXT};
        }
    }
    return 0 ;
}

1;

