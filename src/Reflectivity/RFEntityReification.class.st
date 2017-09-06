"
#entity stands for the structural entity that the link is installed on. It is #node for AST nodes, #variable for variables.
"
Class {
	#name : #RFEntityReification,
	#superclass : #RFReification,
	#category : #Reflectivity-Links,
	#timestamp : 'MarcusDenker 9/29/2015 13:27'
}

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFEntityReification class>>entities [
	^{RBProgramNode. LiteralVariable. Slot}.
]

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFEntityReification class>>key [
	^#entity
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFEntityReification>>genForInstanceVariableSlot [
	
	^entity asLiteralNode
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFEntityReification>>genForLiteralVariable [
	"entity in this case is the binding of the literal variable"
	^entity asLiteralNode
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFEntityReification>>genForRBProgramNode [
	
	^entity asLiteralNode
]
