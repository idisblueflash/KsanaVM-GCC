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
	$self->{tib} = $cmd ;
}
1;
