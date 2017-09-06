"

"
Trait {
	#name : #MalTNormalize,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Moose-Algos-Graph,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalTNormalize>>normalize: aCollectionOfNodes [

	| firstNode perm |
	firstNode := aCollectionOfNodes detectMin: [:n| n printString ].
	perm := aCollectionOfNodes copy.
	[ firstNode = perm first ] whileFalse: [
		perm addLast: perm removeFirst ].
	^ perm
]
