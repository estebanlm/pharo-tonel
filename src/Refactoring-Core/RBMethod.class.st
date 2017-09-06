"
I represent a method for the refactoring framework.

I am used by RBClass / RBMetaclass resp. RBAbstractClass for methods created or changed during a refactoring operation.
I represent the method with a selector, source and if I am created from an existing method, its 
CompiledMethod. 
I know my method class (a RBClass or RBMetaclass). 
You should not directly create instances of me but query or create a method from a RBClass.

I only implement a small part of  CompiledMethod interface, that is used for refactoring operations, like
querying symbols, literals or the whole method source.

"
Class {
	#name : #RBMethod,
	#superclass : #Object,
	#instVars : [
		'class',
		'compiledMethod',
		'source',
		'selector'
	],
	#category : #Refactoring-Core-Model,
	#timestamp : 'NicolaiHess 5/18/2016 23:52'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMethod class>>for: aRBClass fromMethod: aCompiledMethod andSelector: aSymbol  [
	^(self new)
		modelClass: aRBClass;
		method: aCompiledMethod;
		selector: aSymbol;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMethod class>>for: aRBClass source: aString selector: aSelector  [
	^(self new)
		modelClass: aRBClass;
		selector: aSelector;
		source: aString;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMethod>>ast [
	^ self parseTree
]

{
	#category : #compiling,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMethod>>compileTree: aBRMethodNode [
	| method sourceCode change |
	sourceCode := aBRMethodNode newSource.
	change := self modelClass model
		compile: sourceCode
		in: self modelClass
		classified: self protocols.
	method := self class
		for: self modelClass
		source: sourceCode
		selector: aBRMethodNode selector.
	self modelClass addMethod: method.
	^ change
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMethod>>literal: anObject containsReferenceTo: aSymbol [
	anObject = aSymbol
		ifTrue: [ ^ true ].
	anObject class = Array
		ifFalse: [ ^ false ].
	^ anObject anySatisfy: [ :each | self literal: each containsReferenceTo: aSymbol ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMethod>>method [
	^compiledMethod
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMethod>>method: aCompiledMethod  [
	compiledMethod := aCompiledMethod
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMethod>>modelClass [
	^class
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMethod>>modelClass: aRBClass [
	class := aRBClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMethod>>parseTree [
	^RBParser parseMethod: self source onError: [:str :pos | ^nil]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMethod>>printOn: aStream  [
	class printOn: aStream.
	aStream
		nextPutAll: '>>';
		nextPutAll: self selector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMethod>>protocols [
	^ self modelClass protocolsFor: self selector
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMethod>>refersToClassNamed: aSymbol  [
	| searcher |
	searcher := RBParseTreeSearcher new.
	searcher matches: aSymbol asString do: [:node :answer | true].
	^(searcher executeTree: self parseTree initialAnswer: false) 
		or: [self refersToSymbol: aSymbol]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMethod>>refersToSymbol: aSymbol  [
	| searcher |
	searcher := RBParseTreeSearcher new.
	searcher
		matches: aSymbol printString do: [:node :answer | true];
		matches: '`#literal'
			do: [:node :answer | answer or: [self literal: node value containsReferenceTo: aSymbol]].
	(RBScanner isSelector: aSymbol) 
		ifTrue: 
			[searcher 
				matches: '`@object ' , (RBParseTreeSearcher buildSelectorString: aSymbol)
				do: [:node :answer | true]].
	^searcher executeTree: self parseTree initialAnswer: false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMethod>>refersToVariable: aString  [
	| searcher tree |
	tree := self parseTree.
	((tree defines: aString) or: [tree body defines: aString]) 
		ifTrue: [^false].
	searcher := RBParseTreeSearcher new.
	searcher
		matches: aString do: [:node :answer | true];
		matches: '[:`@vars | | `@temps | `@.Stmts]'
			do: 
				[:node :answer | 
				answer or: 
						[((node defines: aString) or: [node body defines: aString]) not 
							and: [searcher executeTree: node body initialAnswer: false]]].
	^searcher executeTree: self parseTree initialAnswer: false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMethod>>selector [
	^selector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMethod>>selector: aSymbol  [
	selector := aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMethod>>source [
	^ source ifNil: [ source := (class realClass sourceCodeAt: selector) asString ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMethod>>source: aString  [
	source := aString
]
