pacakge Vm;

sub new
{
	my ($class,%args) = @_;
	bless \%args, $class ;
}

1;
