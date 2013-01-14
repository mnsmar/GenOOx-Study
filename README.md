GenOOx::Study
==========================================================================
An Object Oriented library for managing deep sequencing studies

Summary
--------------
GenOOx::Study can be initialized from an XML file that describes a deep sequencing experiment.
It automatically creates OO entities corresponding to XML elements using XML::Rabbit.

Here is an example of an XML file that can be parsed by GenOOx::Study
```xml
<study name="ProteinA" species="Mus musculus" species_id="mm9">
	<sample name="clip1" type="HITS-CLIP" path="samples/clip1/">
	</sample>
	<sample name="clip2" type="HITS-CLIP" path="samples/clip2/">
	</sample>
	<sample name="clip3" type="HITS-CLIP" path="samples/clip3/">
	</sample>
	
	<sample name="rnaseq1_KO" type="RNA-Seq" path="samples/rnaseq1_KO/" stage="Adult" cell_stage="Whole" condition="KO">
		<ko_protein>ProteinA</ko_protein>
	</sample>
	<sample name="rnaseq1_WT" type="RNA-Seq" path="samples/rnaseq1_WT/" stage="Adult" cell_stage="Whole" condition="WT">
	</sample>
	
	<sample name="rnaseq2_KO" type="RNA-Seq" path="samples/rnaseq2_KO/" stage="Adult" cell_stage="Pachytene" condition="KO">
		<ko_protein>ProteinA</ko_protein>
	</sample>
	<sample name="rnaseq2_WT" type="RNA-Seq" path="samples/rnaseq2_WT/" stage="Adult" cell_stage="Pachytene" condition="WT">
	</sample>
	
	<sample name="rnaseq3_KO" type="RNA-Seq" path="samples/rnaseq3_KO/" stage="Adult" cell_stage="Round spermatids" condition="KO">
		<ko_protein>ProteinA</ko_protein>
	</sample>
	<sample name="rnaseq3_WT" type="RNA-Seq" path="samples/rnaseq3_WT/" stage="Adult" cell_stage="Round spermatids" condition="WT">
	</sample>
</study>
```

State
--------------
* The library should be considered unstable and untested.
* The library is under heavy development and functionality is added on a daily basis.

Prerequisites
--------------
* Moose
* XML::Rabbit
* namespace::autoclean
* Test::Most
* Test::Class
* Modern::Perl
