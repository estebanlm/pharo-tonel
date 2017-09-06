"
value of a variable read or assignment
"
Class {
	#name : #RFValueReification,
	#superclass : #RFReification,
	#category : #Reflectivity-Links,
	#timestamp : 'MarcusDenker 5/25/2015 11:13'
}

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFValueReification class>>entities [
	^{RBVariableNode. RBAssignmentNode. RBReturnNode. RBMessageNode . LiteralVariable . Slot}
]

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFValueReification class>>key [
	^#value
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFValueReification>>genForInstanceVariableSlot [
	"entity in this case is the binding of the instance variable"
	^RBMessageNode receiver: entity asLiteralNode selector: #read: arguments: { RBVariableNode named: 'self' }
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFValueReification>>genForLiteralVariable [
	"entity in this case is the binding of the literal variable"
	^entity value asLiteralNode
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFValueReification>>genForRBAssignmentNode [
	^RBVariableNode named: entity variable name
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFValueReification>>genForRBMessageNode [
	^RBVariableNode named: #RFReifyValueVar
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFValueReification>>genForRBReturnNode [
	^RBVariableNode named: #RFReifyValueVar
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFValueReification>>genForRBVariableNode [
	entity isGlobal ifTrue: [^entity binding value asLiteralNode]. 
	^RBVariableNode named: entity name.
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFValueReification>>preamble: aNode [
	(aNode isKindOf: RBProgramNode) ifFalse: [ ^#() ].
	^(aNode isReturn or: [ aNode isMessage])
		ifTrue: [RFStoreIntoTempNode named: #RFReifyValueVar]
		ifFalse: [ #() ]. 
]
