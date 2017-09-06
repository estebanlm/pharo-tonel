"
Simple fillstyle that draws a color at the specified origin with option extent.
"
Class {
	#name : #ColorFillStyle,
	#superclass : #SolidFillStyle,
	#instVars : [
		'origin',
		'extent'
	],
	#category : #Balloon-Fills,
	#timestamp : 'gvc 12/8/2008 13:05'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
ColorFillStyle>>extent [
	"Answer the value of extent"

	^ extent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
ColorFillStyle>>extent: anObject [
	"Set the value of extent"

	extent := anObject
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:11'
}
ColorFillStyle>>fillRectangle: aRectangle on: aCanvas [
	"Fill the given rectangle on the given canvas with the receiver."
	
	|o c|
	o := self origin ifNil: [aRectangle origin] ifNotNil: [self origin].
	c := self extent ifNil: [aRectangle corner] ifNotNil: [o + self extent].
	aCanvas fillRectangle: (o corner: c) basicFillStyle: self
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:11'
}
ColorFillStyle>>isOrientedFill [
	"Answer true if origin is not nil so that morph movement adjusts origin."
	
	^self origin notNil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
ColorFillStyle>>origin [
	"Answer the value of origin"

	^ origin
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
ColorFillStyle>>origin: anObject [
	"Set the value of origin"

	origin := anObject
]
