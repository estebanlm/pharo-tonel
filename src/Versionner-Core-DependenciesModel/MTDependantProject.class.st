"
A dependant project represents an external projetc you are dependending on.

Instance Variables
	- configurationClass : the configurationClass this project represents
	- repository : The core repository URL of this project
"
Class {
	#name : #MTDependantProject,
	#superclass : #MTDependency,
	#instVars : [
		'configurationClass',
		'displayName',
		'repositories',
		'symbolicVersionString'
	],
	#category : #Versionner-Core-DependenciesModel,
	#timestamp : '<historical>'
}

{
	#category : #instantiation,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTDependantProject class>>newWithWorkingCopy: anMBConfigurationInfo [
	"Create a new dependent project with the given project."
	| requiredProject  version |
	
	requiredProject := self new
		name: anMBConfigurationInfo name configurationBaseName;
		configurationClass: anMBConfigurationInfo configurationClass;
		yourself.
	requiredProject displayName: requiredProject name.
	requiredProject editRepositories.
	version := (anMBConfigurationInfo hasVersion: #stable)
		ifTrue: [ #stable ]
		ifFalse: [ #bleedingEdge ].
	requiredProject version: (MTVersion fromVersionString: version).
	^ requiredProject
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTDependantProject>>= other [
	(super = other) ifFalse: [ ^false ].
	(self configurationClass = other configurationClass) ifFalse: [ ^false ].
	(self displayName = other displayName) ifFalse: [ ^false ].
	(self repositories hasEqualElements: other repositories) ifFalse: [ ^false ].
	^ true
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTDependantProject>>acceptVisitor: anMTProjectVisitor [
	anMTProjectVisitor visitDependantProject: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTDependantProject>>configurationClass [
	^ configurationClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTDependantProject>>configurationClass: anObject [
	configurationClass := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTDependantProject>>displayName [
	^ displayName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTDependantProject>>displayName: anObject [
	displayName := anObject
]

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTDependantProject>>displayString [
	^ version 
		ifNil: [ displayName ]
		ifNotNil: [ version name 
					ifNil: [ displayName ]
					ifNotNil: [displayName, ' (', version name, ')' ] ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTDependantProject>>initialize  [
	repositories  := OrderedCollection new.
	dependencies := OrderedCollection new.
]

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTDependantProject>>repositories [
	^ repositories
]

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTDependantProject>>repositories: aRepositoryList [
	"Set a list of repository URLs for this project."
	repositories := aRepositoryList asOrderedCollection.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTDependantProject>>symbolicVersionString [
	^ symbolicVersionString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTDependantProject>>symbolicVersionString: anObject [
	symbolicVersionString := anObject
]
