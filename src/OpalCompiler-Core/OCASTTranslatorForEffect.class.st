"
I override some methods in my super to generate instructions for effect only.
"
Class {
	#name : #OCASTTranslatorForEffect,
	#superclass : #OCASTTranslator,
	#category : #OpalCompiler-Core-Translator,
	#timestamp : 'ajh 3/24/2003 22:20'
}

{
	#category : #'inline messages',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCASTTranslatorForEffect>>emitAnd: aMessageNode [
	
	super emitAnd: aMessageNode.
	methodBuilder popTop.
]

{
	#category : #'inline messages',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCASTTranslatorForEffect>>emitIfFalse: aMessageNode [

	valueTranslator visitNode: aMessageNode receiver.
	methodBuilder jumpAheadTo: #else if: true.
		self visitInlinedBlockNode: aMessageNode arguments first.
	methodBuilder jumpAheadTarget: #else.

]

{
	#category : #'inline messages',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCASTTranslatorForEffect>>emitIfNotNil: aMessageNode [
	| args |
	valueTranslator visitNode: aMessageNode receiver.
	args := aMessageNode arguments.
	args first arguments ifNotEmpty: [ args first arguments first binding emitStore: methodBuilder ].
	methodBuilder pushLiteral: nil.
	methodBuilder send: #==.
	methodBuilder jumpAheadTo: #end if: true.
	self visitInlinedBlockNode: args first.
	methodBuilder jumpAheadTarget: #end.
	
]

{
	#category : #'inline messages',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCASTTranslatorForEffect>>emitIfTrue: aMessageNode [

	valueTranslator visitNode: aMessageNode receiver.
	methodBuilder jumpAheadTo: #else if: false.	
		self visitInlinedBlockNode: aMessageNode arguments first.
	methodBuilder jumpAheadTarget: #else.
]

{
	#category : #'visitor-double dispatching',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCASTTranslatorForEffect>>emitMessageNode: aMessageNode  [

	super emitMessageNode: aMessageNode.
	methodBuilder popTop.

]

{
	#category : #'inline messages',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCASTTranslatorForEffect>>emitOr: aMessageNode [

	super emitOr: aMessageNode.
	methodBuilder popTop.
]

{
	#category : #'visitor-double dispatching',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCASTTranslatorForEffect>>visitArrayNode: anArrayNode  [
	"An arrayNode may have side effect, for example: '{self foo}'. So we cannot just generate nothing for this node."

	super visitArrayNode: anArrayNode.
	methodBuilder popTop.

]

{
	#category : #'visitor-double dispatching',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCASTTranslatorForEffect>>visitAssignmentNode: anAssignmentNode  [

	super visitAssignmentNode: anAssignmentNode .
	methodBuilder popTop. 
]

{
	#category : #'visitor-double dispatching',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCASTTranslatorForEffect>>visitBlockNode: aBlockNode  [

	"A block has no side effect, so a block translated for effect just doesn't generate anything" 

]

{
	#category : #'visitor-double dispatching',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCASTTranslatorForEffect>>visitLiteralArrayNode: aLiteralNode [
	"when visiting a literal array for effect, we could push it and then pop it, but we do nothing"
	methodBuilder addLiteral: aLiteralNode value
]

{
	#category : #'visitor-double dispatching',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCASTTranslatorForEffect>>visitLiteralNode: aLiteralNode [
	"when visiting a literal for effect, we could push it and then pop it, but we do nothing"
	methodBuilder addLiteral: aLiteralNode value
]

{
	#category : #'visitor-double dispatching',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCASTTranslatorForEffect>>visitParseErrorNode: anErrorNode   [

	super visitParseErrorNode: anErrorNode.
	methodBuilder popTop.

]

{
	#category : #'visitor-double dispatching',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCASTTranslatorForEffect>>visitSequenceNode: aSequenceNode  [
	aSequenceNode statements do: [:each | self visitNode: each].
]

{
	#category : #'visitor-double dispatching',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCASTTranslatorForEffect>>visitVariableNode: aVariableNode [
	"when visiting a variable for effect, we could push it and then pop it, but we do nothing"
	| binding |
	binding := aVariableNode binding.
	(binding isLiteralVariable or: [ binding isUndeclared ])
		ifTrue: [ methodBuilder addLiteral: binding assoc ]
]
