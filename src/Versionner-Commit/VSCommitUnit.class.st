"
I'm a commit unit for a configuration handled with Versionner. 

A commit unit englobates all actions needed to perform a successful commit from a new version. 
Essentially, it will collect all dirty packages and its corresponfing configurations and it will: 

1) commit dirty packages
2) generate new configuration versions
3) commit new configurations

Example:
========
A commit unit can create versions  by working over configurations, so the best way to act is doing something like this: 

""This will create a new major version""
(VSCommitUnit major: ConfigurationOfVersionner) execute.
""This will create a new minor version""
(VSCommitUnit patch: ConfigurationOfVersionner) execute.
""This will create a new patch version""
(VSCommitUnit patch: ConfigurationOfVersionner) execute.
"
Class {
	#name : #VSCommitUnit,
	#superclass : #Object,
	#instVars : [
		'configurationClass',
		'comment',
		'repository',
		'commitVersion',
		'commitStrategy',
		'projectActions',
		'packageActions'
	],
	#category : #Versionner-Commit,
	#timestamp : 'EstebanLorenzano 4/27/2015 19:42'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitUnit class>>configurationClass: aConfigurationClass version: aVersion [
	^ self basicNew 
		initializeConfigurationClass: aConfigurationClass version: aVersion;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitUnit class>>major: aClass [
	^ self 
		configurationClass: aClass 
		version: VSCommitVersion major
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitUnit class>>minor: aClass [
	^ self 
		configurationClass: aClass 
		version: VSCommitVersion minor
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitUnit class>>new [
	self error: 'Use #configurationClass:'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitUnit class>>patch: aClass [
	^ self 
		configurationClass: aClass 
		version: VSCommitVersion patch
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitUnit>>allActions [
	^ self projectActions reversed, self packageActions
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitUnit>>collectCommitActions [
	| developmentVersion project collector |
	
	(VSCommitProjectValidator basename: (self configurationClass name configurationBaseName)) validate.
	developmentVersion := self configurationClass project version: #development. 
	project := MTProject
		newFromVersion: developmentVersion
		inConfiguration: self configurationClass.

	collector := VSDirtyCollector strategy: self commitStrategy.
	project acceptVisitor: collector.

	projectActions := collector projects collect: #asCommitAction as: Array.
	"Force main project at least"
	(projectActions isEmpty and: [ self commitStrategy shouldCommitProjects ]) 
		ifTrue: [ projectActions := { project asCommitAction } ].
	packageActions := collector packages collect: #asCommitAction as: Array
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitUnit>>comment [
	^ comment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitUnit>>comment: anObject [
	comment := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitUnit>>commitStrategy [
	^ commitStrategy
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitUnit>>commitStrategy: aStrategy [
	commitStrategy := aStrategy.
	self refresh
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitUnit>>commitVersion [
	^ commitVersion
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitUnit>>configurationClass [
	^ configurationClass
]

{
	#category : #executing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitUnit>>execute [
	self validate.
	"First commit packages"
	self packageActions do: [ :each | each executeOn: self ].
	"Now we can generate new versions and commit configs"
	self projectActions do: [ :each | each executeOn: self ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitUnit>>initialize  [
	super initialize.
	commitStrategy := VSCommitStrategy new.
	self collectCommitActions
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitUnit>>initializeConfigurationClass: aClass  version: aVersion [
	configurationClass := aClass.
	commitVersion := aVersion.
	self initialize
]

{
	#category : #showing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitUnit>>open [
	^ VSCommitBrowser openOn: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitUnit>>packageActions [
	^ packageActions
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitUnit>>project [
	^ (self projectActions 
		detect: [ :each | each project configurationClass = self configurationClass ]
		ifNone: [ ^ nil ])
		project
		
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitUnit>>projectActions [
	^ projectActions
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitUnit>>projectVersion [
	| project workingCopy info |
	project := self project ifNil: [ ^ nil ].
	workingCopy := project workingCopy.
	info := workingCopy ancestors first.
	^ MCVersion  package: workingCopy info: info.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitUnit>>refresh [
	self collectCommitActions
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitUnit>>removePackageAction: anAction  [
	packageActions := packageActions copyWithout: anAction
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitUnit>>removeProjectAction: anAction  [
	projectActions := projectActions copyWithout: anAction
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitUnit>>repository [
	^ repository
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitUnit>>repository: anObject [
	repository := anObject
]

{
	#category : #validation,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitUnit>>validate [
	self projectActions do: #validate.
	self packageActions do: #validate.

]
