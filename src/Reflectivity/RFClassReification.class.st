"
request reification of the class
"
Class {
	#name : #RFClassReification,
	#superclass : #RFReification,
	#category : #Reflectivity-Links,
	#timestamp : 'MarcusDenker 7/6/2015 18:16'
}

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFClassReification class>>entities [
	^{RBProgramNode. LiteralVariable. Slot}
]

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFClassReification class>>key [
	^#class
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFClassReification>>genForInstanceVariableSlot [
	^self generate
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFClassReification>>genForLiteralVariable [
	^self generate
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFClassReification>>genForRBProgramNode [
	^self generate
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFClassReification>>generate [
	^RBMessageNode 
		receiver: (RBVariableNode named: 'self')
		selector: #class
]
