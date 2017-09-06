"
Simple fillstyle that draws a (potentially translucent) form at the specified origin. Direction and normal are unused.
"
Class {
	#name : #ImageFillStyle,
	#superclass : #OrientedFillStyle,
	#instVars : [
		'form',
		'extent',
		'offset'
	],
	#category : #Balloon-Fills,
	#timestamp : 'gvc 9/23/2008 11:55'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:11'
}
ImageFillStyle class>>form: aForm [
	"Answer a new instance of the receiver with the given form."

	^self new form: aForm
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:11'
}
ImageFillStyle>>= anOrientedFillStyle [
	"Answer whether equal."

	^super = anOrientedFillStyle
		and: [self form = anOrientedFillStyle form]
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:11'
}
ImageFillStyle>>asColor [
	"Answer transparent, no other reasonable interpretation."
	
	^Color transparent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
ImageFillStyle>>extent [
	"Answer the value of extent"

	^ extent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
ImageFillStyle>>extent: anObject [
	"Set the value of extent"

	extent := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
ImageFillStyle>>form [
	"Answer the value of form"

	^ form
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
ImageFillStyle>>form: aForm [
	"Set the value of form"

	form := aForm.
	self direction: aForm extent
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:11'
}
ImageFillStyle>>hash [
	"Hash is implemented because #= is implemented."
	
	^super hash bitXor: self form hash
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:11'
}
ImageFillStyle>>initialize [
	"Initialize the receiver."

	super initialize.
	self
		origin: 0@0;
		offset: 0@0
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
ImageFillStyle>>offset [
	"Answer the value of offset"

	^ offset
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
ImageFillStyle>>offset: anObject [
	"Set the value of offset"

	offset := anObject
]
