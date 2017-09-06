Extension {
	#name : #RBCascadeNode
}

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
RBCascadeNode>>leftmostChainReceiver [

	^ self receiver isMessage
		ifTrue: [ self receiver receiver ]
		ifFalse: [ self receiver ]
]
