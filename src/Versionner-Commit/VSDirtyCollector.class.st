"
I'm a visitor to collect all dependencies of a package.
"
Class {
	#name : #VSDirtyCollector,
	#superclass : #Object,
	#instVars : [
		'packages',
		'projects',
		'commitStrategy'
	],
	#category : #Versionner-Commit,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSDirtyCollector class>>new [
	self error: 'Use #strategy:'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSDirtyCollector class>>strategy: aCommitStrategy [
	^ self basicNew 
		initializeStrategy: aCommitStrategy;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSDirtyCollector>>commitStrategy [
	^ commitStrategy
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSDirtyCollector>>initialize [
	super initialize.
	packages := OrderedCollection new.
	projects := OrderedCollection new
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSDirtyCollector>>initializeStrategy: aStrategy [
	commitStrategy := aStrategy.
	self initialize
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSDirtyCollector>>packageVisited: aMTPackage [
	^ packages anySatisfy: [ :each | each name = aMTPackage name ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSDirtyCollector>>packages [
	^ packages
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSDirtyCollector>>projectVisited: aProject [
	^ projects anySatisfy: [ :each | each configurationClass =  aProject configurationClass ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSDirtyCollector>>projects [
	^ projects
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSDirtyCollector>>visitDependantProject: aMTDependantProject  [
	"Dependent projects are handled just as regular projects"
	| class version |
	
	self commitStrategy shouldNestProjects ifFalse: [ ^ self ].
	aMTDependantProject isPresent ifFalse: [ ^ self ].
	(self projectVisited: aMTDependantProject) ifTrue: [ ^ self ].
	
	class := aMTDependantProject configurationClass.
	version := class project version: aMTDependantProject version versionString.
	self visitProject: (MTProject 
		newFromVersion: version 
		inConfiguration: class)
	
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSDirtyCollector>>visitGroup: aMTGroup  [
	"Do nothing, I do not need to handle groups"
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSDirtyCollector>>visitPackage: aMTPackage  [
	self commitStrategy shouldCommitDirtyPackages ifFalse: [ ^ self ].
	
	aMTPackage isDirty ifFalse: [ ^ self ].
	(self packageVisited: aMTPackage) ifTrue: [ ^ self ].
	packages add: aMTPackage
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSDirtyCollector>>visitProject: aMTProject [
	| oldProjects oldPackages |
	
	oldProjects := projects.
	oldPackages := packages. 
	projects := OrderedCollection new.
	packages := OrderedCollection new.

	aMTProject requiredProjects do: [ :each | each acceptVisitor: self ].
	aMTProject packages do: [ :each | each acceptVisitor: self ].
	
	(self commitStrategy shouldCommitProjects
		and: [ 
			projects notEmpty 
				or: [ packages notEmpty 
				or: [ self commitStrategy shouldCommitNestedProjects ] ] ])
		ifTrue: [ projects add: aMTProject ].

	projects := 
		oldProjects, 
		(projects select: [ :eachProject | 
			oldProjects noneSatisfy: [ :each | each name = eachProject name  ] ]).
	packages := 
		oldPackages, 
		(packages select: [ :eachPackage | 
			oldPackages noneSatisfy: [ :each | each name = eachPackage name  ] ])
]
