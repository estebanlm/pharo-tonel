"
I am a decorator for the paragraph of a text area. I can be used to draw something on the paragraph 
"
Class {
	#name : #RubParagraphDecorator,
	#superclass : #Object,
	#instVars : [
		'next'
	],
	#category : #Rubric-Editing-Core,
	#timestamp : 'FranckWarlouzet 7/29/2015 13:03'
}

{
	#category : #querying,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubParagraphDecorator class>>classOfDecoratorNamed: aKey  [
	^ self allSubclasses detect: [ :cls | cls key = aKey ] ifNone: [  ]
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubParagraphDecorator class>>key [
	^ self subclassResponsibility 
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubParagraphDecorator class>>next: aDecoratorOrAParagraph [
	^ self new next: aDecoratorOrAParagraph 
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubParagraphDecorator>>canDrawDecoratorsOn: aCanvas [

	^self drawingEnabled and: [ 
		self selectionStart isNotNil and: [ 
			self selectionStop isNotNil
		]
	]
	
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubParagraphDecorator>>decoratorNamed: aKey [
	^ self key = aKey
		ifTrue: [ self ]
		ifFalse: [ next decoratorNamed: aKey ]
]

{
	#category : #'error handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubParagraphDecorator>>doesNotUnderstand: aMessage [
	^ [ aMessage sendTo: next ]
		on: MessageNotUnderstood
		do: [ super doesNotUnderstand: aMessage ]
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubParagraphDecorator>>drawOn: aCanvas  [
	"do nothing"
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubParagraphDecorator>>drawOn: aCanvas using: aDisplayScanner at: aPosition [

	(self canDrawDecoratorsOn: aCanvas) ifFalse: [ ^self ].
	
	self drawOn: aCanvas.
	next drawOn: aCanvas using: aDisplayScanner at: aPosition
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubParagraphDecorator>>drawOnAthensCanvas: anAthensCanvas [
	"do nothing by default"
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubParagraphDecorator>>drawOnAthensCanvas: aCanvas bounds: aRectangle color: aColor [

   (self canDrawDecoratorsOn: aCanvas) ifFalse: [ ^self ].

	self drawOnAthensCanvas: aCanvas.
	next drawOnAthensCanvas: aCanvas bounds: aRectangle color: aColor
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubParagraphDecorator>>hasDecorator: aDecorator [
	^ self = aDecorator or: [ next hasDecorator: aDecorator ]
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubParagraphDecorator>>hasDecoratorNamed: aKey [
	^ self key = aKey or: [ next hasDecoratorNamed: aKey ]
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubParagraphDecorator>>key [
	^self class key
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubParagraphDecorator>>next [
	^ next
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubParagraphDecorator>>next: anObject [
	next := anObject
]

{
	#category : #'instead of DNU',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubParagraphDecorator>>paragraph [
	"this method is here to find the paragraph in the chain, instead of relying on implementing #doesNotUnderstand: !!!"

	| p |
	
	p := next.
	
	[ p  isNotNil and: [ p isKindOf: RubParagraph ] ] whileFalse: [ 
		p := p next.
	].

	^p
	
	
]

{
	#category : #'instead of DNU',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubParagraphDecorator>>text  [

	^self paragraph text
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubParagraphDecorator>>unplug [
	next
		ifNotNil: [ 
			next unplug.
			next := nil ].
	super unplug
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubParagraphDecorator>>visibleStringFrom: topLeft to: bottomRight [
	| topLeftBlk bottomRightBlk startIdx stopIdx string  |
	topLeftBlk := self characterBlockAtPoint: topLeft.
	bottomRightBlk := self characterBlockAtPoint: bottomRight.
	startIdx := topLeftBlk stringIndex.
	stopIdx := bottomRightBlk stringIndex.
	string := self text string.
	^ self text string copyFrom: startIdx to: (stopIdx min: string size)

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubParagraphDecorator>>withoutDecorator [

	"for compatibility with the RubParagraph API"

	^ self paragraph

]
