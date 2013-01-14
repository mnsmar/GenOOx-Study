package GenOOx::Study::Sample;

use XML::Rabbit;

has_xpath_value 'name'       => './@name';
has_xpath_value 'type'       => './@type';
has_xpath_value 'path'       => './@path';
has_xpath_value 'stage'      => './@stage';
has_xpath_value 'cell_stage' => './@cell_stage';
has_xpath_value 'condition'  => './@condition';

has_xpath_value_list '_ko_proteins' => './/ko_protein';

finalize_class();

1;
