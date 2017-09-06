"
I am a link used to render a Hiedra ruler.
"
Class {
	#name : #HiLink,
	#superclass : #HiRenderingElement,
	#instVars : [
		'linkBuilder',
		'origin',
		'target',
		'checkpoints'
	],
	#category : #Hiedra-Rendering,
	#timestamp : 'MartinDias 3/18/2016 21:16'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLink class>>linkBuilder: aLinkBuilder origin: aNode target: anotherNode [

	^ self basicNew
		initializeLinkBuilder: aLinkBuilder origin: aNode target: anotherNode;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLink>>= other [

	^ self class = other class and: [
		origin = other origin and: [ 
		target = other target and: [ 
		linkBuilder = other linkBuilder ] ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLink>>checkpoints [
	^ checkpoints
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLink>>checkpoints: anObject [
	checkpoints := anObject
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLink>>hash [

	^ origin hash bitXor: (target hash bitXor: linkBuilder hash)
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLink>>ifNode: nodeBlock ifLink: linkBlock [

	^ linkBlock cull: self
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLink>>initializeLinkBuilder: aLinkBuilder origin: aNode target: anotherNode [

	self initialize.
	
	linkBuilder := aLinkBuilder.
	origin := aNode.
	target := anotherNode.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLink>>intermediateIndices [

	| originRowIndex targetRowIndex |
	originRowIndex := origin rowIndex.
	targetRowIndex := target rowIndex.

	^ originRowIndex >= targetRowIndex
		ifTrue: [ originRowIndex - 1 to: targetRowIndex + 1 by: -1 ]
		ifFalse: [ originRowIndex + 1 to: targetRowIndex - 1 ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLink>>isLink [

	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLink>>linkBuilder [
	^ linkBuilder
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLink>>origin [
	^ origin
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLink>>printOn: aStream [

	super printOn: aStream.
	
	aStream
		nextPut: $(;
		print: origin;
		nextPutAll: '->';
		print: target;
		nextPut: $).
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLink>>target [
	^ target
]
