"
In Smalltalk, methods like ifTrue: are inlined an there is no Block for the arguments of these message sends.
To be consistent, these blocks need nevertheless a scope.


"
Class {
	#name : #OCOptimizedBlockScope,
	#superclass : #OCBlockScope,
	#instVars : [
		'isInlinedLoop'
	],
	#category : #OpalCompiler-Core-Semantics,
	#timestamp : '<historical>'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCOptimizedBlockScope>>initialize [
	super initialize.
	isInlinedLoop := false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCOptimizedBlockScope>>isInsideOptimizedLoop [
	^ isInlinedLoop
		ifTrue: [true]
		ifFalse: [self outerScope isInsideOptimizedLoop]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCOptimizedBlockScope>>isOptimizedBlockScope [
	^ true
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCOptimizedBlockScope>>markInlinedLoop [
	isInlinedLoop := true
]

{
	#category : #lookup,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCOptimizedBlockScope>>nextLexicalContextOf: aContext [

	"Returns the next context to lookup a variable name from within this Scope.
	A method should continue looking up a variable from the outerContext.
	
	An inlined BlockClosure next lexical context is the same context, since no new context was created for this block closure"
	^ aContext
]

{
	#category : #lookup,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCOptimizedBlockScope>>nextOuterScopeContextOf: aContext [

	"Returns the next context to lookup a variable name from within outer scope.
	
	For inlined BlockClosure which I represent it will be same context because inlined blocks do not produce extra contexts on stack"
	^ aContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCOptimizedBlockScope>>outerNotOptimizedScope [
	^self outerScope outerNotOptimizedScope
]
