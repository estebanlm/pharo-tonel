"
Often one needs information from the base level at the meta level.

My classes model reifications of concept at the base level.
"
Class {
	#name : #RFReification,
	#superclass : #Object,
	#instVars : [
		'link',
		'entity'
	],
	#category : #Reflectivity-Links,
	#timestamp : 'MarcusDenker 4/29/2015 15:40'
}

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFReification class>>allKeys [
	^self subclasses collect: [:plugin | plugin key]
]

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFReification class>>entities [
	^self subclassResponsibility
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFReification class>>entity: aNodeOrVar link: aLink  [
	^self new
		link: aLink;
		entity: aNodeOrVar.
]

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFReification class>>for: aSelector [
	^ self subclasses detect: [ :class | class key = aSelector ]
]

{
	#category : #'plugin interface',
	#timestamp : ' 8/31/2017 07:16:26'
}
RFReification class>>key [
	^self subclassResponsibility
]

{
	#category : #acccessing,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFReification>>entity: aRBMessageNode  [
	entity := aRBMessageNode
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFReification>>genForClassVariable [
	^self genForLiteralVariable
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFReification>>genForGlobalVariable [
	^self genForLiteralVariable
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFReification>>genForInstanceVariableSlot [
	"overriden in subclass if needed"
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFReification>>genForLiteralVariable [
	"overriden in subclass if needed"
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFReification>>genForRBArgumentNode [
	^self genForRBTemporaryNode
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFReification>>genForRBAssignmentNode [
	^self genForRBProgramNode
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFReification>>genForRBBlockNode [
	^self genForRBProgramNode
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFReification>>genForRBCascadeNode [
	^self genForRBProgramNode 
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFReification>>genForRBGlobalNode [
	^self genForRBVariableNode 
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFReification>>genForRBInstanceVariableNode [
	^self genForRBVariableNode 
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFReification>>genForRBLiteralNode [
	^self genForRBProgramNode
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFReification>>genForRBLiteralValueNode [
	^self genForRBProgramNode 
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFReification>>genForRBMessageNode [
	^self genForRBProgramNode 
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFReification>>genForRBMethodNode [
	^self genForRBProgramNode 
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFReification>>genForRBProgramNode [
	"overriden in subclass if needed"
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFReification>>genForRBReturnNode [
	^self genForRBProgramNode
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFReification>>genForRBSelfNode [
	^self genForRBProgramNode 
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFReification>>genForRBSequenceNode [
	^self genForRBProgramNode
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFReification>>genForRBTemporaryNode [
	^self genForRBVariableNode
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFReification>>genForRBVariableNode [
	^self genForRBProgramNode
]

{
	#category : #acccessing,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFReification>>link: anUndefinedObject  [
	link := anUndefinedObject
]

{
	#category : #generate,
	#timestamp : ' 8/31/2017 07:16:26'
}
RFReification>>preamble: aNode [
	^#()
]
