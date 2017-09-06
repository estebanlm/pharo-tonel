"
push inst var
"
Class {
	#name : #IRPushInstVar,
	#superclass : #IRInstVarAccess,
	#category : #OpalCompiler-Core-IR-Nodes,
	#timestamp : 'ClementBer 10/14/2014 14:47'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushInstVar>>accept: aVisitor [
	^ aVisitor visitPushInstVar: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushInstVar>>canBeQuickReturn [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushInstVar>>quickRetNode [
	^ IRReturnInstVar new
		index: index;
		yourself
]
