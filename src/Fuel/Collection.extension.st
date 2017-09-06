Extension {
	#name : #Collection
}

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
Collection>>addIfNotPresent: anObject ifPresentDo: aBlock [
	"Include anObject as one of the receiver's elements and then value aBlock, but only if there
	is no such element already. Anwser anObject."

	(self includes: anObject) 
		ifFalse: [ self add: anObject ]
		ifTrue: [ aBlock value ].
	^ anObject
]
