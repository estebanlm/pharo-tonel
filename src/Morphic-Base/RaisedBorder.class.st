"
see BorderedMorph
"
Class {
	#name : #RaisedBorder,
	#superclass : #SimpleBorder,
	#category : #Morphic-Base-Borders,
	#timestamp : 'kfr 10/27/2003 09:32'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
RaisedBorder>>bottomRightColor [
	"Changed from direct access to color since, if nil,
	self color is transparent."
	
	^width = 1 
		ifTrue: [self color twiceDarker]
		ifFalse: [self color darker]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
RaisedBorder>>colorsAtCorners [
	| c c14 c23 |
	c := self color.
	c14 := c lighter. c23 := c darker.
	^Array with: c14 with: c23 with: c23 with: c14
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
RaisedBorder>>style [
	^#raised
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
RaisedBorder>>topLeftColor [
	"Changed from direct access to color since, if nil,
	self color is transparent."

	^width = 1 
		ifTrue: [self color twiceLighter]
		ifFalse: [self color lighter]
]

{
	#category : #'color tracking',
	#timestamp : ' 8/31/2017 05:26:13'
}
RaisedBorder>>trackColorFrom: aMorph [
	baseColor ifNil:[self color: aMorph raisedColor].
]
