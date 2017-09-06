"

"
Class {
	#name : #MalGraphEdge,
	#superclass : #Object,
	#instVars : [
		'model',
		'from',
		'to'
	],
	#category : #Moose-Algos-Graph,
	#timestamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphEdge class>>with: aModel [

	^ self new model: aModel
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphEdge class>>with: aModel from: srcNode to: dstNode [
	| edge |
	edge := self new.
	edge model: aModel.
	edge from: srcNode.
	edge to: dstNode.
	^ edge.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphEdge>>asTuple [

	^ {from model. to model}
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphEdge>>from [
	^ from
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphEdge>>from: anObject [
	from := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphEdge>>model [
	^ model
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphEdge>>model: aModel [
	
	model := aModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphEdge>>printOn: aStream [
	self from printOn: aStream.
	aStream << ' -> '.
	self to printOn: aStream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphEdge>>printString [

	^ self from printString, ' -> ', self to printString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphEdge>>to [
	^ to
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphEdge>>to: anObject [
	to := anObject
]
