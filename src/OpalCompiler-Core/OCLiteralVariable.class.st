"
I am a global, pool, or class variable.
"
Class {
	#name : #OCLiteralVariable,
	#superclass : #OCAbstractVariable,
	#instVars : [
		'assoc'
	],
	#category : #OpalCompiler-Core-Semantics,
	#timestamp : 'ajh 3/24/2003 21:53'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCLiteralVariable class>>semanticNodeClass [

	^RBGlobalNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCLiteralVariable>>assoc [
	^ assoc
]

{
	#category : #initializing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCLiteralVariable>>assoc: anAssociation [

	assoc := anAssociation
]

{
	#category : #emitting,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCLiteralVariable>>emitStore: methodBuilder [

	 assoc emitStore: methodBuilder


]

{
	#category : #emitting,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCLiteralVariable>>emitValue: methodBuilder [
	assoc emitValue: methodBuilder
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCLiteralVariable>>isClassVariable [
	^ assoc isClassVariable
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCLiteralVariable>>isFromSharedPool [
	| sharedPools |
	sharedPools := scope getClass baseClass sharedPools.
	^ sharedPools 
		detect: [ :pool | pool classVarNames includes: assoc key ]
		ifFound: [ true ]
		ifNone: [ false ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCLiteralVariable>>isGlobal [

	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCLiteralVariable>>isGlobalClassNameBinding [
	^ (self value isClass or: [ self value isTrait ])
		and: [ self variable key == self value name ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCLiteralVariable>>isGlobalVariable [
	^ assoc isGlobalVariable
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCLiteralVariable>>isLiteralVariable [
	^true.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCLiteralVariable>>isWritable [
	"Literal variables are writable, if they aren't global bindings for class names, like
 #Object -> Object "

	^ (self isGlobalVariable and: [ self isGlobalClassNameBinding ]) not
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCLiteralVariable>>name [

	^ assoc name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCLiteralVariable>>value [
	^assoc value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCLiteralVariable>>variable [
	^assoc
]
