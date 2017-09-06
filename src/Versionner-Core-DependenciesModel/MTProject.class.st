"
A project represents a software development project, and more presicely, its depdendencies (also known as configuration).

Note: Need to add extra methods with ""for:"" parameter to handle platforms (e.g. for: #'pharo' do)

Instance Variables
	- configurationClass : the configurationClass this project represents
	- repository : The core repository URL of this project
	- packages : internal packages (MTPackage) the project depends on
	- groups : definitions of set of dependencies (MTGroups)
	- depedentProjects : list of external projects this project depends on (list of project names)

"
Class {
	#name : #MTProject,
	#superclass : #Object,
	#instVars : [
		'name',
		'version',
		'configurationClass',
		'repository',
		'dependencies',
		'devWorkflow',
		'announcer'
	],
	#category : #Versionner-Core-DependenciesModel,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProject class>>newFromVersion: aMetacelloVersion inConfiguration: aConfigurationClass [
	^ MCModel2MTModelVisitor new
		visitConfiguration: aConfigurationClass
		withVersion: aMetacelloVersion
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProject class>>newNamed: projectName withInitialVersion: version inRepository: repositoryURL [
	"Create the skeleton of a new project (alos known as configuration)"
	| project |

	project := self new.
	project name: projectName.
	project repository: repositoryURL.
	project configurationClass: project devWorkflow createInitialDevelopment.
	^ project.
	
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProject>>= other [
	(self name = other name) ifFalse: [ ^false ].
	(self version = other version) ifFalse: [ ^false ].
	(self configurationClass  = other configurationClass) ifFalse: [ ^false ].
	(self repository = other repository) ifFalse: [ ^false ].
	^true
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProject>>acceptVisitor: anMTProjectVisitor [
	anMTProjectVisitor visitProject: self.
	dependencies do: [ :dependency | dependency acceptVisitor: anMTProjectVisitor ]
]

{
	#category : #setting,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProject>>addDependency: aDependency [
	"Add a dependency to the configuration (will create a new baseline)."

	dependencies add: aDependency.
	aDependency parent: self.
	self announcer announce: (MTProjectModelChanged project: self).
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProject>>announcer [
	^ announcer ifNil: [announcer := Announcer new]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProject>>configurationClass [
	^ configurationClass
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProject>>configurationClass: aConfigurationClass [
	configurationClass := aConfigurationClass.
	self name: configurationClass name configurationBaseName.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProject>>currentBaseline [
	| baselines |
	
	baselines := self configurationClass project versions select: [:aVersion | aVersion blessing == #baseline].
	^baselines last
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProject>>dependencies [
	^dependencies .
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProject>>dependencies: aDependencyList [
	dependencies := aDependencyList
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProject>>dependenciesFilteredBy: aClass [
	"Filter dependencies to only get Class instances"
	^ (dependencies select: [ :each | each class =  aClass ]) sorted
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProject>>dependenciesMap [
	^ self packages collect: [ :aPackage | aPackage name -> aPackage dependencies ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProject>>dependencyNamed: aDependencyName [
	"Get a depedency from its name"
	
	^ dependencies
		detect: [  :aDependency | (aDependency name =  aDependencyName) or: [ aDependency displayName =  aDependencyName ] ]
		ifNone: [ nil ]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProject>>devWorkflow [
	^ devWorkflow
		ifNil: [ devWorkflow := MTDevelopmentWorkfow newWithProject: self ]
		ifNotNil: [ :myself | myself ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProject>>groups [
	"Filter dependencies to only get groups"
	^ self dependenciesFilteredBy: MTGroup .
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProject>>initialize  [
	dependencies  := OrderedCollection new.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProject>>name [
	^ name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProject>>name: anObject [
	name := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProject>>packages [
	"Filter dependencies to only get packages"
	^ self dependenciesFilteredBy: MTPackage .
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProject>>removeDependencyNamed: aDependencyName [
	"Remove a depedency from the configuration"
	
	(self dependencyNamed: aDependencyName) remove
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProject>>repository  [
	^ repository 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProject>>repository: aRepositoryURL [
	repository := aRepositoryURL.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProject>>requiredProjects [
	"Filter dependencies to only get RquiredProject"
	^ self dependenciesFilteredBy: MTDependantProject .
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProject>>version [
	^ version
]

{
	#category : #setting,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProject>>version: aMTVersion  [
	version := aMTVersion
]
