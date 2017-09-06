"
I am a tool that allows you to reoptimize messages into a decompiled method.

I receive an AST and I replace non-optimized message nodes that have been reconstructed by the AST builder into optimized message nodes, then I return the AST.

Public API : use rewriteAST: to transform it with optimized messages.

example: FBDOptimizedMessagesRewriter rewriteAST: (Object >> #asString ) ast.

I only rewrite nodes with ""reconstructed"" property to ensure that I reoptimize only the messages that were optimized in the non-decompiled method.
"
Class {
	#name : #FBDOptimizedMessagesRewriter,
	#superclass : #RBProgramNodeVisitor,
	#category : #Flashback-Decompiler,
	#timestamp : 'KevinLanvin 7/3/2015 15:41'
}

{
	#category : #'public api',
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter class>>rewriteAST: ast [
	self new rewriteAST: ast
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>analyseSeq: seq [
	"Checks if consecutive messages have the same receiver. If not, creates a cascade"

	| currentCascade |
	currentCascade := OrderedCollection new.
	seq statements
		do: [ :each | 
			(each isMessage and: [ each selector ~= #ifTrue:ifFalse: ])
				ifFalse: [ self rewriteSeq: seq with: currentCascade ]
				ifTrue: [ 
					currentCascade
						ifNotEmpty: [ 
							currentCascade last receiver = each receiver
								ifFalse: [ self rewriteSeq: seq with: currentCascade ] ].
					currentCascade add: each ] ].
	self rewriteSeq: seq with: currentCascade
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>areArgumentsBlocks: msgNode [
	^ msgNode arguments allSatisfy: [ :arg | arg isBlock ]
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>convertToAnd: msgNode [
	msgNode selector: #and:.
	msgNode arguments: {msgNode arguments first}
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>convertToIfFalse: msgNode [
	msgNode selector: #ifFalse:.
	msgNode arguments: {msgNode arguments second}
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>convertToIfNil: msgNode [
	msgNode selector: #ifNil:.
	msgNode arguments: {msgNode arguments first}
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>convertToIfNilIfNotNil: msgNode [
	msgNode receiver: msgNode receiver receiver.
	msgNode selector: #ifNil:ifNotNil:
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>convertToIfNotNil: msgNode [
	msgNode selector: #ifNotNil:.
	msgNode arguments: {msgNode arguments last}
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>convertToIfTrue: msgNode [
	msgNode selector: #ifTrue:.
	msgNode arguments: {msgNode arguments first}
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>convertToOr: msgNode [
	msgNode selector: #or:.
	msgNode arguments: {msgNode arguments second}
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>convertWhileTrueToToByDo: msgNode start: start end: end by: incrValue incrVariable: incrVar assignement: assignement [
	| selector arguments loopBlock |
	loopBlock := msgNode arguments last.
	loopBlock arguments: {incrVar}.
	loopBlock statements removeLast.
	incrValue value = 1
		ifTrue: [ 
			selector := #to:do: .
			arguments := {end . loopBlock} ]
		ifFalse: [ 
			selector := #to:by:do: .
			arguments := {end . incrValue . loopBlock} ].
	msgNode
		receiver: start;
		selector: selector;
		arguments: arguments.
	self removeTempFromSequence: msgNode parent temp: incrVar.
	msgNode parent removeNode: assignement
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>extractStartValue: msgNode startTemp: startTemp [
	| assignement indexOfMsg |
	indexOfMsg := msgNode parent statements indexOf: msgNode.
	indexOfMsg = 1
		ifTrue: [ ^ nil ].
	assignement := msgNode parent statements at: indexOfMsg - 1.
	(assignement isAssignment and: [ assignement variable = startTemp])
		ifFalse: [ ^ nil ].
	^ assignement value
]

{
	#category : #handling,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>handleBigArray: msgNode [
	| seq cascade |
	seq := msgNode parent parent.
	cascade := seq statements at: (seq statements indexOf: msgNode parent) +1 .
	seq removeNode: msgNode parent.
	seq replaceNode: cascade withNode: (RBArrayNode statements: (cascade  messages removeLast; collect: [ :msg | msg arguments first ]))
]

{
	#category : #handling,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>handleIfFalse: msgNode [
	(self isIfNilIfNotNil: msgNode)
		ifTrue: [ 
			msgNode receiver: msgNode receiver receiver.
			msgNode selector: #ifNotNil: ]
]

{
	#category : #handling,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>handleIfNilIfNotNil: msgNode [
	(self isIfNil: msgNode)
		ifTrue: [ ^ self convertToIfNil: msgNode ].
	(self isIfNotNil: msgNode)
		ifTrue: [ ^ self convertToIfNotNil: msgNode ]
]

{
	#category : #handling,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>handleIfTrue: msgNode [
	(self isIfNilIfNotNil: msgNode)
		ifTrue: [ 
			msgNode receiver: msgNode receiver receiver.
			msgNode selector: #ifNil: ]
]

{
	#category : #handling,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>handleIfTrueIfFalse: msgNode [
	(self areArgumentsBlocks: msgNode) ifFalse: [ ^ self ].
	(self isIfFalse: msgNode) ifTrue: [ ^ self convertToIfFalse: msgNode ].
	(self isIfTrue: msgNode) ifTrue: [ ^ self convertToIfTrue: msgNode ].
 	(self isAnd: msgNode) ifTrue: [ ^self convertToAnd: msgNode ].
	(self isOr: msgNode) ifTrue: [ ^ self convertToOr: msgNode ].
	(self isIfNilIfNotNil: msgNode) ifTrue: [ ^ self convertToIfNilIfNotNil: msgNode ]
]

{
	#category : #handling,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>handleWhileTrue: msgNode [
	| startTemp start end incrValue rcvr |
	(self isReceiverCorrectCondition: msgNode)
		ifFalse: [ ^ self ].
	rcvr := msgNode receiver body statements first.
	startTemp := rcvr receiver.
	start := (self extractStartValue: msgNode startTemp: startTemp) ifNil: [ ^ self ].
	end := rcvr arguments first.
	(self
		hasCorrectIncrInstruction: msgNode
		startTemp: startTemp
		isPositiveLoop: ((self isPositiveLoopOrNil: rcvr) ifNil: [ ^ self ]))
		ifFalse: [ ^ self ].
	incrValue := msgNode arguments first body statements last value arguments first.
	^ self
		convertWhileTrueToToByDo: msgNode
		start: start
		end: end
		by: incrValue
		incrVariable: startTemp
		assignement: (msgNode parent statements at: (msgNode parent statements indexOf: msgNode) - 1)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>hasCorrectIncrInstruction: msgNode startTemp: startTemp isPositiveLoop: isPositiveLoop [
	| incrInstruction |
	incrInstruction := msgNode arguments first body statements last.
	incrInstruction isAssignment
		ifFalse: [ ^ false ].
	incrInstruction variable = startTemp
		ifFalse: [ ^ false ].
	incrInstruction value isMessage
		ifFalse: [ ^ false ].
	incrInstruction value selector = #+
		ifFalse: [ ^ false ].
	incrInstruction value receiver = startTemp
		ifFalse: [ ^ false ].
	incrInstruction value arguments first value isLiteral
		ifFalse: [ ^ false ].
	^ incrInstruction value arguments first value positive = isPositiveLoop
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>isAnd: msgNode [
	| stmts |
	stmts := msgNode arguments second body statements.
	^ stmts size = 1 and: [ stmts first value = false ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>isBigArray: msgNode [
	^ (msgNode selector = #braceStream:) and: [ msgNode receiver isVariable and: [ msgNode receiver name = #Array ] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>isIfFalse: msgNode [
	^ msgNode arguments first body statements isEmpty
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>isIfNil: msgNode [
	^ msgNode arguments second = msgNode receiver
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>isIfNilIfNotNil: msgNode [
	msgNode receiver isMessage
		ifFalse: [ ^ false ].
	msgNode receiver selector = #==
		ifFalse: [ ^ false ].
	^ msgNode receiver arguments first value isNil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>isIfNotNil: msgNode [
	| stmts |
	stmts := msgNode arguments first body statements.
	^ stmts size = 1 and: [ stmts first = msgNode receiver ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>isIfTrue: msgNode [
	^ msgNode arguments second body statements isEmpty 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>isLastStatementReturnSelf: seq [
	^ seq parent isMethod and: [ seq statements last isReturn and: [ seq statements last value isSelf ] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>isOr: msgNode [
	| stmts |
	stmts := msgNode arguments first body statements.
	^ stmts size = 1 and: [ stmts first value = true ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>isPositiveLoopOrNil: rcvr [
	rcvr selector = #<=
		ifTrue: [ ^ true ].
	rcvr selector = #>=
		ifTrue: [ ^ false ].
	^ nil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>isReceiver1StatementBlock: msgNode [
	msgNode receiver isBlock
		ifFalse: [ ^ false ].
	^ msgNode receiver body statements size = 1
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>isReceiverCorrectCondition: msgNode [
	| condition |
	(self isReceiver1StatementBlock: msgNode ) ifFalse: [ ^ false ].
	condition := msgNode receiver body statements first.
	^ condition isMessage and: [ condition isBinary ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>isReconstructed: msg [
	^ msg hasProperty: #reconstructed
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>removeTempFromSequence: seq temp: temp [
	| temps |
	seq ifNil: [ ^self "2 to:do: in the same method, temp has already  been removed" ].
	seq isSequence ifFalse: [ ^ self removeTempFromSequence: seq parent temp: temp ].
	temps := seq temporaries reject: [ :tmp | tmp = temp ].
	temps size = seq temporaries size
		ifTrue: [ self removeTempFromSequence: seq parent temp: temp ]
		ifFalse: [ seq temporaries: temps ]
]

{
	#category : #'public api',
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>rewriteAST: aMethodNode [
	self visitNode: aMethodNode.
	^ aMethodNode
]

{
	#category : #rewriting,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>rewriteSeq: seq with: currentCascade [
	currentCascade size > 1
		ifTrue: [ self rewriteStatements: currentCascade in: seq ].
		currentCascade removeAll
]

{
	#category : #rewriting,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>rewriteStatements: statements in: seq [
"You have to remove the first statement from the collection before removing all nodes in the sequence.
RemoveNode first uses == to detect the node , then =
So if you don't remove the first statement of the collection (which has been replaced by the cascade and no longer exists), then this will remove all nodes = to first node (and not ==).
So if you have the same node twice in the sequence, and this node is the first message of a cascade, then all occurences of this node would be removed"
	seq replaceNode: statements first withNode: (RBCascadeNode messages: statements copy).
	(statements
		removeFirst;
		yourself) do: [ :each | seq removeNode: each ]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>visitBlockNode: block [
	super visitBlockNode: block.
	block body statements ifEmpty: [  ^ self ].
	block body statements last isLiteralNode ifFalse: [ ^self ].
	block body statements last value ifNotNil: [ ^self ].
	block body statements removeLast
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>visitMessageNode: msgNode [
	"Do not add return statements. 
	ifTrue:ifFalse: handling may change the current message node into an ifTrue: , an ifFalse: or an ifNil:ifNotNil: message. 
	whileTrue are used to detect to:do: and to: by: do."

	super visitMessageNode: msgNode.
	(self isReconstructed: msgNode)
		ifFalse: [ ^ self ].
	msgNode selector = #ifTrue:ifFalse:
		ifTrue: [ self handleIfTrueIfFalse: msgNode ].
	msgNode selector = #ifNil:ifNotNil:
		ifTrue: [ self handleIfNilIfNotNil: msgNode ].
	msgNode selector = #ifTrue:
		ifTrue: [ self handleIfTrue: msgNode ].
	msgNode selector = #ifFalse:
		ifTrue: [ self handleIfFalse: msgNode ].
	msgNode selector = #whileTrue:
		ifTrue: [ self handleWhileTrue: msgNode ].
	(self isBigArray: msgNode)
		ifTrue: [ self handleBigArray: msgNode ]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDOptimizedMessagesRewriter>>visitSequenceNode: seq [
	self analyseSeq: seq .
	super visitSequenceNode: seq.
	(self isLastStatementReturnSelf: seq) ifTrue: [ seq statements removeLast ]
]
