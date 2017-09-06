"
ParseTreeSearcher walks over a normal source code parse tree using the visitor pattern, and then matches these nodes against the meta-nodes using the match:inContext: methods defined for the meta-nodes.

Instance Variables:
	answer	<Object>	the ""answer"" that is propagated between matches
	argumentSearches	<Collection of: (Association key: RBProgramNode value: BlockClosure)>	argument searches (search for the BRProgramNode and perform the BlockClosure when its found)
	context	<RBSmallDictionary>	a dictionary that contains what each meta-node matches against. This could be a normal Dictionary that is created for each search, but is created once and reused (efficiency).
	messages	<Collection>	the sent messages in our searches
	searches	<Collection of: (Association key: RBProgramNode value: BlockClosure)>	non-argument searches (search for the BRProgramNode and perform the BlockClosure when its found)
"
Class {
	#name : #RBParseTreeSearcher,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'searches',
		'answer',
		'argumentSearches',
		'context',
		'messages'
	],
	#category : #AST-Core-Matching,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher class>>buildSelectorString: aSelector  [
	| stream keywords |
	aSelector numArgs = 0 ifTrue: [^aSelector].
	stream := String new writeStream.
	keywords := aSelector keywords.
	1 to: keywords size
		do: 
			[:i | 
			stream
				nextPutAll: (keywords at: i);
				nextPutAll: ' ``@arg';
				nextPutAll: i printString;
				nextPut: $ ].
	^stream contents
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher class>>buildSelectorTree: aSelector  [
	aSelector isEmpty ifTrue: [^nil].
	^RBParser parseRewriteExpression: '``@receiver ' 
				, (self buildSelectorString: aSelector)
		onError: [:err :pos | ^nil]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher class>>buildTree: aString method: aBoolean  [
	^aBoolean 
		ifTrue: [RBParser parseRewriteMethod: aString]
		ifFalse: [RBParser parseRewriteExpression: aString]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher class>>getterMethod: aVarName  [
	^(self new)
		matchesMethod: '`method ^' , aVarName do: [:aNode :ans | aNode selector];
		matchesMethod: '`method ^' , aVarName, ' ifNil:[ `@expr]' do: [:aNode :ans | aNode selector];
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher class>>justSendsSuper [
	^ self new
		matchesAnyMethodOf: #(
			'`@method: `@args ^ super `@method: `@args' 
			'`@method: `@args super `@method: `@args')
		do: [ :node :answer | true ];
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher class>>returnSetterMethod: aVarName  [
	^(self new)
		matchesMethod: '`method: `Arg ^' , aVarName , ' := `Arg'
			do: [:aNode :ans | aNode selector];
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher class>>setterMethod: aVarName  [
	^(self new)
		matchesAnyMethodOf: (Array with: '`method: `Arg ' , aVarName , ' := `Arg'
					with: '`method: `Arg ^' , aVarName , ' := `Arg')
			do: [:aNode :ans | aNode selector];
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher class>>treeMatching: aString in: aParseTree  [
	(self new)
		matches: aString do: [:aNode :answer | ^aNode];
		executeTree: aParseTree.
	^nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher class>>treeMatchingStatements: aString in: aParseTree  [
	| notifier tree |
	notifier := self new.
	tree := RBParser parseExpression: aString.
	tree isSequence 
		ifFalse: [tree := RBSequenceNode statements: (Array with: tree)].
	tree temporaries: (Array with: (RBPatternVariableNode named: '`@temps')).
	tree addNodeFirst: (RBPatternVariableNode named: '`@.S1').
	tree lastIsReturn 
		ifFalse: [tree addNode: (RBPatternVariableNode named: '`@.S2')].
	notifier matchesTree: tree
		do: [:aNode :answer | ^RBParser parseExpression: aString].
	notifier executeTree: aParseTree.
	^nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher>>addArgumentRule: aParseTreeRule  [
	argumentSearches add: aParseTreeRule.
	aParseTreeRule owner: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher>>addArgumentRules: ruleCollection  [
	ruleCollection do: [:each | self addArgumentRule: each]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher>>addRule: aParseTreeRule  [
	searches add: aParseTreeRule.
	aParseTreeRule owner: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher>>addRules: ruleCollection  [
	ruleCollection do: [:each | self addRule: each]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher>>answer [
	^answer
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher>>answer: anObject [
	answer := anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher>>canMatchMethod: aCompiledMethod [
	| actualMessages |
	self messages isEmpty
		ifTrue: [ ^ true ].
	actualMessages := aCompiledMethod messages.
	^ self messages 
		anySatisfy: [ :each | actualMessages includes: each ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher>>context [
	^context
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher>>executeMethod: aParseTree initialAnswer: anObject  [
	answer := anObject.
	searches detect: [:each | (each performOn: aParseTree) notNil] ifNone: [].
	^answer
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher>>executeTree: aParseTree  [
	"Save our current context, in case someone is performing another search inside a match."

	| oldContext |
	oldContext := context.
	context := SmallDictionary new.
	self visitNode: aParseTree.
	context := oldContext.
	^answer
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher>>executeTree: aParseTree initialAnswer: aValue  [
	answer := aValue.
	^self executeTree: aParseTree
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher>>foundMatch [

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher>>hasRules [
	^searches notEmpty
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher>>initialize [
	super initialize.
	context := SmallDictionary new.
	searches := OrderedCollection new.
	argumentSearches := OrderedCollection new: 0.
	answer := nil
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher>>lookForMoreMatchesInContext: oldContext  [
	oldContext keysAndValuesDo: 
			[:key :value | 
			(key isString not and: [key recurseInto]) 
				ifTrue: [value do: [:each | self visitNode: each]]]
]

{
	#category : #searching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher>>matches: aString do: aBlock  [
	self addRule: (RBSearchRule searchFor: aString thenDo: aBlock)
]

{
	#category : #searching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher>>matchesAnyArgumentOf: stringCollection do: aBlock  [
	stringCollection do: [:each | self matchesArgument: each do: aBlock]
]

{
	#category : #searching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher>>matchesAnyMethodOf: aStringCollection do: aBlock  [
	aStringCollection do: [:each | self matchesMethod: each do: aBlock]
]

{
	#category : #searching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher>>matchesAnyOf: aStringCollection do: aBlock  [
	aStringCollection do: [:each | self matches: each do: aBlock]
]

{
	#category : #searching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher>>matchesAnyTreeOf: treeCollection do: aBlock  [
	treeCollection do: [:each | self matchesTree: each do: aBlock]
]

{
	#category : #searching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher>>matchesArgument: aString do: aBlock  [
	self addArgumentRule: (RBSearchRule searchFor: aString thenDo: aBlock)
]

{
	#category : #searching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher>>matchesArgumentTree: aBRProgramNode do: aBlock  [
	self 
		addArgumentRule: (RBSearchRule searchForTree: aBRProgramNode thenDo: aBlock)
]

{
	#category : #searching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher>>matchesMethod: aString do: aBlock  [
	self addRule: (RBSearchRule searchForMethod: aString thenDo: aBlock)
]

{
	#category : #searching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher>>matchesTree: aBRProgramNode do: aBlock  [
	self addRule: (RBSearchRule searchForTree: aBRProgramNode thenDo: aBlock)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher>>messages [
	messages notNil ifTrue: [^messages].
	argumentSearches notEmpty ifTrue: [^messages := #()].
	messages := Set new.
	searches do: 
			[:each | 
			| searchMessages |
			searchMessages := each sentMessages.
			RBProgramNode optimizedSelectors 
				do: [:sel | searchMessages remove: sel ifAbsent: []].
			searchMessages isEmpty ifTrue: [^messages := #()].
			messages addAll: searchMessages].
	^messages := messages asArray
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher>>performSearches: aSearchCollection on: aNode  [
	| value |
	aSearchCollection do: [ :aSearchRule|
		value := aSearchRule performOn: aNode.
		value notNil 
			ifTrue: 
				[self foundMatch.
				^value]].
	^nil
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher>>recusivelySearchInContext [
	"We need to save the matched context since the other searches might overwrite it."

	| oldContext |
	oldContext := context.
	context := SmallDictionary new.
	self lookForMoreMatchesInContext: oldContext.
	context := oldContext
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher>>visitArgumentNode: aNode [
	| value |
	value := self performSearches: argumentSearches on: aNode.
	^ value
		ifNil: [ 
			super visitArgumentNode: aNode.
			aNode ]
		ifNotNil: [ value ]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseTreeSearcher>>visitNode: aNode  [
	| value |
	value := self performSearches: searches on: aNode.
	^ value
		ifNil: [ 
			super visitNode: aNode.
			aNode ]
		ifNotNil: [ value ]
]
