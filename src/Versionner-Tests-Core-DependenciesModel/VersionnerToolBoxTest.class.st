"
test class for the versionner toolbox.
"
Class {
	#name : #VersionnerToolBoxTest,
	#superclass : #TestCase,
	#instVars : [
		'classFactory'
	],
	#category : #Versionner-Tests-Core-DependenciesModel,
	#timestamp : 'ChristopheDemarey 2/21/2014 14:00'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerToolBoxTest>>testProjectSpecFromRequiredProject [
	| spec |
	
	spec := VersionnerToolBox projectSpecFromRequiredProject: self versionnerTestXMLWriter.
	self assert: spec asString equals: self versionnerTestXMLWriterSpec
]

{
	#category : #'test data',
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerToolBoxTest>>versionnerTestXMLWriter [
	^ MTDependantProject new
		name: 'VersionnerTestXMLWriter';
		configurationClass: ConfigurationOfVersionnerTestXMLWriter;
		displayName: 'aProjectAlias'
		yourself.
]

{
	#category : #'expected results',
	#timestamp : ' 8/31/2017 05:26:38'
}
VersionnerToolBoxTest>>versionnerTestXMLWriterSpec [
	^ 'spec 
	name: ''aProjectAlias'';
	projectReference: [
		spec
			className: #ConfigurationOfVersionnerTestXMLWriter;
			versionString: #''stable'' ].'
]
