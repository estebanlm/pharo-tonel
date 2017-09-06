"
Dead Block. The block is not assigned, not returned and no message is send to it.
Often this is a left over from using blocks to comment out code.
"
Class {
	#name : #RBDeadBlockRule,
	#superclass : #RBParseTreeLintRule,
	#category : #Refactoring-Critics-ParseTreeRules,
	#timestamp : 'MarcusDenker 6/28/2016 18:46'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDeadBlockRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'DeadBlockRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDeadBlockRule>>group [
	^ 'Optimization'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDeadBlockRule>>initialize [
	super initialize.
	self matcher 
		matches: '`{:node | node isBlock and: [node isUsed not]}'
		do: [ :node :answer | node ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDeadBlockRule>>name [
	^ 'Dead Block'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDeadBlockRule>>rationale [
	^ 'Dead Block. The block is not assigned, not returned and no message is send to it.
Often this is a left over from using blocks to comment out code.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDeadBlockRule>>severity [
	^ #information
]
