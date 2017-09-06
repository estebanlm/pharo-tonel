"
Instruction ""send: selector"" or ""send: selector toSuperOf: behavior""
"
Class {
	#name : #IRSend,
	#superclass : #IRInstruction,
	#instVars : [
		'selector',
		'superOf'
	],
	#category : #OpalCompiler-Core-IR-Nodes,
	#timestamp : 'ajh 3/24/2003 23:57'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRSend>>accept: aVisitor [
	^ aVisitor visitSend: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRSend>>isSend [
	^true.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRSend>>isSuperSend [
    ^superOf notNil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRSend>>selector [
	^selector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRSend>>selector: symbol [

	selector := symbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRSend>>superOf [

	^ superOf 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRSend>>superOf: behavior [

	superOf := behavior
]
