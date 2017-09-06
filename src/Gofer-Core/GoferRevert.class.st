"
Revert work
"
Class {
	#name : #GoferRevert,
	#superclass : #GoferUpdate,
	#category : #Gofer-Core,
	#timestamp : 'TorstenBergmann 2/5/2014 09:36'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferRevert>>execute [
	self workingCopies
		do: [ :each | each modified: false ].
	super execute
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferRevert>>referenceFor: aReference [
	| ancestors |
	ancestors := aReference workingCopy ancestry ancestors.
	ancestors isEmpty ifTrue: [ ^ MCSnapshot new ].
	^ GoferVersionReference name: ancestors first name
]
