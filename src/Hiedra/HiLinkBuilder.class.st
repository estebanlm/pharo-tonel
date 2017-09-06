"
I know how to build ruler links.
"
Class {
	#name : #HiLinkBuilder,
	#superclass : #HiBuilder,
	#instVars : [
		'label',
		'color',
		'width',
		'rendererClass',
		'dashes',
		'conditionBlock',
		'targetsBlock'
	],
	#category : #Hiedra-Builders,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLinkBuilder>>color [
	
	^ color
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLinkBuilder>>color: anObject [
	
	color := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLinkBuilder>>conditionBlock [

	^ conditionBlock ifNil: [ 
		conditionBlock := [ :node | true ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLinkBuilder>>conditionBlock: aBlockClosure [

	conditionBlock := aBlockClosure
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLinkBuilder>>dashes [
	^ dashes
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLinkBuilder>>dashes: anArrayOfNumbers [
	dashes := anArrayOfNumbers
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLinkBuilder>>destinationsBlock: aBlockClosure  [
	self 
		deprecated: 'Use targetsBlock: instead'
		on: '30 March 2016' 
		in: 'Pharo-5.0-50571-'.
	^ self targetsBlock: aBlockClosure
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLinkBuilder>>initialize [
	super initialize.
	
	rendererClass := HiSnakeLinkRenderer.
	dashes := #().
	width := 2.1.
	color := Smalltalk ui theme caretColor.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLinkBuilder>>label [
	^ label
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLinkBuilder>>label: anObject [
	label := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLinkBuilder>>printOn: aStream [
	"FIX: for debugging"
	label ifNil: [ ^ super printOn: aStream ].
	
	label printOn: aStream.
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLinkBuilder>>renderer [
	^ self rendererClass new
		linkBuilder: self;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLinkBuilder>>rendererClass [
	^ rendererClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLinkBuilder>>rendererClass: anObject [
	rendererClass := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLinkBuilder>>targetsBlock [
	^ targetsBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLinkBuilder>>targetsBlock: aBlockClosure [
	targetsBlock := aBlockClosure
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLinkBuilder>>targetsOf: anObject [

	^ (self conditionBlock cull: anObject) 
		ifTrue: [ self targetsBlock cull: anObject ]
		ifFalse: [ #() ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLinkBuilder>>width [
	
	^ width
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiLinkBuilder>>width: anObject [
	
	width := anObject
]
