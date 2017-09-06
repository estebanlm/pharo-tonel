"

"
Class {
	#name : #RubScrolledTextExtraSurface,
	#superclass : #RubScrolledTextExtra,
	#category : #Rubric-Editing-Widgets,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtraSurface>>computedHeightFrom: aRectangle [
	^ aRectangle height min: self scrollBounds height
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtraSurface>>computedPositionFrom: aRectangle [
	^  aRectangle topLeft

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtraSurface>>computedWidthFrom: aRectangle [
	^  aRectangle width min: self scrollBounds width

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtraSurface>>isOver [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtraSurface>>level [
	^ 0
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubScrolledTextExtraSurface>>manageLayoutInBounds: aRectangle [
	self position: (self computedPositionFrom: aRectangle).
	self extent: (self computedExtentFrom: aRectangle).
	self changed.
	^ aRectangle 
]
