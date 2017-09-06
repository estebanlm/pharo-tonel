"
I represent a expression evaluation. For example, a 'Do It' or an 'Inspect It'.
"
Class {
	#name : #EpExpressionEvaluation,
	#superclass : #EpEvent,
	#instVars : [
		'expression'
	],
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:50'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpExpressionEvaluation class>>expression: anExpression  [
	^ self basicNew 
		initializeExpression: anExpression;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpExpressionEvaluation>>= other [

	^ self class = other class 
		and: [ self expression = other expression ]
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpExpressionEvaluation>>accept: aVisitor [

	^ aVisitor visitExpressionEvaluation: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpExpressionEvaluation>>expression [

	^ expression
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpExpressionEvaluation>>hash [

	^ self class hash bitXor: self expression hash
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpExpressionEvaluation>>initializeExpression: anExpression [

	self initialize.
	expression := anExpression.
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpExpressionEvaluation>>printOn: aStream [
	super printOn: aStream.

	aStream 
		nextPut: $(;
		nextPutAll: self expression asString;
		nextPut: $)
]
