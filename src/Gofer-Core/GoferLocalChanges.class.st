"
Handling local changes
"
Class {
	#name : #GoferLocalChanges,
	#superclass : #GoferChanges,
	#category : #Gofer-Core,
	#timestamp : 'TorstenBergmann 2/5/2014 09:33'
}

{
	#category : #queries,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferLocalChanges>>sourceSnapshotOf: aReference [
	| ancestors reference |
	ancestors := aReference workingCopy ancestry ancestors.
	ancestors isEmpty ifTrue: [ ^ MCSnapshot new ].
	reference := GoferVersionReference name: ancestors first name.
	^ (reference resolveWith: self gofer) version snapshot
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferLocalChanges>>targetSnapshotOf: aReference [
	^ aReference workingCopy package snapshot
]
