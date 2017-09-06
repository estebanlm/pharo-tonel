"
A Metacello repository
"
Class {
	#name : #MCRepository,
	#superclass : #Object,
	#instVars : [
		'creationTemplate'
	],
	#classVars : [
		'Settings'
	],
	#category : #Monticello-Repositories,
	#timestamp : 'TorstenBergmann 2/5/2014 13:54'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepository class>>allConcreteSubclasses [
	^ self withAllSubclasses reject: [:ea | ea isAbstract]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepository class>>creationTemplate [
	self subclassResponsibility.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepository class>>description [
	^ nil
]

{
	#category : #'request handling',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepository class>>fillInTheBlankRequest [
	self subclassResponsibility.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepository class>>fromUrl: aUrlOrString  [
	| url |
	url := aUrlOrString asUrl.

	^ self allSubclasses 
		detect: [ :each | 
			(each class includesSelector: #urlSchemes)
			and: [ each urlSchemes includes: url scheme ] ]
		ifFound: [ :repositoryClass | repositoryClass basicFromUrl: url ]
		ifNone: [ MCRepositoryError signal: 'Cannot instantiate a repository from the url: ', url asString ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepository class>>isAbstract [
	^ self description isNil
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepository class>>morphicConfigure [
	^ self new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepository class>>urlSchemes [
	"Returns the URL schemes used to describe this repository"
	^ #()
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepository>>= other [
	^ other species = self species and: [other description = self description]
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepository>>addTo: aRepository [
	^ aRepository addBasicRepository: self
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepository>>asCreationTemplate [
	^ self creationTemplate
]

{
	#category : #storing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepository>>basicStoreVersion: aVersion [
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepository>>closestAncestorVersionFor: anAncestry ifNone: errorBlock [
	anAncestry breadthFirstAncestorsDo:
		[:ancestorInfo |
		(self versionWithInfo: ancestorInfo) ifNotNil: [:v | ^ v]].
	^ errorBlock value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepository>>creationTemplate [
	^ creationTemplate
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepository>>creationTemplate: aString [
	self creationTemplate ifNotNil: [ self error: 'Creation template already set for this MCRepository instance.' ].
	
	creationTemplate := aString.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepository>>description [
	^ self class name
]

{
	#category : #'error handling',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepository>>error: aString  [
	^ MCRepositoryError new signal: aString
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepository>>hash [
	^ self description hash
]

{
	#category : #interface,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepository>>includesVersionNamed: aString [
	self subclassResponsibility
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepository>>isValid [
	^true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepository>>possiblyNewerVersionsOfAnyOf: someVersions [
	^#()
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepository>>printOn: aStream [
	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self description;
		nextPut: $).
]

{
	#category : #storing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepository>>storeDependencies: aVersion [
	MCCacheRepository uniqueInstance cacheAllFileNamesDuring: 
		[self cacheAllFileNamesDuring: 
			[aVersion allAvailableDependenciesDo:
				[:dep |
					(self includesVersionNamed: dep info name)
						ifFalse: [self storeVersion: dep]]]]
]

{
	#category : #storing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepository>>storeVersion: aVersion [
	self basicStoreVersion: aVersion.
	SystemAnnouncer uniqueInstance
		announce: (MCVersionSaved version: aVersion repository: self)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepository>>versionFrom: aVersionReferenceString [
	self error: 'Unable to load from ' , self printString
]

{
	#category : #interface,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepository>>versionWithInfo: aVersionInfo [
	^ self versionWithInfo: aVersionInfo ifAbsent: [nil]
]

{
	#category : #interface,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepository>>versionWithInfo: aVersionInfo ifAbsent: aBlock [
	self subclassResponsibility 
]
