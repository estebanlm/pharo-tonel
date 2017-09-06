"
A GoferPackageReference refers to the latest version of a Monticello package satisfying an additional constraint.
"
Class {
	#name : #GoferConstraintReference,
	#superclass : #GoferPackageReference,
	#instVars : [
		'constraintBlock'
	],
	#category : #Gofer-Core,
	#timestamp : 'lr 1/30/2010 14:37'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferConstraintReference class>>name: aString constraint: aBlock [
	^ self basicNew initializeName: aString constraint: aBlock
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferConstraintReference>>initializeName: aString constraint: aBlock [
	self initializeName: aString.
	constraintBlock := aBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferConstraintReference>>matches: aResolvedReference [
	^ (super matches: aResolvedReference) and: [ constraintBlock value: aResolvedReference ]
]
