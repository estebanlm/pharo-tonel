Extension {
	#name : #Association
}

{
	#category : #'*Morphic-Base',
	#timestamp : ' 8/31/2017 05:26:13'
}
Association>>head [

	^ (key isKindOf: Association)
		ifTrue: [ key head ]
		ifFalse: [ key ]
]

{
	#category : #'*Morphic-Base',
	#timestamp : ' 8/31/2017 05:26:13'
}
Association>>tail [

	^ (key isKindOf: Association)
		ifTrue: [ key tail -> value ]
		ifFalse: [ value ]
]
