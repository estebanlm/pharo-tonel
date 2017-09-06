"
Instruction ""pushDup""
"
Class {
	#name : #IRPushDup,
	#superclass : #IRInstruction,
	#category : #OpalCompiler-Core-IR-Nodes,
	#timestamp : 'ajh 3/24/2003 23:56'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushDup>>accept: aVisitor [
	^ aVisitor visitPushDup: self
]
