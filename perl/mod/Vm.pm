package Vm;

use strict;
use warnings;
use Ksanaword ;
use Data::Dumper ;

my $ksanaword = Ksanaword->new();

my $MAXWORD = 256 ;
my $nword = 0 ;
my @vectors ;

#lesson 4
my $DICTSIZE = 4096;  #好像在perl裏面不需要
my $CELLSIZE = 4 ;
my @dictionary;
my $here = 0 ; 		#write from here
#lesson 5
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
	my $sp_num = $vm->{sp} || 0 ;
   	if ($sp_num >= $STACK_DEPTH ){
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
sub KVMMinus
{
	my $vm = shift;
	my $n2 = $vm->KVMPop(); 	# pop second operand
	my $n1 = $vm->KVMPop();		# pop first  operand
	my $r  = $n1 - $n2 ; 		# do  minus 
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

# stack effect diagram ( n1 n2 -- r )
sub KVMDivide
{
	my $vm = shift;
	my $n2 = $vm->KVMPop(); 	# pop second operand
	my $n1 = $vm->KVMPop();		# pop first  operand
	my $r  = $n1 / $n2 ; 		# do  addition
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
		$str = ${$vm->{datastak}}[$i] || '0'; 
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
    #print Dumper $ksanaword ; #debug line
    $vectors[$nword] = $ksanaword ;
    #print Dumper @vectors ; #debug line
    $nword++ ;
    return 1;

}

sub KVMFindWord{
    my $vm 	= shift ;
    my $name	= shift || 'UnNamed';

    my $word 	= Ksanaword->new() ;
    my $i ;
    for ($i=$nword ; $i>=0 ; $i-- ){
        $word  	= $vectors[$i] || {name => 'EmptyName', KVMXT => 'EmptySub'};
	#print Dumper $word;
	#print $word->{name} . "word.name数据分析\n";
	#print $name . "name数据分析\n";
        if ($word->{name} eq $name) {
            return $word->{KVMXT};
        }
    }
    return 0 ;
}

sub KVMTOS{
    my $vm 	= shift ;
    #print "debug: TOS worked.\n";
    my $re      = ${$vm->{datastak}}[$vm->{sp}] ;
    return $re ;
}

# stack effect diagram ( n -- n n )
sub KVMDup{
    my $vm 	= shift ;
    if ( $vm->{sp} >= $STACK_DEPTH ){
        print "Stack Overflow!\n";
        return ;
    }
    #print "debug: Dup worked.\n";
    #print Dumper $vm ;
    my $stack_top_data = $vm->KVMTOS() ;
    $vm->KVMPush($stack_top_data);
}

sub addbasicword{
    my $vm 	= shift ;
    $vm->KVMAddWord("+",\&KVMAdd);
    $vm->KVMAddWord("-",\&KVMMinus);
    $vm->KVMAddWord("*",\&KVMMultiply);
    $vm->KVMAddWord("/",\&KVMDivide);
    $vm->KVMAddWord("drop",\&KVMDrop);
    $vm->KVMAddWord("dup",\&KVMDup);
    $vm->KVMAddWord("over",\&KVMOver);
    $vm->KVMAddWord("bye",\&KVMBye);
    $vm->KVMAddWord("swap",\&KVMSwap);

}
# stack effect diagram ( n1 n2 -- n2 n1 )
sub KVMSwap{
    my $vm 	= shift ;
    my $sp_num  = $vm->{sp};
    if ( $sp_num < 1 ){
        print "Need at least 2 items on stack.\n";
        return ;
    }
    ( ${$vm->{datastak}}[$vm->{sp}], ${$vm->{datastak}}[$vm->{sp} - 1] ) = ( ${$vm->{datastak}}[$vm->{sp} - 1 ], ${$vm->{datastak}}[$vm->{sp}] )
}

# stack effect diagram ( n1 n2 -- n1 n2 n1 )
sub KVMOver {
    my $vm 	= shift ;
    my $temp 	= '' ;
    my $sp_num 	= $vm->{sp} ;

    if ( $sp_num < 1  ){
    print "Need at least 2 items on stack\n";
    return ;
    }
    $temp 	= ${$vm->{datastak}}[$sp_num - 1 ] ;
    $vm->KVMPush($temp);
}
# stack effect diagram ( n1 n2 -- r )
sub KVMDrop{
    my $vm 	= shift ;
    $vm->KVMPop();
}

sub KVMBye{
    my $vm 	= shift ;
    $vm->{terminate} = 1;	
}
# Compilers Lesson4
sub KVMhere{
    my $vm = shift;
    $vm->KVMPush($here);
}

sub KVMComma{
    my $vm = shift;
    $vm->DictComiple($vm->KVMPop());
}

sub DictComiple{
    my $vm = shift;
    my $i  = shift;
    # write an integer to the dictionary
    $dictionary[$here] = $i ;
    # advance the here pointer
    $here += $CELLSIZE ;
}

sub adddictword{
    my $vm = shift;
    $vm->KVMAddWord("here",\&KVMhere);
    $vm->KVMAddWord(",",\&KVMComma);
}

1;

