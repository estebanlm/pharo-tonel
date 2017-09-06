"
A GoferReference is an abstract superclass for various kinds of references to Monticello packages and versions.
"
Class {
	#name : #GoferReference,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #Gofer-Core,
	#timestamp : 'lr 1/30/2010 14:38'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferReference class>>name: aString [
	^ self basicNew initializeName: aString
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferReference class>>new [
	self error: 'Use #name: to initialize the receiver.'
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferReference>>= aReference [
	^ self class = aReference class and: [ self name = aReference name ]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferReference>>hash [
	^ self name hash
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferReference>>initializeName: aString [
	name := aString
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferReference>>isConfigurationReference [
	^ false
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferReference>>matches: aResolvedReference [
	"Answer true if the receiver matches aResolvedReference."

	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferReference>>name [
	"Answer the name of this reference."
	
	^ name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferReference>>packageName [
	"Answer the package name."
	
	self subclassResponsibility
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferReference>>printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' name: '; print: self name
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferReference>>resolveAllWith: aGofer [
	"Answer a sorted collection of all resolved references within aGofer."

	^ aGofer allResolved select: [ :each | self matches: each ]
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferReference>>resolveWith: aGofer [
	"Answer a single resolved reference with aGofer configuration, throw an error if the version can't be found.'"

	| references |
	references := self resolveAllWith: aGofer.
	^ references isEmpty
		ifTrue: [ self error: 'Unable to resolve ' , self name ]
		ifFalse: [ references last ]
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferReference>>workingCopy [
	"Answer a working copy or throw an error if not present."

	^ self workingCopyIfAbsent: [ self error: 'Working copy for ' , self name , ' not found' ]
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferReference>>workingCopyIfAbsent: aBlock [
	"Answer a working copy or throw an error if not present."

	^ MCWorkingCopy allManagers
		detect: [ :each | self packageName = each packageName ]
		ifNone: aBlock
]
