"
Loading for specific packages using Gofer
"
Class {
	#name : #GoferLoad,
	#superclass : #GoferOperation,
	#category : #Gofer-Core,
	#timestamp : 'TorstenBergmann 2/5/2014 09:31'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferLoad>>addResolved: aResolvedReference [
	| version |
	version := aResolvedReference version.
	(self versions includes: version)
		ifTrue: [ ^ self ].
	self versions addLast: version.
	version dependencies do: [ :dependency |
		self addResolved: ((GoferVersionReference
			name: dependency versionInfo name) resolveWith: self gofer) ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferLoad>>defaultModel [
	^ MCVersionLoader new
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferLoad>>execute [
	self model hasVersions
		ifTrue: [ self model load ].
	self updateRepositories.
	self updateCategories
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferLoad>>initializeOn: aGofer [
	super initializeOn: aGofer.
	aGofer resolved
		do: [ :each | self addResolved: each ]
		displayingProgress: 'Loading Versions'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferLoad>>updateCategories [
	"This method makes sure that the categories are ordered in load-order and as specified in the packages."

	| categories |
	categories := OrderedCollection new.
	self versions do: [ :version |
		version snapshot definitions do: [ :definition |
			definition isOrganizationDefinition ifTrue: [
				definition categories do: [ :category |
					(categories includes: category)
						ifFalse: [ categories addLast: category ] ] ] ] ].
	(MCOrganizationDefinition categories: categories)
		postloadOver: nil
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferLoad>>updateRepositories [
	"This code makes sure that all packages have a repository assigned, including the dependencies."

	self versions do: [ :version |
		gofer repositories do: [ :repository | 
			version workingCopy repositoryGroup
				addRepository: repository ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferLoad>>versions [
	^ model versions
]
