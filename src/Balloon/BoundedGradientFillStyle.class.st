"
Gradient fillstyle that draws with optional extent.
"
Class {
	#name : #BoundedGradientFillStyle,
	#superclass : #GradientFillStyle,
	#instVars : [
		'extent'
	],
	#category : #Balloon-Fills,
	#timestamp : 'gvc 3/13/2009 12:19'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BoundedGradientFillStyle>>= aGradientFillStyle [
	"Answer whether equal."

	^super = aGradientFillStyle
		and: [self extent = aGradientFillStyle extent]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BoundedGradientFillStyle>>extent [
	"Answer the value of extent"

	^ extent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BoundedGradientFillStyle>>extent: anObject [
	"Set the value of extent"

	extent := anObject
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BoundedGradientFillStyle>>hash [
	"Hash is implemented because #= is implemented."
	
	^super hash bitXor: self extent hash
]
