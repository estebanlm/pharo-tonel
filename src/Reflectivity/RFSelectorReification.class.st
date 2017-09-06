"
I am the selector of a message send or method
"
Class {
	#name : #RFSelectorReification,
	#superclass : #RFReification,
	#category : #Reflectivity-Links,
	#timestamp : 'MarcusDenker 5/25/2015 11:10'
}

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFSelectorReification class>>entities [
	^{RBMessageNode. RBMethodNode}
]

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFSelectorReification class>>key [
	^#selector
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFSelectorReification>>genForRBMessageNode [
	^entity selector asLiteralNode
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFSelectorReification>>genForRBMethodNode [
	^entity selector asLiteralNode
]
