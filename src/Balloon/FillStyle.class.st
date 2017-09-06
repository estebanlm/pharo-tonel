"
FillStyle is an abstract base class for fills in the BalloonEngine.
"
Class {
	#name : #FillStyle,
	#superclass : #Object,
	#category : #Balloon-Fills,
	#timestamp : '<historical>'
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:11'
}
FillStyle>>asColor [
	^self subclassResponsibility 
]

{
	#category : #'*Balloon',
	#timestamp : ' 8/31/2017 05:26:11'
}
FillStyle>>fillRectangle: aRectangle on: aCanvas [
	"Fill the given rectangle on the given canvas with the receiver."
	
	aCanvas fillRectangle: aRectangle basicFillStyle: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
FillStyle>>isBitmapFill [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
FillStyle>>isCompositeFill [
	"Answer whether the receiver is a composite fill.
	False by default."

	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
FillStyle>>isGradientFill [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
FillStyle>>isOrientedFill [
	"Return true if the receiver keeps an orientation (e.g., origin, direction, and normal)"
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
FillStyle>>isSolidFill [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
FillStyle>>isTranslucent [
	^true "Since we don't know better"
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
FillStyle>>isTransparent [
	^false
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:11'
}
FillStyle>>mixed: fraction with: aColor [
	^self asColor mixed: fraction with: aColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
FillStyle>>scaledPixelValue32 [
	"Return a pixel value of depth 32 for the primary color in the fill style"
	^self asColor scaledPixelValue32
]
