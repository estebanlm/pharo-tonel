"
A GoferVersionReference refers to a specific version of a Monticello package.
"
Class {
	#name : #GoferVersionReference,
	#superclass : #GoferReference,
	#instVars : [
		'package',
		'author',
		'branch',
		'versionNumber'
	],
	#category : #Gofer-Core,
	#timestamp : 'lr 12/9/2009 22:50'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferVersionReference>>author [
	"Answer the author of the receiver."
	
	^ author
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferVersionReference>>branch [
	"Answer the branch of the receiver."
	
	^ branch
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferVersionReference>>initializeName: aString [
	super initializeName: aString.
	self parseName: aString
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferVersionReference>>matches: aResolvedReference [
	^ self name = aResolvedReference name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferVersionReference>>packageName [
	"Answer the package of the receiver."

	^ package
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferVersionReference>>parseName: aString [
	| basicName |
	basicName := aString last isDigit
		ifTrue: [ aString ]
		ifFalse: [ (aString copyUpToLast: $.) copyUpTo: $( ].
	package := basicName copyUpToLast: $-.
	(package includes: $.)
		ifFalse: [ branch := '' ]
		ifTrue: [
			branch := package copyAfter: $..
			package := package copyUpTo: $. ].
	author := (basicName copyAfterLast: $-) copyUpToLast: $..
	versionNumber := (basicName copyAfterLast: $-) copyAfterLast: $..
	(versionNumber notEmpty and: [ versionNumber allSatisfy: [ :each | each isDigit ] ])
		ifTrue: [ versionNumber := versionNumber asInteger ]
		ifFalse: [ versionNumber := 0 ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferVersionReference>>versionNumber [
	"Answer the version of the receiver."

	^ versionNumber
]
