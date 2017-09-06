"
see BorderedMorph
"
Class {
	#name : #InsetBorder,
	#superclass : #SimpleBorder,
	#category : #Morphic-Base-Borders,
	#timestamp : 'kfr 10/27/2003 09:32'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
InsetBorder>>bottomRightColor [
	"Changed from direct access to color since, if nil,
	self color is transparent."
	
	^width = 1 
		ifTrue: [self color twiceLighter]
		ifFalse: [self color lighter]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
InsetBorder>>colorsAtCorners [
	| c c14 c23 |
	c := self color.
	c14 := c lighter. c23 := c darker.
	^Array with: c23 with: c14 with: c14 with: c23.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
InsetBorder>>style [
	^#inset
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
InsetBorder>>topLeftColor [
	"Changed from direct access to color since, if nil,
	self color is transparent."
	
	^width = 1 
		ifTrue: [self color twiceDarker]
		ifFalse: [self color darker]
]

{
	#category : #'color tracking',
	#timestamp : ' 8/31/2017 05:26:13'
}
InsetBorder>>trackColorFrom: aMorph [
	baseColor ifNil:[self color: aMorph insetColor].
]
