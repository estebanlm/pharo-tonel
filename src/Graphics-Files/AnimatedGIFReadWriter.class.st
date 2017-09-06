"
Read an animated GIF file.

Example: open all images of an animated GIF file in a Morphic window

gifPath :=  '/path/to/my_animated.gif'.
forms := (AnimatedGIFReadWriter formsFromFileNamed: gifPath) forms.
content := UITheme builder newRow: (forms collect: [:aForm| UITheme builder newImage: aForm]).
content openInWindowLabeled: 'Content of ', gifPath.
"
Class {
	#name : #AnimatedGIFReadWriter,
	#superclass : #GIFReadWriter,
	#instVars : [
		'forms',
		'delays',
		'comments'
	],
	#category : #Graphics-Files,
	#timestamp : 'LaurentLaffont 5/4/2011 21:27'
}

{
	#category : #'image reading/writing',
	#timestamp : ' 8/31/2017 05:26:13'
}
AnimatedGIFReadWriter class>>formsFromFileNamed: fileName  [
	| stream |
	stream := FileStream readOnlyFileNamed: fileName.
	^ self formsFromStream: stream
]

{
	#category : #'image reading/writing',
	#timestamp : ' 8/31/2017 05:26:13'
}
AnimatedGIFReadWriter class>>formsFromStream: stream  [
	| reader |
	reader := self new on: stream reset.
	Cursor read showWhile: 
		[ reader allImages.
		reader close ].
	^ reader
]

{
	#category : #'image reading/writing',
	#timestamp : ' 8/31/2017 05:26:13'
}
AnimatedGIFReadWriter class>>typicalFileExtensions [
	"Answer a collection of file extensions (lowercase) which files that I can read might commonly have"
	^#('gif')
]

{
	#category : #'image reading/writing',
	#timestamp : ' 8/31/2017 05:26:13'
}
AnimatedGIFReadWriter class>>wantsToHandleGIFs [
	^true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
AnimatedGIFReadWriter>>allImages [
	| body colorTable |
	stream class == ReadWriteStream ifFalse: 
		[ stream binary.
		self on: (ReadWriteStream with: stream contentsOfEntireFile) ].
	localColorTable := nil.
	forms := OrderedCollection new.
	delays := OrderedCollection new.
	comments := OrderedCollection new.
	self readHeader.
	[ (body := self readBody) isNil ] whileFalse: 
		[ colorTable := localColorTable ifNil: [ colorPalette ].
		transparentIndex ifNotNil: 
			[ transparentIndex + 1 > colorTable size ifTrue: 
				[ colorTable := colorTable 
					forceTo: transparentIndex + 1
					paddingWith: Color white ].
			colorTable 
				at: transparentIndex + 1
				put: Color transparent ].
		body colors: colorTable.
		forms add: body.
		delays add: delay ].
	^ forms
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
AnimatedGIFReadWriter>>comment: aString [
	comments add: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
AnimatedGIFReadWriter>>delays [
	^ delays
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
AnimatedGIFReadWriter>>forms [
	^ forms
]

{
	#category : #private-decoding,
	#timestamp : ' 8/31/2017 05:26:13'
}
AnimatedGIFReadWriter>>readBitData [
	| form |
	form := super readBitData.
	form offset: offset.
	^form
]
