"
An AthensDisplayScanner displays the paragraphs text on an AthensCanvas.
"
Class {
	#name : #AthensDisplayScanner,
	#superclass : #DisplayScanner,
	#instVars : [
		'canvas'
	],
	#category : #Athens-Morphic,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensDisplayScanner class>>for: aParagraph on: anAthensCanvas [
	^ self new initWithParagraph: aParagraph andCanvas: anAthensCanvas; yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensDisplayScanner class>>on: anAthensCanvas [
	^ self new initWith: anAthensCanvas; yourself
]

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensDisplayScanner>>displayString: string from: startIndex to: stopIndex at: aPoint [
	canvas pathTransform
		restoreAfter: [ 
			canvas pathTransform translateBy: aPoint + (0@font ascent).
			canvas drawString: string from: startIndex to: stopIndex ]
]

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensDisplayScanner>>fillTextBackground [
	backgroundColor ifNotNil: [ canvas drawShape: (line left @ lineY extent: line width @ line lineHeight) ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensDisplayScanner>>initWithParagraph: aParagraph andCanvas: anAthensCanvas [
	self text: aParagraph text textStyle: aParagraph textStyle.
	canvas := anAthensCanvas
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensDisplayScanner>>initialize [
	super initialize.
]

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensDisplayScanner>>setFont [
	super setFont.
	canvas setFont:font.
	canvas setPaint: foregroundColor
]
