"
ColorComponentSelector showing an alpha gradient over a hatched background.
"
Class {
	#name : #AColorSelectorMorph,
	#superclass : #BracketSliderMorph,
	#category : #Morphic-Widgets-ColorPicker,
	#timestamp : 'gvc 5/18/2007 13:52'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
AColorSelectorMorph>>color: aColor [
	"Set the gradient colors."
	
	super color: aColor asNontranslucentColor.
	self fillStyle: self defaultFillStyle
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
AColorSelectorMorph>>defaultFillStyle [
	"Answer the hue gradient."

	^(GradientFillStyle colors: {self color alpha: 0. self color})
		origin: self topLeft;
		direction: (self bounds isWide
					ifTrue: [self width@0]
					ifFalse: [0@self height])
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
AColorSelectorMorph>>drawOn: aCanvas [
	"Draw a hatch pattern first."

	aCanvas
		fillRectangle: self innerBounds
		fillStyle: (InfiniteForm with: self hatchForm).
	super drawOn: aCanvas

]

{
	#category : #'visual properties',
	#timestamp : ' 8/31/2017 05:26:14'
}
AColorSelectorMorph>>fillStyle: fillStyle [
	"If it is a color then override with gradient."
	
	fillStyle isColor
		ifTrue: [self color: fillStyle]
		ifFalse: [super fillStyle: fillStyle]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:14'
}
AColorSelectorMorph>>hatchForm [
	"Answer a form showing a grid hatch pattern."

	^ColorPresenterMorph hatchForm
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
AColorSelectorMorph>>initialize [
	"Initialize the receiver."

	super initialize.
	self
		value: 1.0;
		color: Color black
]
