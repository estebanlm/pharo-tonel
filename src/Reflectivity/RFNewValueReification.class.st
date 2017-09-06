"
reify newValue
"
Class {
	#name : #RFNewValueReification,
	#superclass : #RFReification,
	#category : #Reflectivity-Links,
	#timestamp : 'MarcusDenker 6/18/2015 11:07'
}

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFNewValueReification class>>entities [
	^{RBVariableNode. RBAssignmentNode}
]

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFNewValueReification class>>key [
	^#newValue
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFNewValueReification>>genForRBAssignmentNode [
	^RBTemporaryNode named: #RFNewValueReificationVar.
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFNewValueReification>>genForRBVariableNode [
	^RBTemporaryNode named: #RFNewValueReificationVar.
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFNewValueReification>>preamble: aNode [
		link control= #instead 
		ifTrue: [ ^RFStorePopIntoTempNode named: #RFNewValueReificationVar  ]
		ifFalse: [^RFStoreIntoTempNode named: #RFNewValueReificationVar  ]
	
	
]
