"
I am a simple object used to cache the patch in order to save a bit of time
"
Class {
	#name : #KomitPackage,
	#superclass : #KomitObject,
	#instVars : [
		'package',
		'classes',
		'isFullyCommited',
		'dataRetriever',
		'patch'
	],
	#classInstVars : [
		'packages'
	],
	#category : #Komitter-Models,
	#timestamp : '<historical>'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPackage class>>initialize [

	packages := Dictionary new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPackage class>>package: package [

	^ self new
		package: package;
		yourself
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPackage class>>removePackage: package [

	(packages 
		removeKey: package package name
		ifAbsent: [ ^ self ]) flush
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPackage>><= aKomitObject  [

	^ self package name <= aKomitObject package name
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPackage>>= another [

	^ self species = another species and: [ self package = another package ]
]

{
	#category : #accesing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPackage>>classNamed: aString  [
	
	^ classes at: aString ifAbsentPut: [ KomitClass new trackedClass: aString  ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPackage>>classes [

	classes ifNil: [
		classes := Dictionary new.
		self patch
			ifNil: [ #() ] 
			ifNotNil: [ :p |
				p operations 
					do: [ :each | | komitClass | 
						each definition className ifNotNil: [
							komitClass := (self classNamed: each definition className).
							each definition addOperation: each on: komitClass ] ] ].
	].
	^ classes values
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPackage>>flush [
	super flush.
	
	classes ifNotNil: [ classes do: [ :each | each flush ] ].
	classes := nil.
	isFullyCommited := true
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPackage>>hash [

	^ self package hash
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPackage>>initialize [

	super initialize.

	expanded := true.
	isFullyCommited := true.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPackage>>isEmpty [

	^ self package isEmpty
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPackage>>isFullyCommited [
	^ isFullyCommited
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPackage>>isFullyCommited: anObject [
	isFullyCommited := anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPackage>>isPackage [

	^ true
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPackage>>koDestinationText [
	^ ''
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPackage>>koSourceText [
	^ 'No changes'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPackage>>package [
	^ package
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPackage>>package: aPackage [

	package := aPackage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPackage>>patch [
	^ patch ifNil: [ patch := self package patch ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPackage>>printOn: aStream [

	super printOn: aStream.
	aStream << '[ '.
	self package name printOn: aStream.
	aStream << ' ]'.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitPackage>>remotes [

	^ self package remotes
]
