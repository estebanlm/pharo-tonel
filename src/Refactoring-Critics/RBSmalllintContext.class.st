"

"
Class {
	#name : #RBSmalllintContext,
	#superclass : #Object,
	#instVars : [
		'class',
		'selector',
		'parseTree',
		'literals',
		'literalSemaphore',
		'literalProcess',
		'selectors',
		'compiledMethod',
		'selfMessages',
		'superMessages',
		'messages'
	],
	#category : #Refactoring-Critics,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext class>>newNoCache [
	^self basicNew
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>addLiteralsFor: aCompiledMethod [
	2 to: aCompiledMethod numLiterals - 1
		do: [ :index | self checkLiteral: (aCompiledMethod objectAt: index) ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>buildParseTree [
	| tree |
	tree := self selectedClass parseTreeFor: self selector.
	tree isNil ifTrue: [^RBParser parseMethod: 'method'].
	^tree
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>checkLiteral: aLiteral  [
	(aLiteral isSymbol or: [aLiteral isVariableBinding])
		ifTrue: [literals add: aLiteral]
		ifFalse: 
			[aLiteral class == Array
				ifTrue: [aLiteral do: [:each | self checkLiteral: each]]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>compiledMethod [
	^compiledMethod notNil
		ifTrue: [compiledMethod]
		ifFalse: [compiledMethod := class compiledMethodAt: selector]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>computeLiterals [
	literalSemaphore := Semaphore new.
	literalProcess := [self primitiveComputeLiterals] fork
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>computeLiteralsForClass: aClass  [
	(selectors addAll: aClass selectors) do: 
			[:sel | 
			self computeLiteralsForSelector: sel in: aClass.
			Processor yield]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>computeLiteralsForSelector: aSelector in: aClass  [
	| method |
	method := aClass compiledMethodAt: aSelector ifAbsent: [nil].
	method isNil ifTrue: [^self].
	self addLiteralsFor: method
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>computeMessages [
	| searcher |
	selfMessages := Set new.
	superMessages := Set new.
	messages := Set new.
	searcher := RBParseTreeSearcher new.
	searcher
		matches: 'self `@message: ``@args'
			do: [:aNode :answer | selfMessages add: aNode selector];
		matches: 'super `@message: ``@args'
			do: [:aNode :answer | superMessages add: aNode selector];
		matches: '``@receiver `@message: ``@args'
			do: [:aNode :answer | messages add: aNode selector].
	searcher executeTree: self parseTree initialAnswer: nil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>implements: aSelector  [
	^self selectors includes: aSelector
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>includesBehaviorNamed: aClassName [
	| current |
	current := self selectedClass.
	[ current isNil ] whileFalse: [
		current name = aClassName
			ifTrue: [ ^ true ].
		current := current superclass ].
	^ false
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>initialize [
	self computeLiterals
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>instVarNames [
	^self selectedClass allInstVarNames
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>isAbstract: aClass  [
	^(aClass isMeta or: 
			[(self literals includes: aClass name)
				or: [self literals includes: (Smalltalk globals associationAt: aClass name)]])
		not
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>literals [
	literalSemaphore isNil
		ifTrue: 
			[literals isNil ifTrue: 
					[self computeLiterals.
					literalSemaphore wait]]
		ifFalse: [literalSemaphore wait].
	^literals
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>messages [
	messages isNil ifTrue: [self computeMessages].
	^messages
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>parseTree [
	^parseTree isNil
		ifTrue: [parseTree := self buildParseTree]
		ifFalse: [parseTree]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>primitiveComputeLiterals [
	| semaphore |
	literals := IdentitySet new: 25000.
	literals addAll: self specialSelectors keys.
	selectors := IdentitySet new.
	RBBrowserEnvironment new
		classesDo: [ :each | self computeLiteralsForClass: each ].
	semaphore := literalSemaphore.
	literalSemaphore := nil.
	self signalProcesses: semaphore.
	^literalProcess := nil
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>printOn: aStream [
	super printOn: aStream.
	self selectedClass isNil ifFalse: [ 
		aStream nextPut: $ ; nextPutAll: self selectedClass name.
		self selector isNil ifFalse: [ 
			aStream nextPutAll: '>>'; print: self selector ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>protocol [
	^self selectedClass whichCategoryIncludesSelector: self selector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>protocols [
	^Array with: self protocol
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>release [
	literalProcess notNil ifTrue: [literalProcess terminate].
	super release
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>selectedClass [
	^class
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>selectedClass: anObject  [
	class := anObject.
	self selector: nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>selector [
	^selector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>selector: anObject  [
	selector := anObject.
	parseTree := compiledMethod := selfMessages := superMessages := messages := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>selectors [
	literalSemaphore isNil
		ifTrue: 
			[selectors isNil ifTrue: 
					[self computeLiterals.
					literalSemaphore wait]]
		ifFalse: [literalSemaphore wait].
	^selectors
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>selfMessages [
	selfMessages isNil ifTrue: [self computeMessages].
	^selfMessages
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>signalProcesses: aSemaphore  [
	aSemaphore isNil ifTrue: [^self].
	[aSemaphore isEmpty] whileFalse: [aSemaphore signal]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>sourceCode [
	^self selectedClass sourceCodeAt: self selector ifAbsent: [ '' ].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>specialSelectors [
	| answer |
	answer := IdentityDictionary new.
	(Smalltalk specialSelectors select: [:sel | sel isSymbol]) do:
		[:sel | answer at: sel put: nil.].
	^answer.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>superMessages [
	superMessages isNil ifTrue: [self computeMessages].
	^superMessages
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSmalllintContext>>uses: anObject  [
	^self literals includes: anObject
]
