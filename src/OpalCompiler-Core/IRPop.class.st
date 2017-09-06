"
Instruction ""popTop""
"
Class {
	#name : #IRPop,
	#superclass : #IRInstruction,
	#category : #OpalCompiler-Core-IR-Nodes,
	#timestamp : 'ajh 3/24/2003 23:57'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPop>>accept: aVisitor [
	^ aVisitor visitPop: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPop>>isPop [
	^true
]
