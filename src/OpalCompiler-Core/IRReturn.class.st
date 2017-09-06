"
Instruction ""returnTop""
"
Class {
	#name : #IRReturn,
	#superclass : #IRInstruction,
	#category : #OpalCompiler-Core-IR-Nodes,
	#timestamp : '<historical>'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRReturn>>accept: aVisitor [
	^ aVisitor visitReturn: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRReturn>>isReturn [

	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRReturn>>nonBodySuccessorSequences [
	^#()
]
