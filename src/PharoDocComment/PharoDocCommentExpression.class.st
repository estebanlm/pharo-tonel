"
I am represent an expression within a String (typically the contents of a RBCommentNode resp. the comment text of a method. I am used as expression or the expected expression value by a PharoDocCommentNode.
"
Class {
	#name : #PharoDocCommentExpression,
	#superclass : #Object,
	#instVars : [
		'expressionInterval',
		'source'
	],
	#category : #PharoDocComment,
	#timestamp : 'NicolaiHess 11/1/2016 21:45'
}

{
	#category : #operation,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoDocCommentExpression>>evaluate [

	^ Smalltalk compiler evaluate: self expression
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoDocCommentExpression>>expression [
	^ self source copyFrom: expressionInterval first to: expressionInterval last
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoDocCommentExpression>>expressionCode [
	^ (RBParser parseFaultyExpression: self expression) doSemanticAnalysis; yourself
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoDocCommentExpression>>expressionInterval [
	^ expressionInterval
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoDocCommentExpression>>expressionInterval: anObject [
	expressionInterval := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoDocCommentExpression>>printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: '('.
	aStream nextPutAll: self expression. 
	aStream nextPutAll: ')'.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoDocCommentExpression>>source [
	^ source
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoDocCommentExpression>>source: anObject [
	source := anObject
]
