# POD documentation - main docs before the code

=head1 NAME

GenOOx::Study - Object describing a deep sequencing study

=head1 SYNOPSIS

    # Object that offers as an information holder for NGS studys
    # It contains information about the samples used the type of analysis for every sample and several more attributes
    # It primary goal is to be extensible so that it can describe several types of studys
    
    # To initialize 
    my $study = GenOOx::Study->new({
        NAME            => undef,
        SPECIES         => undef,
        DESCRIPTION     => undef,
        PARAMS          => undef,
        EXTRA_INFO      => undef,
    });


=head1 DESCRIPTION

    This object is constructed from an xml file which contains information about a NGS study.
    It contains accessors for different types of substudys within the main project

=head1 EXAMPLES

    # Read study info
    my $study_obj = GenOOx::Study->read_xml("params.xml);
    
    # Get all samples for a particular sub study
    

=head1 AUTHOR - Manolis Maragkakis

Email em.maragkakis@gmail.com

=cut

# Let the code begin...


package GenOOx::Study;

use XML::Rabbit::Root;
use GenOOx::Study::Sample;

has_xpath_value 'name'       => '/study/@name';
has_xpath_value 'species'    => '/study/@species';
has_xpath_value 'species_id' => '/study/@species_id';

has_xpath_object_map '_samples_map' => './sample' => './@name' => 'GenOOx::Study::Sample';


#######################################################################
########################   Interface Methods   ########################
#######################################################################
sub samples {
	my ($self) = @_;
	
	return values %{$self->_samples_map};
}

sub sample_with_name {
	my ($self, $name) = @_;
	
	return $self->_samples_map->{$name};
}

sub samples_with_type {
	my ($self, $type) = @_;
	
	my @samples;
	foreach my $sample ($self->samples) {
		if ($sample->type eq $type) {
			push @samples, $sample;
		}
	}
	return @samples;
}

sub sample_types {
	my ($self) = @_;
	
	my %sample_types;
	foreach my $sample ($self->samples) {
		$sample_types{$sample->type} = undef;
	}
	return keys %sample_types;
}

finalize_class();
1;
