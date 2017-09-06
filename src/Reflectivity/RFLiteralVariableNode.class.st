"
I am a global binding. 
"
Class {
	#name : #RFLiteralVariableNode,
	#superclass : #RBProgramNode,
	#instVars : [
		'binding'
	],
	#category : #Reflectivity-Compiler,
	#timestamp : 'MarcusDenker 10/20/2015 15:45'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFLiteralVariableNode class>>value: anObject [
	^self new binding: #RFMetaLink -> anObject
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFLiteralVariableNode>>acceptVisitor: aProgramNodeVisitor [
	^ aProgramNodeVisitor visitLiteralVariableNode:  self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFLiteralVariableNode>>binding  [
	^binding
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFLiteralVariableNode>>binding: anAssocation [
	binding := anAssocation
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFLiteralVariableNode>>isFaulty [
	^false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFLiteralVariableNode>>start [
	^0
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFLiteralVariableNode>>stop [
	^1
]
