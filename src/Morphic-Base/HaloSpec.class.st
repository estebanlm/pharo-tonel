"
Sets spec's for how handles are layed out in a halo.
"
Class {
	#name : #HaloSpec,
	#superclass : #Object,
	#instVars : [
		'addHandleSelector',
		'horizontalPlacement',
		'verticalPlacement',
		'color',
		'iconSymbol'
	],
	#category : #Morphic-Base-Widgets,
	#timestamp : 'kfr 10/27/2003 16:23'
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:13'
}
HaloSpec>>addHandleSelector [
	^ addHandleSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
HaloSpec>>color [
	^ color
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
HaloSpec>>horizontalPlacement [
	^ horizontalPlacement
]

{
	#category : #setter,
	#timestamp : ' 8/31/2017 05:26:13'
}
HaloSpec>>horizontalPlacement: hp verticalPlacement: vp color: col iconSymbol: is addHandleSelector: sel [
	horizontalPlacement := hp.
	verticalPlacement := vp.
	color:= col.
	iconSymbol := is asSymbol.
	addHandleSelector := sel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
HaloSpec>>iconSymbol [
	^ iconSymbol
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:13'
}
HaloSpec>>printOn: aStream [
	"Add a textual printout representing the receiver to a stream"

	super printOn: aStream.
	aStream nextPutAll: ' (', addHandleSelector asString, ' ', iconSymbol asString, ')'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
HaloSpec>>verticalPlacement [
	^ verticalPlacement
]
