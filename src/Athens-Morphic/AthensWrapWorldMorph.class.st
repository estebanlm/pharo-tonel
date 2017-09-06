"
An AthensWrapWorldMorph is a AthensWrapMorph holding a specialized Athens WorldMorph. This Athens WorldMorph draws the submorphs with an AthensCanvas.

Instance Variables
	worldmorph:		the Athens WorldMorph
	wrappedWorldDisplay:		a display wrapper

"
Class {
	#name : #AthensWrapWorldMorph,
	#superclass : #AthensWrapMorph,
	#instVars : [
		'worldmorph',
		'wrappedWorldDisplay'
	],
	#category : #Athens-Morphic,
	#timestamp : 'NicolaiHess 1/4/2015 18:35'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensWrapWorldMorph>>defaultExtent [
	^ 400 @ 400
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensWrapWorldMorph>>initialize [
	super initialize.
	self extent: self defaultExtent.
	self hResizing: #spaceFill.
	self vResizing: #spaceFill.
	wrappedWorldDisplay := AthensWrappedWorldDisplay on: self.
	worldmorph := AthensWorldMorph new.
	worldmorph color: Color orange.
	worldmorph addHand: HandMorph new.
	worldmorph display: wrappedWorldDisplay.
	self addMorph: worldmorph
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensWrapWorldMorph>>layoutChanged [
	super layoutChanged.
	worldmorph ifNotNil:[:w |  w extent: self extent].
]

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensWrapWorldMorph>>step [
	self changed
]

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensWrapWorldMorph>>stepTime [
	^ 50
]
