"
A Cursor which additionally has a 16x16 transparency bitmap called a ""mask"".  See the comment of beCursorWithMask: for details on how the mask is treated.
"
Class {
	#name : #CursorWithMask,
	#superclass : #Cursor,
	#instVars : [
		'maskForm'
	],
	#category : #'Graphics-Display Objects',
	#timestamp : '<historical>'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:09'
}
CursorWithMask class>>derivedFrom: aForm      "Cursor initNormalWithMask.  Cursor normal show" [
	"aForm is presumably a cursor"
	| cursor mask ext |
	ext := aForm extent.
	cursor := self extent: ext.
	cursor copy: (1@1 extent: ext) from: 0@0 in: aForm rule: Form over.
	mask := Form extent: ext.
	(1@1) eightNeighbors do:
		[:p | mask copy: (p extent: ext) from: 0@0 in: aForm rule: Form under].
	cursor setMaskForm: mask.
	cursor offset: ((aForm offset - (1@1)) max: ext negated).
	^ cursor
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:09'
}
CursorWithMask>>asCursorForm [
	| form |
	form := Form extent: self extent depth: 8.
	form fillShape: maskForm fillColor: Color white.
	form fillShape: self fillColor: Color black at: offset negated.
	^ form offset: offset
]

{
	#category : #primitives,
	#timestamp : ' 8/31/2017 05:26:09'
}
CursorWithMask>>beCursor [
	maskForm unhibernate.
	^ self beCursorWithMask: maskForm
]

{
	#category : #mask,
	#timestamp : ' 8/31/2017 05:26:09'
}
CursorWithMask>>hasMask [
	^true
]

{
	#category : #mask,
	#timestamp : ' 8/31/2017 05:26:09'
}
CursorWithMask>>maskForm [
	^ maskForm
]

{
	#category : #mask,
	#timestamp : ' 8/31/2017 05:26:09'
}
CursorWithMask>>setMaskForm: aForm [
	maskForm := aForm
]

{
	#category : #mask,
	#timestamp : ' 8/31/2017 05:26:09'
}
CursorWithMask>>storeOn: aStream base: anInteger [

	aStream nextPut: $(.
	super storeOn: aStream base: anInteger.
	aStream nextPutAll: ' setMaskForm: '.
	maskForm storeOn: aStream base: anInteger.
	aStream nextPut: $)
]

{
	#category : #mask,
	#timestamp : ' 8/31/2017 05:26:09'
}
CursorWithMask>>withMask [
	^self
]
