"
RBPatternPragmaNode  is a RBPragmaNode that is used by the tree searcher  to
match pragma statements. Just like RBPatternMethodNode for method nodes.

Instance Variables:
	isList	<Boolean>	are we matching each keyword or matching all keywords together (e.g., `keyword1: would match a one argument method whereas `@keywords: would match 0 or more arguments)

"
Class {
	#name : #RBPatternPragmaNode,
	#superclass : #RBPragmaNode,
	#instVars : [
		'isList'
	],
	#category : #AST-Core-Pattern,
	#timestamp : 'NicolaiHess 8/2/2016 15:01'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternPragmaNode class>>selector: aSelector keywordsPositions: positionList arguments: valueNodes [
	^(aSelector isPatternVariable)
		ifTrue: [ super selector: aSelector keywordsPositions: positionList arguments: valueNodes ]
		ifFalse: [ RBPragmaNode selector: aSelector keywordsPositions: positionList arguments: valueNodes ]
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternPragmaNode>>copyInContext: aDictionary  [
	| keywordSelector |
	keywordSelector := self isSelectorList 
		ifTrue: [ aDictionary at: self selectorParts first ]
		ifFalse: [ ('' join: (self selectorParts collect: [ :each | aDictionary at: each ])) asSymbol ].
	^ RBPragmaNode
		selector: keywordSelector
		arguments: (self copyList: self arguments inContext: aDictionary)
]

{
	#category : #testing-matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternPragmaNode>>isPatternNode [
	^ true
]

{
	#category : #testing-matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternPragmaNode>>isSelectorList [
	^ isList
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternPragmaNode>>match: aNode inContext: aDictionary [
	aNode class = self matchingClass
		ifFalse: [ ^ false ].
	self isSelectorList ifTrue: [
		^ (aDictionary at: self selectorParts first ifAbsentPut: [ aNode selector ]) = aNode selector
			and: [ (aDictionary at: arguments first ifAbsentPut: [ aNode arguments ]) = aNode arguments ] ].
	^ self matchArgumentsAgainst: aNode inContext: aDictionary
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternPragmaNode>>matchArgumentsAgainst: aNode inContext: aDictionary  [
	self arguments size = aNode arguments size
		ifFalse: [ ^ false ].
	(self matchSelectorAgainst: aNode inContext: aDictionary) 
		ifFalse: [ ^ false ].
	self arguments with: aNode arguments do: [ :first :second |
		(first match: second inContext: aDictionary) 
			ifFalse: [ ^ false ] ].
	^ true
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternPragmaNode>>matchSelectorAgainst: aNode inContext: aDictionary  [
	self selectorParts with: aNode selectorParts do: [ :first :second |
		| keyword |
		keyword := aDictionary
			at: first
			ifAbsentPut: [ 
				first isPatternVariable 
					ifTrue: [ second ]
					ifFalse: [ first ] ].
		keyword = second 
			ifFalse: [ ^ false ] ].
	^ true
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternPragmaNode>>matchingClass [
	^ RBPragmaNode
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternPragmaNode>>selector: aSymbol keywordsPositions: positionList arguments: valueNodes [
	self 
		arguments: valueNodes;
		selector: aSymbol;
		keywordsPositions: positionList.
	isList := (aSymbol keywords first value at: 2) == self listCharacter
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternPragmaNode>>sentMessages [
	^ super sentMessages
		remove: self selector ifAbsent: [ ];
		yourself
]
