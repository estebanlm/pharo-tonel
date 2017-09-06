"
A custom transform morph for a morphic based tree
"
Class {
	#name : #MorphTreeTransformMorph,
	#superclass : #TransformMorph,
	#category : #Morphic-Widgets-Tree,
	#timestamp : 'TorstenBergmann 9/5/2014 15:29'
}

{
	#category : #submorphs-add/remove,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeTransformMorph>>addAllMorphs: aCollection after: anotherMorph [
	^self privateAddAllMorphs: aCollection 
			atIndex: (anotherMorph index ifNil: [submorphs size])
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeTransformMorph>>bottomVisibleRowForCanvas: aCanvas [
     "return the bottom visible row in aCanvas's clip rectangle"
	
	^ self rowAtLocation: (aCanvas clipRect  bottomRight).

]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeTransformMorph>>bottomVisibleRowForCanvas: aCanvas startingAt: aPos [
     "return the bottom visible row in aCanvas's clip rectangle"
	
	^ self rowAtLocation: (aCanvas clipRect  bottomRight)  startingAt: aPos

]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeTransformMorph>>drawRawColorOn: aCanvas forSubmorph: aSubMorph [
	| c frame |
	frame := (aSubMorph fullBounds withWidth: owner scroller innerBounds width) translateBy:(owner scroller offset x)@0.
	aSubMorph = owner listManager searchedElement
		ifTrue: [ 
			aCanvas fillRectangle: frame color: owner secondarySelectionColor.
			^ self ].
	owner listManager isCheckList
		ifTrue: [ 
			aSubMorph = owner listManager lastClickedMorph
				ifTrue: [ 
					aCanvas fillRectangle: frame color: owner selectionColorToUse.
					^ self ] ]
		ifFalse: [ 
			aSubMorph selected
				ifTrue: [ 
					aCanvas fillRectangle: frame color: owner selectionColorToUse.
					^ self ] ].
	(c := aSubMorph color) notNil
		ifTrue: [ 
			c isColor
				ifTrue: [ 
					aCanvas
						frameAndFillRectangle: frame
						fillColor: c
						borderWidth: 0
						borderColor: Color transparent ]
				ifFalse: [ 
					c origin: aSubMorph bounds topLeft.
					c direction: aSubMorph bounds width @ 0.
					aCanvas fillRectangle: frame basicFillStyle: c ] ]
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeTransformMorph>>drawSubmorphsOn: aCanvas [
	submorphs ifEmpty: [^ self].
	aCanvas transformBy: transform
		clippingTo: (aCanvas clipRect intersect: (owner clippingBounds) ifNone: ["we're done here" ^ self ])
		during: [:myCanvas |  | top bottom |
			top := self topVisibleRowForCanvas: myCanvas.
			bottom := self bottomVisibleRowForCanvas: myCanvas startingAt: top.
			bottom 
				to: top
				by: -1			
				do: [:row | | m |
					m := submorphs basicAt: row.
					self drawRawColorOn: myCanvas forSubmorph: m.
					myCanvas fullDrawMorph: m] ]
		smoothing: smoothing.
	owner withTreeLines ifTrue: [owner drawLinesOn: aCanvas].
	owner enabled ifFalse: [ aCanvas fillRectangle: owner innerBounds fillStyle: (owner paneColor alpha: 0.2) ]

]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeTransformMorph>>fullBounds [
	"Overridden to clip submorph hit detection to my bounds."
	"It might be better to override doLayoutIn:, and remove this method"

	fullBounds ifNotNil:[^ fullBounds].
	fullBounds := bounds.
	^ fullBounds
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeTransformMorph>>initialize [
	super initialize.
	self smoothingOn
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeTransformMorph>>localSubmorphBounds [
	"Answer, in my coordinate system, the bounds of all my visible submorphs (or nil if no visible submorphs)"
	localBounds ifNil: [ 
		self hasSubmorphs ifFalse: [^ nil].
		localBounds :=  self firstSubmorph fullBounds topLeft corner: owner maxNodeWidth @ (self lastSubmorph fullBounds bottom + owner extraScrollRange)].
	^ localBounds 

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeTransformMorph>>privateAddAllMorphs: aCollection atIndex: index [
	"Private. Add aCollection of morphs to the receiver"
	submorphs := Array 
		new: submorphs size + aCollection size
		streamContents: [:str |
			1 to: index do: [:p | str nextPut: (submorphs atWrap: p)].
			str nextPutAll: aCollection.
			index + 1 to: submorphs size do: [:p | str nextPut: (submorphs atWrap: p)]].
	aCollection do: [:m |  
		m fullBounds. 
		m privateOwner: self].
	self layoutChanged.

]

{
	#category : #'change reporting',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeTransformMorph>>privateInvalidateMorph: aMorph [

]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeTransformMorph>>rowAtLocation: aPoint [
	"return the number of the row at aPoint"
	| y |
	y := aPoint y.
	submorphs ifEmpty: [^ nil].
	submorphs doWithIndex:  [:m :idx | m topLeft y >= y ifTrue: [^ (idx - 1) max: 1]].
	^ submorphs size
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeTransformMorph>>rowAtLocation: aPoint startingAt: aPosition [
	"return the number of the row at aPoint"
	| y |
	y := aPoint y.
	submorphs ifEmpty: [^ nil].
	aPosition to: submorphs size do: [ :idx | | m |
		m := submorphs basicAt: idx.
		m topLeft y >= y ifTrue: [^ (idx - 1) max: 1]].
	^ submorphs size
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeTransformMorph>>submorphBounds [
	"Private. Compute the actual full bounds of the receiver, optimized for speed"
	self hasSubmorphs ifFalse: [^ nil].
	^ self firstSubmorph topLeft corner: owner scroller bounds bottomLeft + (0@ owner extraScrollRange)

]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeTransformMorph>>topVisibleRowForCanvas: aCanvas [
     "return the top visible row in aCanvas's clip rectangle"

        ^ self rowAtLocation: (aCanvas clipRect topLeft).

]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeTransformMorph>>topVisibleRowForCanvas: aCanvas startingAt: aPos [
     "return the top visible row in aCanvas's clip rectangle"

        ^ self rowAtLocation: (aCanvas clipRect topLeft) startingAt: aPos.

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeTransformMorph>>wantsSteps [
	^ false
]
