"
I reify the sender for message sends and methods
"
Class {
	#name : #RFSenderReification,
	#superclass : #RFReification,
	#category : #Reflectivity-Links,
	#timestamp : 'MarcusDenker 5/26/2015 17:04'
}

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFSenderReification class>>entities [
	^{RBMessageNode . RBMethodNode}
]

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFSenderReification class>>key [
	^#sender
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFSenderReification>>genForRBMessageNode [
	^RBVariableNode named: 'self'
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFSenderReification>>genForRBMethodNode [
	^RBMessageNode 
		receiver: (RBMessageNode 
			receiver: (RBVariableNode named: 'thisContext')
			selector: #sender)
		selector: #receiver.
		
]
