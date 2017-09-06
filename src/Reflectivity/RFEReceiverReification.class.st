"
I reify the receiver of a Message or a method
"
Class {
	#name : #RFEReceiverReification,
	#superclass : #RFReification,
	#category : #Reflectivity-Links,
	#timestamp : 'MarcusDenker 6/10/2015 13:45'
}

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFEReceiverReification class>>entities [
	^{RBMethodNode. RBMessageNode}
]

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFEReceiverReification class>>key [
	^#receiver
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFEReceiverReification>>genForRBMessageNode [
	^RBTemporaryNode named: #RFReceiverReificationVar.
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFEReceiverReification>>genForRBMethodNode [
	^RBMessageNode 
		receiver: (RBVariableNode named: 'thisContext')
		selector: #receiver 
	
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFEReceiverReification>>preamble: aNode [
	^aNode isMessage 
		ifTrue: [self preambleForMessage: aNode]
		ifFalse: [{}]
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFEReceiverReification>>preambleForMessage: aNode [
	| preamble |
	preamble := OrderedCollection new.

	(1 to: aNode numArgs) reverseWithIndexDo: [:each :index |  
			| name |
			name := 'RFArg', index asString, 'RFReification'.
			preamble add:  (RFStorePopIntoTempNode named: name).
	].
	preamble 
		add: (RFStoreIntoTempNode named: #RFReceiverReificationVar).
		(1 to: aNode numArgs) withIndexDo: [:each :index |  
			| name |
			name := 'RFArg', index asString, 'RFReification'.
			preamble add:  (RBTemporaryNode named: name).
	].

	^ preamble
]
