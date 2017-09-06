"
I am a special renderer of non-rectangular but polygon bricks
"
Class {
	#name : #GLMBrickAreaRenderer,
	#superclass : #GLMBrickRenderer,
	#category : #Glamour-Morphic-Brick-Renderer,
	#timestamp : 'AliakseiSyrel 3/4/2017 15:32'
}

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickAreaRenderer>>drawingBounds: aBrick [
	| aRectangle anOffset |
	
	anOffset := aBrick shadowOffset.
	
	aRectangle := aBrick brickBounds expandBy: (aBrick border widthTop + aBrick shadowWidth).
	anOffset isZero
		ifFalse: [ aRectangle := aRectangle quickMerge: (aRectangle translateBy: anOffset) ].
	
	^ aRectangle
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickAreaRenderer>>render: aBrick on: aCanvas [
	self renderShadowOf: aBrick on: aCanvas.
	self renderBackground: aBrick on: aCanvas.
	self renderBorder: aBrick on: aCanvas
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickAreaRenderer>>renderBackground: aBrick on: aCanvas [

	aCanvas
		drawPolygon: aBrick area vertices
		color: aBrick color
		borderWidth: 0
		borderColor: Color transparent
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickAreaRenderer>>renderBorder: aBrick on: aCanvas [

	aCanvas
		drawPolygon: aBrick area vertices
		color: Color transparent
		borderWidth: aBrick border widthTop
		borderColor: aBrick border colorTop
]

{
	#category : #'private - shadow',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickAreaRenderer>>renderCornerShadow: aBrick vector: aVector origin: anOrigin on: aCanvas [
	| anInset anOffset aShadowWidth aShadowOrigin aShadowEnd aGradient aRectangle |

	anOffset := aBrick shadowOffset.
	aShadowWidth  := aBrick shadowWidth.

	(aVector rightAngle: aVector next)
		ifTrue: [ 
			aGradient := self shadowGradientReverseFor: aBrick.
			aShadowOrigin := (aVector + anOrigin) + (aVector next * aShadowWidth) + (aVector next left * aShadowWidth).
			aShadowEnd := aVector + anOrigin.
			aRectangle := (aVector similar: aShadowWidth) origin: (aShadowOrigin) breadth: aShadowWidth ]
		ifFalse: [ 
			aGradient := self shadowGradientFor: aBrick.
			aShadowOrigin := aVector + anOrigin.
			aShadowEnd := (aVector + anOrigin) + (aVector left * aShadowWidth) + (aVector * aShadowWidth).
			aRectangle := (aVector left similar: aShadowWidth) origin: (aVector + anOrigin) breadth: aShadowWidth ].

	anInset := (aShadowEnd - aShadowOrigin) sign * aBrick shadowInset.
	
	(aVector rightAngle: aVector next)
		ifTrue: [
			aShadowOrigin := aShadowOrigin - anInset.
			aRectangle := aRectangle translateBy: anInset negated ]
		ifFalse: [
			aShadowOrigin := aShadowOrigin + anInset.
			aRectangle := aRectangle translateBy: anInset ].
	
	aShadowOrigin := aShadowOrigin + anOffset.
	aRectangle := aRectangle translateBy: anOffset.
	
	aGradient
		origin: aShadowOrigin;
		direction: aVector * aShadowWidth;
		radial: true;
		yourself.

	aCanvas fillRectangle: aRectangle fillStyle: aGradient
]

{
	#category : #'private - shadow',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickAreaRenderer>>renderShadow: aBrick vector: aVector origin: anOrigin on: aCanvas [
	| anInset anOffset aShadowWidth aShadowOrigin aShadowVector aShadowLength aGradient aRectangle |

	anInset := aBrick shadowInset.
	anOffset := aBrick shadowOffset.

	aShadowWidth  := aBrick shadowWidth.
	aShadowVector := aVector left length: aShadowWidth.
	
	aShadowLength := aVector length + (anInset * 2.0).

	((aVector rightAngle: aVector next) or: [ aVector previous rightAngle: aVector ])
		ifTrue: [ aShadowLength := aShadowLength - aShadowWidth + (anInset negated * 2 ) ].

	aShadowOrigin := anOrigin + anOffset + (aShadowVector * anInset) - (aVector * anInset).
	(aVector previous rightAngle: aVector)
		ifTrue: [ aShadowOrigin := aShadowOrigin + (aVector * aShadowWidth) + (aVector * anInset * 2) ].

	aGradient := (self shadowGradientFor: aBrick)
		origin: aShadowOrigin;
		direction: aShadowVector * aShadowWidth;
		yourself.

	aRectangle := aShadowVector origin: aShadowOrigin breadth: aShadowLength.

	aCanvas fillRectangle: aRectangle fillStyle: aGradient.
	"aCanvas frameRectangle: aRectangle color: Color red"
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickAreaRenderer>>renderShadowOf: aBrick on: aCanvas [
	| anArea aCurrentVector aFirstVector anOrigin |

	"no need to even try drawing if shadow width is zero"
	aBrick shadowWidth = 0
		ifTrue: [ ^ self ].

	anArea := aBrick area.

	aFirstVector := aBrick area vector.
	aCurrentVector := aFirstVector.
	anOrigin := aBrick area origin.

	[ aCurrentVector next ~= aFirstVector ] whileTrue: [ 
		self renderShadow: aBrick vector: aCurrentVector origin: anOrigin on: aCanvas.
		self renderCornerShadow: aBrick vector: aCurrentVector origin: anOrigin on: aCanvas.
		anOrigin := aCurrentVector + anOrigin.
		aCurrentVector := aCurrentVector next ].
	
	self renderShadow: aBrick vector: aCurrentVector origin: anOrigin on: aCanvas.
	self renderCornerShadow: aBrick vector: aCurrentVector origin: anOrigin on: aCanvas.

	aCanvas
		drawPolygon: (anArea vertices collect: [ :each | each + aBrick shadowOffset ])
		color: aBrick shadowColor
		borderWidth: 0
		borderColor: Color transparent
]
