"
Checks for any unary ""accessing"" methods without explicit return statements.
"
Class {
	#name : #RBUnaryAccessingMethodWithoutReturnRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'monty 6/12/2015 17:22'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnaryAccessingMethodWithoutReturnRule class>>checksMethod [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnaryAccessingMethodWithoutReturnRule class>>uniqueIdentifierName [

	^ 'UnaryAccessingMethodWithoutReturnRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnaryAccessingMethodWithoutReturnRule>>basicCheck: aMethod [
	(aMethod numArgs > 0 or: [ aMethod isAbstract ])
		ifTrue: [ ^ false ].
	((aMethod methodClass organization categoryOfElement: aMethod selector) asString
		beginsWith: 'accessing')
		ifFalse: [ ^ false ].
	aMethod parseTree
		nodesDo: [ :each | 
			each isReturn
				ifTrue: [ ^ false ] ].
	^ true
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnaryAccessingMethodWithoutReturnRule>>checkMethod: aMethod [
	(self basicCheck: aMethod)
		ifTrue: [ result addMethod: aMethod ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnaryAccessingMethodWithoutReturnRule>>group [
	^ 'Potential Bugs'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUnaryAccessingMethodWithoutReturnRule>>name [
	^ 'Unary "accessing" method without explicit return'
]
