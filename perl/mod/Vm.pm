package Vm;

sub new
{
	my ($class,%args) = @_;
	bless \%args, $class ;
}

sub KVMSetTib
{
	my $self = shift;
	my $cmd  = shift;
    	my @tokens = split( /\s/, $cmd );
	$self->{tib} = \@tokens;
}
1;
