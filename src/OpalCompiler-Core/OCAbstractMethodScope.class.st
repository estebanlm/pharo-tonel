"
I am an abstract superclass for Block and Method scopes
"
Class {
	#name : #OCAbstractMethodScope,
	#superclass : #OCAbstractScope,
	#instVars : [
		'thisContextVar',
		'tempVars',
		'copiedVars',
		'tempVector',
		'id'
	],
	#category : #OpalCompiler-Core-Semantics,
	#timestamp : '<historical>'
}

{
	#category : #'temp vars',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>addCopiedTempToAllScopesUpToDefVector: aVariable [
		
	(self hasCopyingTempNamed: aVariable name)
		ifFalse: [self addCopyingTemp: aVariable ].
	self tempVectorName = aVariable name ifTrue: [^ self].
	^ self outerScope addCopiedTempToAllScopesUpToDefVector: aVariable.
]

{
	#category : #'temp vars',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>addCopyingTemp: aTempVar [
	^ copiedVars add: (OCCopyingTempVariable new
			originalVar: aTempVar originalVar;
			name: aTempVar name;
			escaping: aTempVar escaping;
			usage: aTempVar usage;
			scope: self;
			yourself)
]

{
	#category : #'temp vars',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>addCopyingTempNamed: name [
	^ copiedVars add: (OCCopyingTempVariable new
			name: name;
			scope: self;
			yourself)
]

{
	#category : #'temp vars',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>addCopyingTempToAllScopesUpToDefTemp: aVar [

	(self hasCopyingTempNamed: aVar name) ifFalse: [self addCopyingTemp: aVar].
	tempVars at: aVar name ifPresent: [:v | ^ self].
	^ self outerScope addCopyingTempToAllScopesUpToDefTemp: aVar.
				
]

{
	#category : #'temp vars',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>addCopyingTempToAllScopesUpToDefVector: aName [
		
	(self hasCopyingTempNamed: aName) ifFalse: [self addCopyingTempNamed: aName].
	self tempVectorName = aName  ifTrue: [^ self].
	^ self outerScope addCopyingTempToAllScopesUpToDefVector: aName.
]

{
	#category : #'temp vars',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>addTemp: name [
	^self addTemp: OCTempVariable new withName: name
]

{
	#category : #'temp vars',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>addTemp: aTempVariable withName: aString [
	^ tempVars
		at: aString
		put: (aTempVariable
				name: aString;
				scope: self;
				yourself)
]

{
	#category : #'temp vars',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>addVectorTemp: aTemp [
	^ tempVector 
		at:  aTemp name
		put: (OCVectorTempVariable new
			name: aTemp name;
			vectorName: self tempVectorName;
			scope: self;
			usage: aTemp usage;
			escaping: aTemp escaping;
			yourself)
]

{
	#category : #'temp vars',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>allTempNames [
	^self allTemps collect: #name.
]

{
	#category : #'temp vars',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>allTemps [
	"return all temps defined, even the ones in the outer scope that are not used in the current.
	 This includes the arguments
	 We do not need to care about shadowed temps as temp shadowing is not allowed."
	| temps |
	temps := OrderedCollection new.
	self outerScope allTemps do: [ :var |
	 	(self localTempNames includes: var name) ifFalse: [
			temps add: var.]
		].
	temps addAll: self localTemps.
	^temps asArray.
	
]

{
	#category : #'temp vars',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>copiedVars [
	^ copiedVars
]

{
	#category : #lookup,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>findVariable: aBlock ifNone: aNotFound [

	(aBlock value: thisContextVar) ifTrue: [^ thisContextVar].
	self allTemps
		detect: [ :var | aBlock value: var ]
		ifFound: [ :var | ^ var ].
	
	outerScope ifNotNil: [
		^  outerScope findVariable: aBlock ifNone: aNotFound ]
]

{
	#category : #'temp vars',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>hasCopyingTempNamed: name [
	^self copiedVars anySatisfy: [:each | each name = name]
]

{
	#category : #'temp vars',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>hasTempVector [
	^ tempVector isNotEmpty
]

{
	#category : #initializing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>id: int [
	id := int
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>initialize [

	tempVars :=  OrderedDictionary new.
	tempVector  := Dictionary new.
	copiedVars := OCKeyedSet keyBlock: [:var | var name].
	id := 0.
	
	thisContextVar := OCThisContextVariable new
		scope: self; yourself.

]

{
	#category : #'temp vars',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>localTempNames [
	^self localTemps collect: [:each | each name]
]

{
	#category : #'temp vars',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>localTemps [
	"all temps accessed in the context... for tempVectors, it takes all the vars even those not used here"
	| localVars |
	localVars := OrderedCollection new.
	self copiedVars do:  [:var |
		var isStoringTempVector 
			ifTrue: [var tempVectorForTempStoringIt do: [:tempVectorVars | localVars add: tempVectorVars]]
	].
	self tempVars do:  [:var | localVars add: var].
	^localVars asArray
]

{
	#category : #lookup,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>lookupTempVector: name inContext: aContext [
	"Similar to lookupVariable:inContext: but looks for a temp vector. If we don't find the temp vector (because it was nilled or not created), we lookup in the outer context with the corresponding outer scope"
	
	| variable theVector |
	variable := self
		variableNamed: name
		ifAbsent: [^ self outerScope lookupTempVector: name inContext: aContext outerContext ].
	theVector := variable readFromContext: aContext scope: self.
	theVector ifNil: [ ^ self outerScope lookupTempVector: name inContext: aContext outerContext ].
	^ { variable . theVector }
]

{
	#category : #lookup,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>lookupVar: name [
	copiedVars at: name ifPresent: [:v | ^ v].
	tempVector  at: name ifPresent: [:v | ^ v].
	tempVars at: name ifPresent: [:v | ^ v].
	name = 'thisContext' ifTrue: [^ thisContextVar].
	^self outerScope lookupVar: name
	
]

{
	#category : #lookup,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>lookupVar: name inContext: aContext [
	"We lookup a variable in a context. If it not in this context, we look in the outer context using the corresponding outer scope"
	
	| variable theValue |
	variable := self
		variableNamed: name
		ifAbsent: [ 	^self outerScopeLookupVar: name inContext: aContext].
	theValue := variable readFromContext: aContext scope: self.
	^ theValue
]

{
	#category : #lookup,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>lookupVarForDeclaration: name [
	tempVars at: name ifPresent: [:v | ^ v].
	name = 'thisContext' ifTrue: [^ thisContextVar].
	^self outerScope lookupVarForDeclaration: name
	
]

{
	#category : #debugging,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>methodScope [

	^ self outerScope methodScope
]

{
	#category : #'temp vars',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>moveToVectorTemp: aTempVar [

	self addVectorTemp: aTempVar.
	self removeTemp: aTempVar.	
]

{
	#category : #scope,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>newBlockScope: int [
	^ OCBlockScope new outerScope: self; id: int; yourself.
]

{
	#category : #scope,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>newOptimizedBlockScope: int [
	^ OCOptimizedBlockScope new 
			outerScope: self; 
			id: int;
			yourself.
]

{
	#category : #scope,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>outerNotOptimizedScope [
	^self
]

{
	#category : #scope,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>outerOffsetTo: aScope [
	"return how many scopes up from me aScope is. We ignore optimized scopes so the resulting offset maps to
	 contexts"

	| offset scope |
	offset := 0.
	scope := self.
	[scope == aScope] whileFalse: [
		scope isOptimizedBlockScope 
			ifTrue: [scope := scope outerNotOptimizedScope]
			ifFalse: [ 
			offset := offset + 1. 
			scope isInstanceScope ifTrue: [^0]. 
			scope := scope outerScope ] ].
	^offset.
	
]

{
	#category : #lookup,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>outerScopeLookupVar: name inContext: aContext [
	Error signal: 'Cannot find variable named''', name, ''' in this method'
]

{
	#category : #scope,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>popScope [
	"Propogate free var usages to their outer vars, then return outer scope"

	^ self outerScope
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>printOn: stream [

	super printOn: stream.
	stream space.
	self scopeLevel printOn: stream.

]

{
	#category : #'temp vars',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>removeTemp: tempVar [

	tempVars removeKey: tempVar name
]

{
	#category : #'temp vars',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>tempVarNames [

	^ self tempVars collect: [:each| each name]
]

{
	#category : #'temp vars',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>tempVars [

	^ tempVars
]

{
	#category : #'temp vars',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>tempVector [
	^ tempVector 
]

{
	#category : #'temp vars',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>tempVectorName [
	"the name of the tempVector is not a valid name of a temp variable
	 This way we avoid name clashes "
	^'0vector', id asString
]

{
	#category : #lookup,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbstractMethodScope>>variableNamed: name ifAbsent: aBlock [
	copiedVars at: name ifPresent: [:v | ^ v].
	tempVector  at: name ifPresent: [:v | ^ v].
	tempVars at: name ifPresent: [:v | ^ v].
	name = 'thisContext' ifTrue: [^ thisContextVar].
	
	^ aBlock value.
]
