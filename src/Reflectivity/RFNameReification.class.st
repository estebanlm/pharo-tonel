"
I reify the name of variables
"
Class {
	#name : #RFNameReification,
	#superclass : #RFReification,
	#category : #Reflectivity-Links,
	#timestamp : 'MarcusDenker 6/9/2015 10:34'
}

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFNameReification class>>entities [
	^{RBVariableNode. RBAssignmentNode. LiteralVariable. Slot}.
]

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFNameReification class>>key [
	^#name
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFNameReification>>genForInstanceVariableSlot [
	^entity name asLiteralNode
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFNameReification>>genForLiteralVariable [
	^entity name asLiteralNode
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFNameReification>>genForRBAssignmentNode [
	^entity variable name asLiteralNode
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFNameReification>>genForRBVariableNode [
	^entity name asLiteralNode
]
