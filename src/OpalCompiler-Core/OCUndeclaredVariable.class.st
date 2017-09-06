"
I am a Variable that is not declared.

I am like a global an association, but instead of Smalltalk globals, I live in the Undeclared global dictionary.
"
Class {
	#name : #OCUndeclaredVariable,
	#superclass : #OCAbstractVariable,
	#instVars : [
		'name'
	],
	#category : #OpalCompiler-Core-Semantics,
	#timestamp : 'MarcusDenker 7/2/2014 14:27'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCUndeclaredVariable class>>semanticNodeClass [
	^RBVariableNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCUndeclaredVariable>>assoc [
	^Undeclared associationAt: name
]

{
	#category : #emitting,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCUndeclaredVariable>>emitStore: methodBuilder [

	methodBuilder storeIntoLiteralVariable:  self assoc


]

{
	#category : #emitting,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCUndeclaredVariable>>emitValue: methodBuilder [

	methodBuilder pushLiteralVariable: self assoc.

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCUndeclaredVariable>>isUndeclared [

	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCUndeclaredVariable>>name [
	^ name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCUndeclaredVariable>>name: anObject [
	name := anObject
]
