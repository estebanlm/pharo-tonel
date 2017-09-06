"
Alpha aware InfiniteForm.
"
Class {
	#name : #AlphaInfiniteForm,
	#superclass : #InfiniteForm,
	#instVars : [
		'origin',
		'extent'
	],
	#category : #'Graphics-Display Objects',
	#timestamp : 'gvc 5/18/2007 13:49'
}

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:09'
}
AlphaInfiniteForm>>computeBoundingBox  [
	"Refer to the comment in DisplayObject|computeBoundingBox."

	^self origin extent: self extent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
AlphaInfiniteForm>>direction: aPoint [
	"Ignore"

]

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:09'
}
AlphaInfiniteForm>>displayOnPort: aPort offsetBy: offset [

	| targetBox patternBox savedMap top left |

	aPort destForm depth < 32 ifTrue: [^super displayOnPort: aPort offsetBy: offset].
	"this version tries to get the form aligned where the user wants it and not just aligned with the cliprect"

	(patternForm isForm) ifFalse: [
		"patternForm is a Pattern or Color; just use it as a mask for BitBlt"
		^ aPort fill: aPort clipRect fillColor: patternForm rule: Form over].

	"do it iteratively"
	targetBox := aPort clipRect.
	patternBox := patternForm boundingBox.
	savedMap := aPort colorMap.
	aPort sourceForm: patternForm;
		fillColor: nil;
		combinationRule: Form blend;
		sourceRect: (0@0 extent: patternBox extent);
		colorMap: (patternForm colormapIfNeededFor: aPort destForm).
	top := (targetBox top truncateTo: patternBox height) + offset y.
	left :=  (targetBox left truncateTo: patternBox width) + offset x.

	left to: (targetBox right - 1) by: patternBox width do:
		[:x | top to: (targetBox bottom - 1) by: patternBox height do:
			[:y | aPort destOrigin: x@y; copyBits]].
	aPort colorMap: savedMap.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
AlphaInfiniteForm>>extent [
	"Answer the extent of the repeating area."

	^extent ifNil: [SmallInteger maxVal @ SmallInteger maxVal]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
AlphaInfiniteForm>>extent: anObject [
	"Set the value of extent"

	extent := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
AlphaInfiniteForm>>origin [
	"Answer the origin."
	
	^origin ifNil: [0@0]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
AlphaInfiniteForm>>origin: aPoint [
	"Set the origin."

	origin := aPoint
]
