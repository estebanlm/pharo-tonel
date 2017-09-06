"
I am a symbol table where variable names are associated with SemVars.  Each context (method/closure) get a fresh scope that inherits from its outer scope.
"
Class {
	#name : #OCAbstractScope,
	#superclass : #Object,
	#instVars : [
		'outerScope',
		'node',
		'children'
	],
	#category : #OpalCompiler-Core-Semantics,
	#timestamp : 'ajh 3/24/2003 21:53'
}

{
	#category : #initializing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractScope>>addChild: aScope [
	self children add: aScope
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractScope>>children [
	^children ifNil: [ children := OrderedCollection new ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractScope>>hasTempVector [
	^ false
]

{
	#category : #decompiling,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractScope>>instanceScope [

	^self outerScope instanceScope
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractScope>>isBlockScope [

	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractScope>>isInsideOptimizedLoop [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractScope>>isInstanceScope [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractScope>>isMethodScope [

	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractScope>>isOptimizedBlockScope [
	^false
]

{
	#category : #lookup,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractScope>>lookupSelector: name [

	Symbol hasInterned: name ifTrue: [ :sym | ^ sym].
	^ nil
]

{
	#category : #lookup,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractScope>>lookupVar: name [
	"subclass responsibility"

	^ self outerScope lookupVar: name
]

{
	#category : #lookup,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractScope>>lookupVar: name inContext: aContext [

	^ self outerScope lookupVar: name inContext: aContext outerContext
]

{
	#category : #lookup,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractScope>>lookupVarForDeclaration: name [
	"subclass responsibility"

	^ self outerScope lookupVarForDeclaration: name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractScope>>node [
	^node
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractScope>>node: aNode [
	node := aNode
]

{
	#category : #levels,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractScope>>outerScope [

	^ outerScope
]

{
	#category : #initializing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractScope>>outerScope: aSemScope [

	outerScope := aSemScope.
	aSemScope addChild: self. 
]

{
	#category : #lookup,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractScope>>possibleSelectorsFor: string [

	^ Symbol possibleSelectorsFor: string
]

{
	#category : #levels,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractScope>>scopeLevel [

	outerScope ifNil: [^ 0].
	^ outerScope scopeLevel + 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractScope>>variableNamed: aName [

	^ self variableNamed: aName ifAbsent: [ nil ]
]
