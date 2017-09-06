"
Using the ObjectRefification, one can pass a pointer to the object where the link is installed in
"
Class {
	#name : #RFObjectReification,
	#superclass : #RFReification,
	#category : #Reflectivity-Links,
	#timestamp : 'MarcusDenker 4/29/2015 15:39'
}

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFObjectReification class>>entities [
	^{RBProgramNode. LiteralVariable. Slot}
]

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFObjectReification class>>key [
	^#object
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFObjectReification>>genForInstanceVariableSlot [
	^RBVariableNode named: 'self'
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFObjectReification>>genForLiteralVariable [
	^RBVariableNode named: 'self'
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFObjectReification>>genForRBProgramNode [
	^RBVariableNode named: 'self'
]
