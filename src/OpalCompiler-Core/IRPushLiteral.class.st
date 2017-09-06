"
Instruction ""pushLiteral: object""
"
Class {
	#name : #IRPushLiteral,
	#superclass : #IRInstruction,
	#instVars : [
		'literal'
	],
	#category : #OpalCompiler-Core-IR-Nodes,
	#timestamp : 'ajh 3/24/2003 23:56'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushLiteral>>accept: aVisitor [
	^ aVisitor visitPushLiteral: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushLiteral>>canBeQuickReturn [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushLiteral>>isPushLiteral [

	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushLiteral>>isPushLiteral: valueTest [
	^ valueTest value: literal
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushLiteral>>literal [

	^ literal
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushLiteral>>literal: object [

	literal := object
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushLiteral>>quickRetNode [
	^ IRReturnLiteral new
		literal: literal;
		yourself
]
