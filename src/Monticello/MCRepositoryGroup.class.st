"
A singleton class, holds the list of repositories. Can look for a requested VersionInfo among its repositories.
"
Class {
	#name : #MCRepositoryGroup,
	#superclass : #Object,
	#instVars : [
		'repositories',
		'useCache'
	],
	#classInstVars : [
		'default'
	],
	#category : #Monticello-Versioning,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepositoryGroup class>>default [
	^ default ifNil: [default := self new]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepositoryGroup class>>withRepositories: aCollection  [
	| group |
	group  := self new.
	aCollection do: [ :each | group addRepository: each ].
	^ group 
		
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepositoryGroup>>addBasicRepository: aRepository [
	((repositories includes: aRepository) 
	or: [ aRepository == MCCacheRepository uniqueInstance ])
		ifFalse: [
			repositories add: aRepository.
			self announceRepositoryAdded: aRepository.
			self class default addRepository: aRepository ].
	^ aRepository
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepositoryGroup>>addRepository: aRepository [
	aRepository addTo: self.
	^ aRepository
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepositoryGroup>>addRepositoryGroup: aRepositoryGroup [
	aRepositoryGroup repositoriesDo: [ :each | 
		each addTo: self ]
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepositoryGroup>>addTo: aRepository [
	^ aRepository addRepositoryGroup: self
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepositoryGroup>>announceRepositoryAdded: aRepository [
	SystemAnnouncer uniqueInstance
		announce:
			(MCRepositoryAdded new
				repository: aRepository;
				yourself)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepositoryGroup>>announceRepositoryRemoved: aRepository [
	SystemAnnouncer uniqueInstance
		announce:
			(MCRepositoryRemoved new
				repository: aRepository;
				yourself)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepositoryGroup>>disableCache [
	useCache := false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepositoryGroup>>includes: aRepository [
	^ self repositories includes: aRepository
]

{
	#category : #interface,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepositoryGroup>>includesVersionNamed: aString [
	" check for existing version name in parallel over all repositories "
	| results |

	results := Array new: self repositories size.
	
	self repositories doWithIndex: [:repository :index | 
		" fork of test for each repository "
		results 
			at: index 
			put: (repository includesVersionNamed: aString) ].

	" check if any repository included the given versionName already"
	^ results anySatisfy: [:result| result = true ]	
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepositoryGroup>>initialize [
	super initialize.
	repositories := OrderedCollection new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepositoryGroup>>removeRepository: aRepository [
	repositories remove: aRepository ifAbsent: [ ^ self ].
	self announceRepositoryRemoved: aRepository
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepositoryGroup>>repositories [
	^ (self useCache 
		ifTrue: [Array with: MCCacheRepository uniqueInstance] 
		ifFalse: [Array new]) , repositories select: #isValid
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepositoryGroup>>repositoriesDo: aBlock [
	self repositories do: [:ea | [aBlock value: ea] on: Error do: []]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepositoryGroup>>useCache [
	^ useCache ifNil: [
		useCache := true
	]
]

{
	#category : #interface,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepositoryGroup>>versionWithInfo: aVersionInfo [
	^self versionWithInfo: aVersionInfo ifNone: [ self error: 'Could not find version ', aVersionInfo name printString,'. Maybe you need to add a repository?' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepositoryGroup>>versionWithInfo: aVersionInfo ifNone: aBlock [
	self repositoriesDo: [:ea | (ea versionWithInfo: aVersionInfo) ifNotNil: [:v | ^ v]].
	^aBlock value
]
