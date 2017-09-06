"

"
Class {
	#name : #RubCharacterBlock,
	#superclass : #Object,
	#instVars : [
		'surface',
		'stringIndex',
		'textLine'
	],
	#category : #Rubric-TextScanning,
	#timestamp : ''
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>< aCharacterBlock  [
	"Answer whether the string index of the receiver precedes that of 
	aCharacterBlock."

	^stringIndex < aCharacterBlock stringIndex
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>><= aCharacterBlock  [
	"Answer whether the string index of the receiver does not come after that 
	of aCharacterBlock."

	^(self > aCharacterBlock) not
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>= aCharacterBlock [

	self species = aCharacterBlock species
		ifTrue: [^stringIndex = aCharacterBlock stringIndex]
		ifFalse: [^false]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>> aCharacterBlock  [
	"Answer whether the string index of the receiver comes after that of 
	aCharacterBlock."

	^aCharacterBlock < self
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>>= aCharacterBlock  [
	"Answer whether the string index of the receiver does not precede that of 
	aCharacterBlock."

	^(self < aCharacterBlock) not
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>area [
	^ surface area
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>areasOutside: aRectangle [
	^ surface areasOutside: aRectangle
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>bottom [
	^ surface bottom
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>bottomLeft [
	^ surface bottomLeft
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>bottomRight [
	^ surface bottomRight 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>corner [
	^ surface corner
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>distance: aCharacterBlock [
	"It returns absolute distance between two CharacterBlocks."
	^ (self stringIndex - aCharacterBlock stringIndex) abs
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>extent [
	^ surface extent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>height [
	^ surface height
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>insetBy: aPoint  [
	"Change the corner positions of the receiver so that its area translates by 
	the amount defined by the argument, aPoint."
	^ self copy surface: (surface insetBy: aPoint)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>left [
	^ surface left
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>max: aCharacterBlock [
	aCharacterBlock ifNil: [ ^ self ].
	^ aCharacterBlock > self
		ifTrue: [ aCharacterBlock ]
		ifFalse: [ self ]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>min: aCharacterBlock [
	aCharacterBlock ifNil: [ ^ self ].
	^ aCharacterBlock < self
		ifTrue: [ aCharacterBlock ]
		ifFalse: [ self ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>moveBy: aPoint  [
	"Change the corner positions of the receiver so that its area translates by 
	the amount defined by the argument, aPoint."
	surface := surface translateBy: aPoint
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>origin [
	^ surface origin
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>printOn: aStream [
	aStream nextPutAll: 'a CharacterBlock with index '.
	stringIndex printOn: aStream.
	aStream nextPutAll: ' and surface '.
	self surface printOn: aStream.
	textLine
		ifNotNil: [ 
			aStream
				cr;
				nextPutAll: ' in '.
			textLine printOn: aStream ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>privateSetCorner: aPoint [
	self surface privateSetCorner: aPoint
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>privateSetOrigin: aPoint [
	self surface privateSetOrigin: aPoint
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>right [
	^ surface right
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>stringIndex [
	"Answer the position of the receiver in the string it indexes."

	^stringIndex
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>stringIndex: anInteger topLeft: topLeft extent: extent  [
	stringIndex := anInteger.
	surface := topLeft extent: extent

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>surface [
	^ surface
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>surface: aRectangle [
	surface := aRectangle
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>textLine [
	^ textLine
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>textLine: aLine  [
	textLine := aLine
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>top [
	^ surface top
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>topLeft [
	^ surface topLeft
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>topRight [
	^ surface topRight
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>translateBy: aPoint  [
	"Change the corner positions of the receiver so that its area translates by 
	the amount defined by the argument, aPoint."
	^ self copy moveBy: aPoint
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>width [
	^ surface width
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>withLeft: anInteger [
	^ self copy surface: (surface withLeft: anInteger)

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCharacterBlock>>withRight: anInteger [
	^ self copy surface: (surface withRight: anInteger)
]
