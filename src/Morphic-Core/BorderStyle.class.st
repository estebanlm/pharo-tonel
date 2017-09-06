"
See BorderedMorph

BorderedMorh new borderStyle: (BorderStyle inset width: 2); openInWorld.
"
Class {
	#name : #BorderStyle,
	#superclass : #Object,
	#classVars : [
		'Default'
	],
	#category : #Morphic-Core-Borders,
	#timestamp : 'kfr 10/27/2003 10:19'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle class>>borderStyleChoices [
	"Answer the superset of all supported borderStyle symbols"

	^ #(simple inset raised complexAltFramed complexAltInset complexAltRaised complexFramed complexInset complexRaised)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle class>>borderStyleForSymbol: sym [
	"Answer a border style corresponding to the given symbol"

	| aSymbol |
	aSymbol := sym == #none ifTrue: [#simple] ifFalse: [sym].
	^ self perform: aSymbol
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle class>>color: aColor width: aNumber [
	^self width: aNumber color: aColor
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle class>>default [
	^Default ifNil:[Default := self new]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle class>>thinGray [
	^ self width: 1 color: Color gray
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle class>>width: aNumber [
	^self width: aNumber color: Smalltalk ui theme borderColor
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle>>= aBorderStyle [
	^self species = aBorderStyle species
		and:[self style == aBorderStyle style
		and:[self width = aBorderStyle width
		and:[self color = aBorderStyle color]]].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle>>baseColor [
	^Color transparent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle>>baseColor: aColor [
	"Ignored"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle>>color [
	^Color transparent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle>>color: aColor [
	"Ignored"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle>>colorsAtCorners [
	^Array new: 4 withAll: self color
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle>>dotOfSize: diameter forDirection: aDirection [
	| form |
	form := Form extent: diameter@diameter depth: Display depth.
	form getCanvas fillOval: form boundingBox color: self color.
	^form
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle>>drawLineFrom: startPoint to: stopPoint on: aCanvas [
	^aCanvas line: startPoint to: stopPoint width: self width color: self color
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle>>frameOval: aRectangle on: aCanvas [
	"Frame the given rectangle on aCanvas"
	aCanvas frameOval: aRectangle width: self width color: self color
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle>>framePolygon: vertices on: aCanvas [
	"Frame the given rectangle on aCanvas"
	self framePolyline: vertices on: aCanvas.
	self drawLineFrom: vertices last to: vertices first on: aCanvas.
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle>>framePolyline: vertices on: aCanvas  [
	"Frame the given rectangle on aCanvas"

	| prev next |
	prev := vertices first.
	2 to: vertices size
		do: 
			[:i | 
			next := vertices at: i.
			self 
				drawLineFrom: prev
				to: next
				on: aCanvas.
			prev := next]
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle>>frameRectangle: aRectangle on: aCanvas [
	"Frame the given rectangle on aCanvas"
	aCanvas frameRectangle: aRectangle width: self width color: self color
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle>>hasFillStyle [
	"Answer false."

	^false
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle>>hash [
	"hash is implemented because #= is implemented"
	^self species hash bitXor: (self width hash bitXor: self color hash)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle>>isBorderStyle [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle>>isComplex [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle>>isComposite [
	"Answer false."

	^false
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle>>printOn: aStream [
	"Print a description of the
	receiver on the given stream."

	self storeOn: aStream
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle>>releaseCachedState [
	"Release any associated cached state"
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle>>storeOn: aStream [
	"Store a reconstructable representation of the
	receiver on the given stream."

	aStream
		nextPutAll: '(';
		nextPutAll: self class name;
		nextPutAll: ' width: ';
		print: self width;
		nextPutAll: ' color: ';
		print: self color;
		nextPutAll: ')'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle>>style [
	^#none
]

{
	#category : #'color tracking',
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle>>trackColorFrom: aMorph [
	"If necessary, update our color to reflect a change in aMorphs color"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle>>width [
	^0
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle>>width: aNumber [
	"Ignored"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BorderStyle>>widthForRounding [
	^self width
]
