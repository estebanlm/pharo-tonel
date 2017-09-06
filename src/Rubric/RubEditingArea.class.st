"
I am the common class to use for editing text in an area
"
Class {
	#name : #RubEditingArea,
	#superclass : #RubAbstractTextArea,
	#instVars : [
		'wrapped',
		'editorClass'
	],
	#category : #Rubric-Editing-Core,
	#timestamp : 'FranckWarlouzet 7/29/2015 12:54'
}

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>autoScroll: anEvent [
	scrollPane ifNil: [ ^self ].
	self scrollPivot  ifNil: [ ^self ].
	scrollPane scrollWhenMouseMove: anEvent pivotPoint: self scrollPivot
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>beForPlainText [
	self editingMode: RubPlainTextMode new
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>beForSmalltalkCode [
	self editingMode: RubSmalltalkCodeMode new

]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>beForSmalltalkCodeInClass: aClass [
	self editingMode: (RubSmalltalkCodeMode new
		classOrMetaClass: aClass;
		yourself)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>beForSmalltalkCodeWithDefaultFont [
	self editingMode: RubSmalltalkCodeMode new.
	self font: StandardFonts defaultFont
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>beForSmalltalkComment [
	self editingMode: RubSmalltalkCommentMode new
]

{
	#category : #'public accessing',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>beForSmalltalkScripting [
	self editingMode: RubSmalltalkScriptingMode new
]

{
	#category : #'public accessing',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>beForSmalltalkScriptingWithDefaultFont [
	self editingMode: RubSmalltalkScriptingMode new.
	self font: StandardFonts defaultFont
]

{
	#category : #'public accessing',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>beNotWrapped [
	self wrapped
		ifTrue: [ self handleParagraphChange: [ self wrapped: false ] ]
]

{
	#category : #'public accessing',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>beWrapped [
	self wrapped
		ifFalse: [ self handleParagraphChange: [ self wrapped: true ] ]
]

{
	#category : #binding,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>bindingOf: aString [
	^ self editingMode bindingOf: aString
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>classOrMetaClass: aBehavior [
	"set the classOrMetaClass in the receiver's styler to aBehavior"
	self shoutStyler ifNotNil: [ :styler | styler classOrMetaClass: aBehavior]
]

{
	#category : #'error handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>doesNotUnderstand: aMessage [
	"{aMessage . thisContext sender} inspectOnce."
	^ aMessage sendTo: self editingMode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>editorClass [
	^ editorClass ifNil: [ editorClass := RubTextEditor ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>editorClass: aClass [
	editorClass := aClass
]

{
	#category : #highlighting,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>ensureAndGetNewHighlightSegmentFrom: startIndex to: stopIndex [
	
	^ self 
		removeHighlightSegment;
		addSegment: (RubHighlightSegmentMorph from: startIndex to: stopIndex)
]

{
	#category : #highlighting,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>ensureAndGetNewHoverHighlightSegmentFrom: startIndex to: stopIndex [
	
	^ self 
		removeHoverHighlightSegment;
		addSegment: (RubHoverHighlightSegmentMorph from: startIndex to: stopIndex)
]

{
	#category : #highlighting,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>getHighlightSegment [

	^ self getSegmentOfClass:  RubHighlightSegmentMorph
]

{
	#category : #highlighting,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>getHoverHighlightSegment [

	^ self getSegmentOfClass: RubHoverHighlightSegmentMorph
]

{
	#category : #highlighting,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>getSegmentOfClass: aClass [

	^ self segments detect: [ :each | each class = aClass ] ifNone: [ nil ]
]

{
	#category : #highlighting,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>hasHighlightSegment [

	^ self getHighlightSegment notNil
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>mouseMove: evt [
	| editEvt |
	super mouseMove: evt.
	scrollPane ifNil: [ ^ self ].
	self scrollPivot: evt cursorPoint.
	editEvt := evt transformedBy: (self transformedFrom: scrollPane ) inverseTransformation.
	(editEvt position y between: scrollPane top and: scrollPane bottom)
		ifFalse: [
			self
				startStepping: #autoScroll:
				at: Time millisecondClockValue
				arguments: (Array with: evt)
				stepTime: 100	"fast enough" ]
		ifTrue: [ self stopSteppingSelector: #autoScroll: ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>newParagraph [
	^ RubCurrentLineBarDecorator	next: (RubExtraSelectionDecorator next: super newParagraph)
]

{
	#category : #highlighting,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>removeHighlightSegment [

	(self getHighlightSegment)
		ifNotNil: [ :aSegment | aSegment delete ].
]

{
	#category : #highlighting,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>removeHoverHighlightSegment [

	(self getHoverHighlightSegment)
		ifNotNil: [ :aSegment | aSegment delete ].
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>shoutAboutToStyle: myself [

	^self editingMode shoutAboutToStyle: myself
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>shoutStyler [
	^ self decoratorNamed: #shoutStyler
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>textArea [
	"for #whenTextAreaSelectionChanged:"
	^self
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>walkAlongDisplayedLine [
	^ self class walkAlongDisplayedLine
]

{
	#category : #'accessing decorators',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>withSecondarySelection [
	self withDecoratorNamed: #secondarySelection
]

{
	#category : #'accessing decorators',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>withSelectionBar [
	self withDecoratorNamed: #selectionBar
]

{
	#category : #'accessing decorators',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>withoutOpeningClosingDelimitersHighlight [
	self withoutDecoratorNamed: #openingClosingDelimitersHighlight
]

{
	#category : #'accessing decorators',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>withoutSelectionBar [
	self withoutDecoratorNamed: #selectionBar
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>withoutShoutStyler [
	self withoutDecoratorNamed: #shoutStyler
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>wrapped [
	^ wrapped ifNil: [ wrapped := false ] 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubEditingArea>>wrapped: aBoolean [
	wrapped := aBoolean
]
