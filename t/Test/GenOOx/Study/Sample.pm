package Test::GenOOx::Study::Sample;

use Modern::Perl;

use base qw(Test::GenOOx);
use Test::GenOOx::Study;
use Test::Moose;
use Test::Most;

#######################################################################
################   Startup (Runs once in the begining  ################
#######################################################################
sub _check_loading : Test(startup => 1) {
	my ($self) = @_;
	use_ok $self->class;
};

#######################################################################
#################   Setup (Runs before every method)  #################
#######################################################################
sub create_new_test_objects : Test(setup) {
	my ($self) = @_;
	
	my $test_class = ref($self) || $self;
	$self->{TEST_OBJECTS} = $test_class->test_objects();
};

#######################################################################
##########################   Initial Tests   ##########################
#######################################################################
sub _isa_test : Test(1) {
	my ($self) = @_;
	isa_ok $self->obj(0), $self->class, "... and the object";
}

#######################################################################
#######################   Class Interface Tests   #####################
#######################################################################
sub name : Test(2) {
	my ($self) = @_;
	
	has_attribute_ok($self->obj(0), 'name', "... test object has the 'name' attribute");
	is $self->obj(0)->name, 'rnaseq3_WT', "... and returns the correct value";
}

sub type : Test(2) {
	my ($self) = @_;
	
	has_attribute_ok($self->obj(0), 'type', "... test object has the 'type' attribute");
	is $self->obj(0)->type, 'RNA-Seq', "... and returns the correct value";
}

sub path : Test(2) {
	my ($self) = @_;
	
	has_attribute_ok($self->obj(0), 'path', "... test object has the 'path' attribute");
	is $self->obj(0)->path, '/path/to/rnaseq3_WT/', "... and returns the correct value";
}

sub stage : Test(2) {
	my ($self) = @_;
	
	can_ok $self->obj(0), 'stage';
	is $self->obj(0)->stage, 'Adult', "... and returns the correct value";
}

sub cell_stage : Test(2) {
	my ($self) = @_;
	
	has_attribute_ok($self->obj(0), 'cell_stage', "... test object has the 'cell_stage' attribute");
	is $self->obj(0)->cell_stage, 'Round spermatids', "... and returns the correct value";
}

sub condition : Test(2) {
	my ($self) = @_;
	
	has_attribute_ok($self->obj(0), 'condition', "... test object has the 'condition' attribute");
	is $self->obj(0)->condition, 'WT', "... and returns the correct value";
}

#######################################################################
########################   Private Class Tests   ######################
#######################################################################


#######################################################################
###############   Class method to create test objects   ###############
#######################################################################
sub test_objects {
	my ($test_class) = @_;
	
	eval "require ".$test_class->class;
	
	my $test_study = Test::GenOOx::Study->test_objects->[0];
	
	return [$test_study->samples];
}

1;
