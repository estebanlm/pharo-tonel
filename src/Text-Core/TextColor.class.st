"
A TextColor encodes a text color change applicable over a given range of text.
"
Class {
	#name : #TextColor,
	#superclass : #TextAttribute,
	#instVars : [
		'color'
	],
	#category : #Text-Core,
	#timestamp : '<historical>'
}

{
	#category : #constants,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextColor class>>black [
	^ self new color: Color black
]

{
	#category : #constants,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextColor class>>blue [
	^ self new color: Color blue
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextColor class>>color: aColor [
	^ self new color: aColor
]

{
	#category : #constants,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextColor class>>cyan [
	^ self new color: Color cyan
]

{
	#category : #constants,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextColor class>>gray [
	^ self new color: Color gray
]

{
	#category : #constants,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextColor class>>green [
	^ self new color: Color green
]

{
	#category : #constants,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextColor class>>magenta [
	^ self new color: Color magenta
]

{
	#category : #constants,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextColor class>>red [
	^ self new color: Color red
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextColor class>>scanFrom: strm [
	"read a color in the funny format used by Text styles on files. c125000255 or cblue;"

	| r g b |
	strm peek isDigit
		ifTrue:
			[r := (strm next: 3) asNumber.
			g := (strm next: 3) asNumber.
			b := (strm next: 3) asNumber.
			^ self color: (Color r: r g: g b: b range: 255)].
	"A name of a color"
	^ self color: (Color perform: (strm upTo: $;) asSymbol)
]

{
	#category : #constants,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextColor class>>white  [
	^ self new color: Color white
]

{
	#category : #constants,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextColor class>>yellow [
	^ self new color: Color yellow
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextColor>>= other  [
	^ (other class == self class) 
		and: [other color = color]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextColor>>color [
	^ color
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextColor>>color: aColor [
	color := aColor
]

{
	#category : #scanning,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextColor>>dominates: other [
	^ other class == self class
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextColor>>hash [
	^ color hash
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextColor>>printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' code: '; print: color
]

{
	#category : #scanning,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextColor>>writeScanOn: strm [
	"Two formats.  c125000255 or cblue;"

	| nn |
	strm nextPut: $c.
	(nn := color name) ifNotNil: [
		(self class respondsTo: nn) ifTrue: [
			^ strm nextPutAll: nn; nextPut: $;]].
	(Array with: color red with: color green with: color blue) do: [:float | | str |
		str := '000', (float * 255) asInteger printString.
		strm nextPutAll: (str copyFrom: str size-2 to: str size)]
]
