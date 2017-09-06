"
Athens text background 
"
Class {
	#name : #AthensTextBackground,
	#superclass : #TextAttribute,
	#instVars : [
		'color'
	],
	#category : #Athens-Text,
	#timestamp : 'TorstenBergmann 2/12/2014 22:21'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextBackground>>color [

	^ color
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextBackground>>color: anObject [

	color := anObject
]

{
	#category : #scanning,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextBackground>>dominates: other [
	^ other class == self class
]

{
	#category : #scanning,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextBackground>>emphasizeScanner: scanner [
	"Set the emphasis for text display"
	scanner textBackground: color
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextBackground>>hash [
	^ color hash
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextBackground>>printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' code: '; print: color
]
