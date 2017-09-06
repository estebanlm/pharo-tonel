"
An array of colors
"
Class {
	#name : #ColorArray,
	#superclass : #ArrayedCollection,
	#type : #words,
	#category : #'Graphics-Display Objects',
	#timestamp : 'TorstenBergmann 2/12/2014 15:40'
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:09'
}
ColorArray>>asColorArray [
	^self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
ColorArray>>at: index [
	^(super at: index) asColorOfDepth: 32
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
ColorArray>>at: index put: aColor [
	^super at: index put: (aColor pixelWordForDepth: 32).
]
