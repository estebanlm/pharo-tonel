"
RBPatternParser is a subclass of RBParser that allows the extended syntax that creates matching trees. These trees can be used by the ParseTreeMatcher to search and transform source code.

"
Class {
	#name : #RBPatternParser,
	#superclass : #RBParser,
	#category : #AST-Core-Parser,
	#timestamp : '<historical>'
}

{
	#category : #private-classes,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternParser>>messageNodeClass [
	^RBPatternMessageNode
]

{
	#category : #private-classes,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternParser>>methodNodeClass [
	^RBPatternMethodNode
]

{
	#category : #private-parsing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternParser>>parseError: aString [

	self error: aString
]

{
	#category : #private-parsing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternParser>>parseLiteralByteArrayObject [
	| node |
	(currentToken isIdentifier and: [currentToken isPatternVariable]) 
		ifTrue: 
			[node := self variableNodeClass identifierNamed: currentToken value at: currentToken start.
			node isLiteralNode 
				ifTrue: 
					[self step.
					^node]].
	^super parseLiteralByteArrayObject
]

{
	#category : #private-parsing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternParser>>parsePatternBlock: aClass  [
	| position node |
	position := currentToken start.
	self step.
	node := aClass new.
	self parseBlockArgsInto: node.
	node left: position.
	
	node body: self sequenceNodeClass new.
	(self parseStatements: false into: node body).
	
	(currentToken isSpecial and: [currentToken value = $}]) 
		ifFalse: [ self addParserError: '''}'' expected' to: node body.
			^ node ].
	node right: currentToken start.
	self step.
	^node
]

{
	#category : #private-parsing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternParser>>parsePragmaLiteral [
	| node |
	currentToken isPatternBlock 
		ifTrue: [ ^ self parsePatternBlock: RBPatternBlockNode ].
	(currentToken isIdentifier and: [ currentToken isPatternVariable ]) ifTrue: [
		node := self variableNodeClass identifierNamed: currentToken value at: currentToken start.
		node isLiteralNode 
			ifFalse: [ self parseError: 'Literal pattern expected' ].
		self step.
		currentToken isPatternBlock ifTrue: [
			node := (self parsePatternBlock: RBPatternWrapperBlockNode)
				wrappedNode: node;
				yourself ].
		^ node ].
	^ super parsePragmaLiteral
]

{
	#category : #private-parsing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternParser>>parsePrimitiveLiteral [
	| node |
	(currentToken isIdentifier and: [currentToken isPatternVariable]) 
		ifTrue: 
			[node := self variableNodeClass identifierNamed: currentToken value at: currentToken start.
			node isLiteralNode 
				ifTrue: 
					[self step.
					^node].
			currentToken := RBLiteralToken 
						value: currentToken value asSymbol
						start: currentToken start
						stop: currentToken stop].
	^super parsePrimitiveLiteral
]

{
	#category : #private-parsing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternParser>>parsePrimitiveObject [
	currentToken isPatternBlock 
		ifTrue: [^self parsePatternBlock: RBPatternBlockNode].
	^super parsePrimitiveObject
]

{
	#category : #private-parsing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternParser>>parseUnaryMessage [
	| node |
	node := self parsePrimitiveObject.
	self addCommentsTo: node.
	
	[currentToken isLiteralToken ifTrue: [self patchLiteralMessage].
	currentToken isPatternBlock 
		ifTrue: 
			[node := self parseWrapperPatternBlockWith: node ].
	currentToken isIdentifier] 
			whileTrue: [
				currentToken isKeywordPattern
					ifTrue: [ self parserError: ' incomplete keyword pattern ' ].
				node := self parseUnaryMessageWith: node].
	self addCommentsTo: node.
	^node
]

{
	#category : #private-parsing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternParser>>parseWrapperPatternBlockWith: wrappedNode [
	| node |

	node := self parsePatternBlock: RBPatternWrapperBlockNode.
	node class == RBPatternWrapperBlockNode ifTrue: [ 
		self flag: 'I think this is ugly, but I don''t know how to avoid checking the result of #parsePatternBlock:'.
		node wrappedNode: wrappedNode ].
	
	^ node
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternParser>>patchLiteralArrayToken [
	(currentToken isIdentifier and: [currentToken isPatternVariable]) 
		ifTrue: [^self].
	super patchLiteralArrayToken
]

{
	#category : #private-classes,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternParser>>pragmaNodeClass [
	^RBPatternPragmaNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternParser>>scannerClass [
	^RBPatternScanner
]

{
	#category : #private-classes,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternParser>>variableNodeClass [
	^RBPatternVariableNode
]
