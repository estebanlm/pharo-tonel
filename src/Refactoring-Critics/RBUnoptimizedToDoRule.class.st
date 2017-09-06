"
Checks for inefficient uses of to:do: that create an unnecessary Interval instance.

( 1 to: 10 ) do: aBlock

can be more efficiently expressed as 

1 to: 10 do: aBlock
"
Class {
	#name : #RBUnoptimizedToDoRule,
	#superclass : #RBParseTreeLintRule,
	#category : #Refactoring-Critics-ParseTreeRules,
	#timestamp : 'StephaneDucasse 11/29/2014 22:54'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnoptimizedToDoRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'UnoptimizedToDoRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnoptimizedToDoRule>>group [
	^ 'Optimization'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnoptimizedToDoRule>>initialize [
	super initialize.
	self matcher 
		matches: '(`@a to: `@b) do: `@c'
		do: [ :node :answer | node ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnoptimizedToDoRule>>name [
	^ 'Uses (to:)do: instead of to:do:'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnoptimizedToDoRule>>rationale [
	^ 'Checks for inefficient uses of to:do: that create an unnecessary Interval instance.'
]
