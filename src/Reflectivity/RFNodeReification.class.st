"
I am the node that the link is installed on
"
Class {
	#name : #RFNodeReification,
	#superclass : #RFReification,
	#category : #Reflectivity-Links,
	#timestamp : 'MarcusDenker 5/25/2015 11:01'
}

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFNodeReification class>>entities [
	^{RBProgramNode}.
]

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFNodeReification class>>key [
	^#node
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFNodeReification>>genForRBProgramNode [
	^RFLiteralVariableNode value: entity
]
