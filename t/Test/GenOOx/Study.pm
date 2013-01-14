package Test::GenOOx::Study;

use Modern::Perl;

use base qw(Test::GenOOx);
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
	is $self->obj(0)->name, 'ProteinA', "... and returns the correct value";
}

sub species : Test(2) {
	my ($self) = @_;
	
	has_attribute_ok($self->obj(0), 'species', "... test object has the 'species' attribute");
	is $self->obj(0)->species, 'Mus musculus', "... and returns the correct value";
}

sub species_id : Test(2) {
	my ($self) = @_;
	
	has_attribute_ok($self->obj(0), 'species_id', "... test object has the 'species_id' attribute");
	is $self->obj(0)->species_id, 'mm9', "... and returns the correct value";
}

sub samples : Test(2) {
	my ($self) = @_;
	
	can_ok $self->obj(0), 'samples';
	is $self->obj(0)->samples, 9, "... and returns the correct value";
}

sub sample_with_name : Test(2) {
	my ($self) = @_;
	
	can_ok $self->obj(0), 'sample_with_name';
	isa_ok $self->obj(0)->sample_with_name('clip1'), 'GenOOx::Study::Sample', "... and the returned object";
}

sub samples_with_type : Test(3) {
	my ($self) = @_;
	
	can_ok $self->obj(0), 'samples_with_type';
	is $self->obj(0)->samples_with_type('HITS-CLIP'), 3, "... and returns the correct value";
	is $self->obj(0)->samples_with_type('RNA-Seq'), 6, "... and returns the correct value";
}

sub sample_types : Test(2) {
	my ($self) = @_;
	
	can_ok $self->obj(0), 'sample_types';
	is_deeply [$self->obj(0)->sample_types], ['RNA-Seq', 'HITS-CLIP'], "... and returns the correct value";
}

#######################################################################
########################   Private Class Tests   ######################
#######################################################################
sub _samples_map : Test(3) {
	my ($self) = @_;
	
	has_attribute_ok($self->obj(0), '_samples_map', "... test object has the '_samples_map' attribute");
	isa_ok $self->obj(0)->_samples_map, 'HASH', "... and the returned object";
	is keys %{$self->obj(0)->_samples_map}, 9, "... and has the correct number of keys"
}

#######################################################################
###############   Class method to create test objects   ###############
#######################################################################
sub test_objects {
	my ($test_class) = @_;
	
	eval "require ".$test_class->class;
	
	my @test_objects = ($test_class->class->new(file => 't/sample_data/study1.xml'));
	
	return \@test_objects;
}

1;
