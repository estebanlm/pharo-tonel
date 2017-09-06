"
Border supporting multiple ""sub-borders"".
"
Class {
	#name : #CompositeBorder,
	#superclass : #SimpleBorder,
	#instVars : [
		'borders'
	],
	#category : #Morphic-Base-Borders,
	#timestamp : 'gvc 5/18/2007 13:28'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:13'
}
CompositeBorder>>= aBorderStyle [
	"Check the sub-borders too"
	
	^super = aBorderStyle and: [
		self borders = aBorderStyle borders]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
CompositeBorder>>borders [
	"Answer the value of borders"

	^ borders
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
CompositeBorder>>borders: anObject [
	"Set the value of borders"

	borders := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
CompositeBorder>>colorsAtCorners [
	"Return the colors of the first border."
	
	^self borders first colorsAtCorners
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:13'
}
CompositeBorder>>frameRectangle: aRectangle on: aCanvas [
	"Draw each border in turn."
	
	|r|
	r := aRectangle.
	self borders do: [:b |
		b frameRectangle: r on: aCanvas.
		r := r insetBy: b width]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:13'
}
CompositeBorder>>hash [
	"Since #= is overridden."
	
	^super hash bitXor: self borders hash
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:13'
}
CompositeBorder>>isComposite [
	"Answer true."

	^true
]
