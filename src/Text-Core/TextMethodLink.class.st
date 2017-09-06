"
An active link in a text linking to a method
"
Class {
	#name : #TextMethodLink,
	#superclass : #TextLink,
	#instVars : [
		'selector',
		'browseSenders',
		'sourceNode'
	],
	#category : #Text-Core,
	#timestamp : 'TorstenBergmann 1/31/2014 12:18'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextMethodLink class>>selector: aStringOrSymbol [
	^ self new
		selector: aStringOrSymbol;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextMethodLink class>>selector: aString senders: browseSenders [
	^ (self selector: aString)
		senders: browseSenders;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextMethodLink class>>sourceNode: aMessageNode [
	^ self new
		selector: aMessageNode selector;
		sourceNode: aMessageNode 
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextMethodLink>>= anotherObject [
	^ super = anotherObject
		and: [ selector = anotherObject selector
				and: [ browseSenders = anotherObject browseSenders
						and: [ self sourceNodeInterval = anotherObject sourceNodeInterval ] ] ]
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextMethodLink>>actOnClick: anEvent for: target in: aParagraph editor: anEditor [
	self flag: 'TODO: complete implementation with class'.
	
	browseSenders == anEvent shiftPressed
		ifTrue: [ anEditor implementorsOf: self selector ]
		ifFalse: [ anEditor sendersOf: self selector ].
		
	^ true
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextMethodLink>>actOnMove: anEvent for: target in: aParagraph editor: anEditor [
	anEvent shiftPressed ifFalse: [ ^ false ].
	anEditor textArea highlightMessageSend ifFalse: [ ^ false ].
	sourceNode ifNil: [ ^ false ].
	anEditor hoverHighlightInterval: self sourceNodeInterval.
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextMethodLink>>browseSenders [

	^browseSenders 
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextMethodLink>>hash [
	^ (((super hash + selector hash) hashMultiply + browseSenders hash) hashMultiply
		+ self sourceNodeInterval hash) hashMultiply
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextMethodLink>>initialize  [
	super initialize.
	browseSenders := false.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextMethodLink>>selector [
	^ selector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextMethodLink>>selector: aStringOrSymbol [
	selector := aStringOrSymbol asSymbol.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextMethodLink>>senders: aBoolean [
	browseSenders := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextMethodLink>>sourceNode [
	^ sourceNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextMethodLink>>sourceNode: anObject [
	sourceNode := anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextMethodLink>>sourceNodeInterval [
	sourceNode ifNil: [ ^ 1 to: 0 ].
	^ sourceNode keywordsPositions first to: sourceNode stop
]
