"
Handling changes
"
Class {
	#name : #GoferChanges,
	#superclass : #GoferWorking,
	#category : #Gofer-Core,
	#timestamp : 'TorstenBergmann 2/5/2014 09:33'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferChanges>>addReference: aReference [
	super addReference: aReference.
	self model operations 
		addAll: (self patchsetOf: aReference) operations
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferChanges>>defaultModel [
	^ MCPatch operations: OrderedCollection new
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferChanges>>execute [
	^ self model
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferChanges>>patchsetOf: aReference [
	"Answer the source snapshot of aReference."
	
	| source target |
	source := self sourceSnapshotOf: aReference.
	target := self targetSnapshotOf: aReference.
	^ target patchRelativeToBase: source
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferChanges>>sourceSnapshotOf: aReference [
	"Answer the source snapshot of aReference."
	
	self subclassResponsibility
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferChanges>>targetSnapshotOf: aReference [
	"Answer the source snapshot of aReference."
	
	self subclassResponsibility
]
