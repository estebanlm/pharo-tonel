"
I'm a simple formatter that prints nodes (without using source code).
 I'm usefull when AST are programmatically assembled. 
I could be improved but the goal is to get the information is a more or less ok form.

"
Class {
	#name : #BISimpleFormatter,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'codeStream',
		'indent',
		'lookaheadCode',
		'originalSource',
		'lineStart'
	],
	#classVars : [
		'FormatAsYouReadPolicy'
	],
	#category : #AST-Core-Formatter,
	#timestamp : 'StephaneDucasse 8/7/2015 15:08'
}

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter class>>format: aParseTree  [
	^self format: aParseTree withIndents: 0
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter class>>format: aParseTree withIndents: anInteger  [
	^ self new
		indent: anInteger;
		format: aParseTree
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter class>>formatAsYouReadPolicy [
	^ FormatAsYouReadPolicy
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter class>>formatAsYouReadPolicy: anObject [
	FormatAsYouReadPolicy := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter class>>initialize [
  "self initialize"
  FormatAsYouReadPolicy := false.
 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>addSpaceIfNeededForLastArgument: aPragmaNode [
	aPragmaNode isUnary
		ifTrue: [ ^ self ].
	(self pragmaArgumentNeedsSeparator: aPragmaNode arguments last)
		ifTrue: [ self space ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>basicFormatCommentFor: aComment [
	codeStream nextPutAll: (originalSource copyFrom: aComment start to: aComment stop).
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>bracketWith: bracketString around: aBlock [
	bracketString isEmpty
		ifTrue: [ ^ aBlock value ].
	codeStream nextPut: bracketString first.
	^ aBlock
		ensure: [ codeStream nextPut: bracketString last ] 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>codeStream [
	^ codeStream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>codeStream: anObject [
	codeStream := anObject
]

{
	#category : #'public interface',
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>containerWidth: anInteger [
	"nothing done on purpose"
]

{
	#category : #'public interface',
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>format: aParseTree [
	originalSource := aParseTree source.
	self visitNode: aParseTree.
	^ codeStream contents
]

{
	#category : #private-formatting,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>formatArray: anArrayNode [
	anArrayNode statements
		do: [ :each | 
				self visitNode: each ]
		separatedBy: 
				[ codeStream nextPutAll: ' . ' .
				self newLine ]
]

{
	#category : #private-formatting,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>formatBlock: aBlockNode [
	self formatBlockArgumentsFor: aBlockNode.
	self space.
	self visitNode: aBlockNode body.
	self space


]

{
	#category : #private-formatting,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>formatBlockArgumentsFor: aBlockNode [
	aBlockNode arguments isEmpty
		ifTrue: [ ^ self ].
	aBlockNode arguments
		do:
			[ :each | 
			codeStream nextPut: $:.
			self visitNode: each.
			self formatCommentsFor: each.
			self space ].
	codeStream nextPutAll: '| '
]

{
	#category : #private-formatting,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>formatCommentsFor: aNode [
	originalSource isNil
		ifTrue: [ ^ self ].
	aNode comments
		do:
			[ :each | 
			self basicFormatCommentFor: each.
			self newLine ]
]

{
	#category : #private-formatting,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>formatMethodBodyFor: aMethodNode [
	self
		indentAround:
			[ 
			self newLine.
			self formatMethodCommentFor: aMethodNode.
			self formatPragmasFor: aMethodNode.
			self visitNode: aMethodNode body ]
]

{
	#category : #private-formatting,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>formatMethodCommentFor: aNode [
	originalSource isNil
		ifTrue: [ ^ self ].
	aNode comments
		do:
			[ :each | 
			self basicFormatCommentFor: each.
			self newLine ]
]

{
	#category : #private-formatting,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>formatMethodPatternFor: aMethodNode [
	aMethodNode arguments isEmpty
		ifTrue: [ codeStream nextPutAll: aMethodNode selector ]
		ifFalse: [ self privateFormatMethodPatternMonoLineFor: aMethodNode ]
]

{
	#category : #private-formatting,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>formatPragmasFor: aMethodNode [
	aMethodNode pragmas do: [ :each | self visitNode: each; newLine ]
]

{
	#category : #private-formatting,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>formatSelectorAndArguments: aMessageNode [
	
	self
		indent: 2
		around: [ 
			self
				formatSelectorAndArguments: aMessageNode
				firstSeparator: [ self space ]
				restSeparator: [ self space ] ]
]

{
	#category : #private-formatting,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>formatSelectorAndArguments: aMessageNode firstSeparator: firstBlock restSeparator: restBlock [
	aMessageNode isUnary
		ifTrue: [ 
			self space.
			codeStream nextPutAll: aMessageNode selector ]
		ifFalse: [ 
			aMessageNode selectorParts
				with: aMessageNode arguments
				do: [ :selector :argument | 
					self space.
					self
						indentAround: [ 
							codeStream nextPutAll: selector.
							self handleLineForArgument: argument ] ] ]
]

{
	#category : #private-formatting,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>formatSequenceNodeStatementsFor: aSequenceNode [
	| statements |
	statements := aSequenceNode statements.
	statements isEmpty
		ifTrue: [ ^ self ].
	1 to: statements size do:
		[ :i | 
		self visitNode: (statements at: i).
		i < statements size
			ifTrue: [ codeStream nextPut: $.. 
						self newLine].
		self formatStatementCommentsFor: (statements at: i).
		i < statements size
			ifTrue: [  ] ]
]

{
	#category : #private-formatting,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>formatStatementCommentsFor: aStatementNode [
	originalSource isNil
		ifTrue: [ ^ self ].
	aStatementNode statementComments
		do:
			[ :each | 
			 self newLine. 
			 self basicFormatCommentFor: each ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>formatTemporariesFor: aSequenceNode [
	aSequenceNode temporaries isEmpty
		ifTrue: [ ^ self ].
	self
		bracketWith: '|'
		around:
			[ 
			self space.
			aSequenceNode temporaries
				do:
					[ :each | 
					self visitNode: each.
					self formatStatementCommentsFor: each .
					self space ] ].
	self newLine.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>formattedSourceFor: aNode [
	^ lookaheadCode
		at: aNode
		ifAbsentPut: [ 
			self class new
				indent: 1;
				format: aNode ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>handleLineForArgument: anArgument [
  self space.
  self visitNode: anArgument
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>indent [
	^ indent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>indent: anInteger [

	indent := anInteger
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>indent: anInteger around: aBlock  [
	self indent: self indent + anInteger.
	^aBlock ensure: [self indent: self indent - anInteger]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>indentAround: aBlock  [
	self indent: 1 around: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>indentString [
	^ '  '
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>initialize [
	super initialize.
	lineStart := 0.
	self indent: 0.
	lookaheadCode := IdentityDictionary new.
	codeStream := (String new: 256) writeStream.
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>lineStart [
	^ lineStart
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>lineStart: anObject [
	lineStart := anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>needsParenthesisFor: aNode [
  | parent |
  aNode ifNil: [ ^false ].
  aNode isValue ifFalse: [ ^false ].
   parent := aNode parent ifNil: [ ^false ].
   aNode precedence < parent precedence ifTrue: [ ^false ].
   (aNode isAssignment and: [ parent isAssignment ]) ifTrue: [ ^false ].
   (aNode isAssignment and: [ aNode isCascade ]) ifTrue: [ ^true ].
   aNode precedence = 0 ifTrue: [ ^false ].
   aNode isMessage ifFalse: [ ^true ].
   aNode isUnary ifTrue: [ ^false ].
   aNode isKeyword ifTrue: [ ^true ].
   (parent isMessage and: [ parent receiver == aNode ]) ifFalse: [ ^true ].
   aNode precedence = parent precedence ifFalse: [ ^true ].
   ^self precedenceOf: parent selector greaterThan: aNode selector
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>newLine [
	self newLines: 1
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>newLines: anInteger [
	anInteger + self indentString size = 0
		ifTrue: 
			[ codeStream space ].
	anInteger
		timesRepeat: 
			[ codeStream cr ].
	lineStart := codeStream position.
	self
		indent
		timesRepeat: 
			[ codeStream nextPutAll: self indentString ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>pragmaArgumentNeedsSeparator: anArgumentNode [
	^ anArgumentNode value isSymbol and: [ anArgumentNode value isBinary ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>precedenceOf: parentSelector greaterThan: childSelector [
  "Put parenthesis around things that are preceived to have 'lower' precedence. For example, 'a + b * c' 
	-> '(a + b) * c' but 'a * b + c' -> 'a * b + c'"
  | childIndex parentIndex |
  childIndex := 0.
  parentIndex := 0.
  1 to: self traditionalBinaryPrecedenceArray size do: [:i | ((self traditionalBinaryPrecedenceArray at: i) includes: parentSelector first) ifTrue: [ parentIndex := i ].
        ((self traditionalBinaryPrecedenceArray at: i) includes: childSelector first) ifTrue: [ childIndex := i ] ].
  ^childIndex < parentIndex
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>privateFormatMethodPatternMonoLineFor: aMethodNode [
	self
		with: aMethodNode selectorParts
		and: aMethodNode arguments
		do: [ :key :arg | 
			codeStream nextPutAll: key.
			self space.
			self visitNode: arg ]
		separatedBy: [ self space ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>space [
	codeStream space
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>traditionalBinaryPrecedenceArray [
	^  #(#($| $& $?) #($= $~ $< $>) #($- $+) #($* $/ $% $\) #($@))
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>visitArrayNode: anArrayNode [
	self bracketWith: '{}' around: [ self formatArray: anArrayNode ]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>visitAssignmentNode: anAssignmentNode  [
	self visitNode: anAssignmentNode variable.
	codeStream space; nextPutAll: anAssignmentNode assignmentOperator; space.
	self visitNode: anAssignmentNode value
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>visitBlockNode: aBlockNode [
	self
		bracketWith: '[]'
		around: [ self formatBlock: aBlockNode ].
	
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>visitCascadeNode: aCascadeNode [

	self visitNode: aCascadeNode receiver.
	self
		indentAround:
			[ 
			self newLine.
			aCascadeNode messages
				do:
					[ :each | self indentAround: [ self formatSelectorAndArguments: each firstSeparator: [  ] restSeparator: [ self space ] ] ]
				separatedBy: [ 
					codeStream nextPut: $;.
					self newLine ] ].
	
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>visitLiteralArrayNode: aRBArrayLiteralNode  [
	| brackets |
	codeStream nextPut: $#.
	brackets := aRBArrayLiteralNode isForByteArray 
				ifTrue: ['[]']
				ifFalse: ['()'].
	self bracketWith: brackets
		around: 
			[aRBArrayLiteralNode contents do: [:each | self visitNode: each]
				separatedBy: [self space]]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>visitLiteralNode: aLiteralNode [
	aLiteralNode value isLiteral
		ifFalse: [ 

			self writeString: '''<an unprintable nonliteral value>''' ]
		ifTrue: [ self writeString: aLiteralNode sourceText ]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>visitMessageNode: aMessageNode  [
	self visitNode: aMessageNode receiver.
	self formatSelectorAndArguments: aMessageNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>visitMethodNode: aMethodNode  [
	self formatMethodPatternFor: aMethodNode.
	self formatMethodBodyFor: aMethodNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>visitNode: aNode [
	| needsParenthesis |
	(lookaheadCode includesKey: aNode)
		ifTrue: [ ^ self writeString: (lookaheadCode at: aNode) ].
	needsParenthesis := self needsParenthesisFor: aNode.
	self
		bracketWith:
			(needsParenthesis
				ifTrue: [ '()' ]
				ifFalse: [ '' ])
		around: [ super visitNode: aNode ]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>visitPatternBlockNode: aRBPatternBlockNode  [
	codeStream nextPut: $`.
	self 
		bracketWith: '{}' 
		around: [self formatBlock: aRBPatternBlockNode]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>visitPatternWrapperBlockNode: aRBPatternWrapperBlockNode [
	self visitNode: aRBPatternWrapperBlockNode wrappedNode.
	codeStream nextPut: $`.
	self 
		bracketWith: '{}' 
		around: [self formatBlock: aRBPatternWrapperBlockNode]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>visitPragmaNode: aPragmaNode [
	codeStream nextPut: $<.
	self 
		formatSelectorAndArguments: aPragmaNode 
		firstSeparator: [ 
			aPragmaNode selector isInfix
				ifTrue: [ self space ] ]
		restSeparator: [ self space ].
	self addSpaceIfNeededForLastArgument: aPragmaNode.
	codeStream nextPut: $>
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>visitReturnNode: aReturnNode  [
	codeStream nextPut: $^.
	self visitNode: aReturnNode value
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>visitSequenceNode: aSequenceNode [
	self formatTemporariesFor: aSequenceNode.
	self formatCommentsFor: aSequenceNode.
	self formatSequenceNodeStatementsFor: aSequenceNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>visitVariableNode: aVariableNode  [
	codeStream nextPutAll: aVariableNode name
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>with: firstCollection and: secondCollection do: aBlock separatedBy: separatorBlock [
	firstCollection isEmpty
		ifTrue: [ ^ self ].
	aBlock value: firstCollection first value: secondCollection first.
	2 to: firstCollection size do: [ :i | 
		separatorBlock value.
		aBlock value: (firstCollection at: i) value: (secondCollection at: i) ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
BISimpleFormatter>>writeString: aString [
	| index |
	index := aString lastIndexOf: Character cr ifAbsent: [ 0 ].
	 codeStream nextPutAll: aString .
	index > 0
		ifTrue: [ lineStart := codeStream position - (aString size - index) ]
]
