"
I make sure that all my submorphs will be drawn using Athens, not Balloon. For that I use a separate surface.
"
Class {
	#name : #AthensWrapMorph,
	#superclass : #Morph,
	#instVars : [
		'surface',
		'session'
	],
	#category : #Athens-Morphic,
	#timestamp : 'SeanDeNigris 4/26/2015 14:51'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensWrapMorph>>athensSurface [
	self checkSurface.
	
	^ surface
]

{
	#category : #'surface management',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensWrapMorph>>checkSurface [

	session == Smalltalk session ifFalse: [ 
		self initializeForNewSession
		 ].
	
	bounds extent ~= surface extent ifTrue: [ 
		"recreate a surface if dimensions are changed"	
		self createSurface
	 ]

]

{
	#category : #'surface management',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensWrapMorph>>createSurface [
	| extent |
	extent := bounds extent asIntegerPoint.
	surface := AthensCairoSurface extent: extent.

]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensWrapMorph>>drawOn: aCanvas [

	"do nothing"
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensWrapMorph>>drawOnAthensCanvas: aCanvas [

	"do nothing"
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensWrapMorph>>fullDrawOn: aCanvas [

	"Draw the full Morphic structure on the given Canvas"

	self visible ifFalse: [^ self].
	(aCanvas isVisible: self fullBounds) ifFalse:[^self].
	(self hasProperty: #errorOnDraw) ifTrue:[^self drawErrorOn: aCanvas].
	
	self checkSurface.

	[
		self render.
		surface displayOnMorphicCanvas: aCanvas at: bounds origin.
	
	] on: Error do: [:err |
		self setProperty: #errorOnDraw toValue: true.
		self setProperty: #drawError toValue: err freeze.
		^ self drawErrorOn: aCanvas
	]
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensWrapMorph>>fullDrawOnAthensCanvas: anAthensCanvas  [
	"Draw the full Morphic structure on the given Canvas"

	self visible ifFalse: [^ self].
	(anAthensCanvas isVisible: self fullBounds) ifFalse: [^self].
	(self hasProperty: #errorOnDraw) ifTrue: [^self "drawErrorOn: aCanvas" ].

	(anAthensCanvas isVisible: self bounds) ifTrue: [ anAthensCanvas draw: self ].
	
	submorphs reverseDo: [:m | anAthensCanvas fullDrawMorph: m ] 

]

{
	#category : #'events handling',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensWrapMorph>>handlesMouseDown: evt [
	^ true 
]

{
	#category : #'surface management',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensWrapMorph>>initializeForNewSession [
	self createSurface.
	session := Smalltalk session.

]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensWrapMorph>>render [
	surface drawDuring: [ :canvas |
		surface clear.
		canvas pathTransform restoreAfter: [ 
			"before rendering transform from a global coordinates (Morphic) to relative coordinates (Athens)"
			canvas pathTransform translateBy: self bounds origin negated.
			self fullDrawOnAthensCanvas: canvas.
		].
	].

]
