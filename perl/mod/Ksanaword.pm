package Ksanaword;

use strict;
use warnings;

sub new
{
	my $class = shift ;
    my $self  = {
        name    => shift ,
        KVMXT   => shift 
    };
	bless $self, $class ;
}

return 1;
