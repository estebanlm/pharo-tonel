"
Common superclass for workin copies in Gofer
"
Class {
	#name : #GoferWorking,
	#superclass : #GoferOperation,
	#instVars : [
		'workingCopies'
	],
	#category : #Gofer-Core,
	#timestamp : 'TorstenBergmann 2/5/2014 09:34'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferWorking>>addReference: aReference [
	| workingCopy |
	workingCopy := aReference workingCopyIfAbsent: [ ^ self ].
	(self workingCopies includes: workingCopy)
		ifTrue: [ ^ self ].
	self workingCopies addLast: workingCopy.
	workingCopy requiredPackages do: [ :package |
		self addReference: (GoferPackageReference
			name: package name) ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferWorking>>initialize [
	super initialize.
	workingCopies := OrderedCollection new
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferWorking>>initializeOn: aGofer [
	super initializeOn: aGofer.
	aGofer references 
		do: [ :each | self addReference: each ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferWorking>>workingCopies [
	"Answer the working copies to be operated on."

	^ workingCopies
]
