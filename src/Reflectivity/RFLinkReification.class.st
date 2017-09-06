"
I reify the link itself. 
"
Class {
	#name : #RFLinkReification,
	#superclass : #RFReification,
	#category : #Reflectivity-Links,
	#timestamp : 'MarcusDenker 5/25/2015 11:00'
}

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFLinkReification class>>entities [
	^{RBProgramNode . LiteralVariable . Slot}
]

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFLinkReification class>>key [
	^#link
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFLinkReification>>genForInstanceVariableSlot [
	^link asLiteralNode
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFLinkReification>>genForLiteralVariable [
	^link asLiteralNode
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFLinkReification>>genForRBProgramNode [
	^link asLiteralNode
]
