"
I can be used to pass the context to the meta object
"
Class {
	#name : #RFThisContextReification,
	#superclass : #RFReification,
	#category : #Reflectivity-Links,
	#timestamp : 'MarcusDenker 5/25/2015 11:04'
}

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFThisContextReification class>>entities [
	^{RBProgramNode . LiteralVariable . Slot}
]

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFThisContextReification class>>key [
	^#context
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFThisContextReification>>genForInstanceVariableSlot [
	^RBThisContextNode named: #thisContext
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFThisContextReification>>genForLiteralVariable [
	^RBThisContextNode named: #thisContext
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFThisContextReification>>genForRBProgramNode [
	^RBThisContextNode named: #thisContext
]
