"
Update
"
Class {
	#name : #GoferUpdate,
	#superclass : #GoferWorking,
	#category : #Gofer-Core,
	#timestamp : 'TorstenBergmann 2/5/2014 09:36'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferUpdate>>addReference: aReference [
	super addReference: aReference.
	self model addVersion: ((self referenceFor: aReference)
		 resolveWith: self gofer) version
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferUpdate>>defaultModel [
	^ MCVersionLoader new
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferUpdate>>execute [
	self model hasVersions
		ifTrue: [ self model load ].
	self gofer cleanup
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferUpdate>>referenceFor: aReference [
	^ aReference
]
