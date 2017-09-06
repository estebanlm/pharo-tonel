"
I reify #variable

- GlobaVar (or subclass) 
- Slot for ivars 
"
Class {
	#name : #RFVariableReification,
	#superclass : #RFReification,
	#category : #Reflectivity-Links,
	#timestamp : 'MarcusDenker 6/22/2015 13:58'
}

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFVariableReification class>>entities [
	^{RBVariableNode. LiteralVariable . Slot}
]

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFVariableReification class>>key [
	^#variable
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFVariableReification>>genForInstanceVariableSlot [
	"entity in this case is the binding of the literal variable"
	^entity asLiteralNode
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFVariableReification>>genForLiteralVariable [
	"entity in this case is the binding of the literal variable"
	^entity asLiteralNode
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFVariableReification>>genForRBVariableNode [
	
	entity isTemp ifTrue: [ ^self error: 'Temps can not be reified yet' ]. 
	^entity binding variable asLiteralNode
]
