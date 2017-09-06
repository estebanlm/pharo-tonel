"
I include all variable enries for class, pool and global vars.
"
Class {
	#name : #OCClassScope,
	#superclass : #OCAbstractScope,
	#instVars : [
		'class'
	],
	#category : #OpalCompiler-Core-Semantics,
	#timestamp : 'ajh 3/24/2003 21:44'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCClassScope class>>for: aClass [
	^self new 
		class: aClass;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCClassScope>>class: aBehavior [

	class := aBehavior
]

{
	#category : #lookup,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCClassScope>>findVariable: lookupBlock ifNone: notFoundBlock  [

	^class findGlobalVariable: lookupBlock ifNone: notFoundBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCClassScope>>getClass [
	^class
]

{
	#category : #levels,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCClassScope>>instanceScope [

	^ OCInstanceScope new
		slots: class allSlots;
		outerScope: self;
		yourself
]

{
	#category : #lookup,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCClassScope>>lookupVar: name [
	"Return a SemVar for my pool var with this name.  Return nil if none found"

	^(class bindingOf: name asSymbol) ifNotNil: [:assoc | 
		OCLiteralVariable new 
			assoc: assoc; 
			scope: self; 
			yourself]

]

{
	#category : #lookup,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCClassScope>>lookupVar: name inContext: aContext [
	"I'll lookup a variable in a class. The context does not play any role in here because variables in classes are statically defined"

	^ self lookupVar: name
]

{
	#category : #lookup,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCClassScope>>lookupVarForDeclaration: name [
	^self lookupVar: name
]

{
	#category : #levels,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCClassScope>>newMethodScope [
	^ self instanceScope newMethodScope
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCClassScope>>printOn: stream [

	class printOn: stream.
]

{
	#category : #lookup,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCClassScope>>variableNamed: name ifAbsent: aBlock [
	"Return a SemVar for my pool var with this name.  Return nil if none found"

	^(class bindingOf: name asSymbol) ifNotNil: [:assoc | 
		OCLiteralVariable new 
			assoc: assoc; 
			scope: self; 
			yourself] ifNil: aBlock
]
