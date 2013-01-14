package Test::GenOOx;

use Modern::Perl;

use base 'Test::Class';

INIT { Test::Class->runtests }

sub class {
	my ($self) = @_;
	(my $class = ref($self) || $self) =~ s/^Test:://;
	return $class;
}

#######################################################################
##########################   Helper Methods   #########################
#######################################################################
sub obj {
	my ($self, $index) = @_;
	
	return $self->{TEST_OBJECTS}->[$index];
}

sub objs {
	my ($self) = @_;
	
	return @{$self->{TEST_OBJECTS}};
}

1;
