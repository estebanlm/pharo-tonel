"
I modelt the scope of a block
"
Class {
	#name : #OCBlockScope,
	#superclass : #OCAbstractMethodScope,
	#category : #OpalCompiler-Core-Semantics,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCBlockScope>>hasEscapingVars [
	^ (copiedVars isEmpty and: [tempVector isEmpty]) not
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCBlockScope>>inComingCopiedVars [
	^ copiedVars select: [:each | outerScope copiedVars includes: each].
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCBlockScope>>isBlockScope [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCBlockScope>>isInsideOptimizedLoop [
	^ self outerScope isInsideOptimizedLoop
]

{
	#category : #lookup,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCBlockScope>>nextLexicalContextOf: aContext [

	"Returns the next context to lookup a variable name from within this Scope.
	A method should continue looking up a variable from the outerContext.
	
	A BlockClosure's next lexical context is the context where it was created from, and it can access variables from it."
	^ aContext home
]

{
	#category : #lookup,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCBlockScope>>nextOuterScopeContextOf: aContext [

	"Returns the next context to lookup a variable name from within outer scope.
	If it is block context then we return outer context for lookup.
	But if it is method context lookup will continue in same context but within outer scope"
	^ aContext outerContext ifNil: [ aContext ]
]

{
	#category : #lookup,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCBlockScope>>outerScopeLookupVar: name inContext: aContext [
	^ self outerScope 
		lookupVar: name
		inContext: (self nextOuterScopeContextOf: aContext)
]
