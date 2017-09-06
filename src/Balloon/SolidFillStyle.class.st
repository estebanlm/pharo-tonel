"
SolidFillStyle is a fill which represents a color for the BalloonEngine.

Instance variables:
	color	<Color>	The color to use.
	pixelValue32 <Integer>	The cached pixel value to use.
"
Class {
	#name : #SolidFillStyle,
	#superclass : #FillStyle,
	#instVars : [
		'color',
		'pixelValue32'
	],
	#category : #Balloon-Fills,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:11'
}
SolidFillStyle class>>color: aColor [
	^self new color: aColor
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:11'
}
SolidFillStyle>>asColor [
	^color
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
SolidFillStyle>>color: aColor [
	color := aColor.
	pixelValue32 := aColor scaledPixelValue32
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
SolidFillStyle>>isSolidFill [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
SolidFillStyle>>isTranslucent [
	^color isTranslucent
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
SolidFillStyle>>isTransparent [
	^color isTransparent
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:11'
}
SolidFillStyle>>printOn: aStream [
	super printOn: aStream.
	aStream nextPut:$(; print: color; nextPut:$).
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
SolidFillStyle>>scaledPixelValue32 [
	"Return the alpha scaled pixel value for depth 32"
	^pixelValue32
]
