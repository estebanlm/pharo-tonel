"

"
Class {
	#name : #MTDependencyTest,
	#superclass : #TestCase,
	#instVars : [
		'version',
		'project'
	],
	#category : #Versionner-Tests-Core-DependenciesModel,
	#timestamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:38'
}
MTDependencyTest>>setUp [
	| visitor |
	
	visitor := MCModel2MTModelVisitor new.
	version := ConfigurationOfVersionnerTestXMLWriter project version: '2.1.0'.
	project := visitor visitConfiguration: ConfigurationOfVersionnerTestXMLWriter withVersion: version.

]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:38'
}
MTDependencyTest>>testProject [
	| dependency |
	
	dependency := project dependencyNamed: 'Core'.
	self assert: dependency project equals: project.
	
	dependency := (project dependencyNamed: 'XML-Writer-Core').
	self assert: dependency project equals: project.

	dependency := (project dependencyNamed: 'Collections-Support').
	self assert: dependency project equals: project.

]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:38'
}
MTDependencyTest>>testRemove [
	(project dependencyNamed: 'XML-Writer-Core') remove.
	self assert: ((project dependencyNamed:  'XML-Writer-Core') = nil).
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:38'
}
MTDependencyTest>>testRemoveGroup [
	(project dependencyNamed: 'Core') remove.
	self assert: (project dependencyNamed: 'Core') = nil.
	self assert: ((project dependencyNamed: 'default') dependencies includes: 'Core') not
]
