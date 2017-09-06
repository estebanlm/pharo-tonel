"
Displays an image scaled to a fixed size along with a label describing the original dimensions.
"
Class {
	#name : #ImagePreviewMorph,
	#superclass : #Morph,
	#instVars : [
		'imageMorph',
		'textMorph',
		'defaultImageForm'
	],
	#category : #Morphic-Base-Basic,
	#timestamp : 'gvc 5/18/2007 12:51'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:13'
}
ImagePreviewMorph>>cornerStyle: aSymbol [
	"Pass on to selector and content too."

	super cornerStyle: aSymbol.
	self imageMorph cornerStyle: aSymbol
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:13'
}
ImagePreviewMorph>>defaultImageFormOfSize: aPoint [
	"Answer a default preview image form."

	^(defaultImageForm isNil or: [defaultImageForm extent ~= aPoint])
		ifTrue: [defaultImageForm := Form extent: aPoint]
		ifFalse: [defaultImageForm]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:13'
}
ImagePreviewMorph>>image: form size: imageSize [
	"Set the image and update the description."
	
	form
		ifNil: [self imageMorph
				image: (self defaultImageFormOfSize: imageSize).
			self textMorph
				contents: '']
	ifNotNil: [self imageMorph
				image: form
				size: imageSize.
			self textMorph
				contents: ('{1} x {2} pixels' translated
							format: {form width asString. form height asString})]
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ImagePreviewMorph>>imageMorph [
	"Answer the value of imageMorph"

	^ imageMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ImagePreviewMorph>>imageMorph: anObject [
	"Set the value of imageMorph"

	imageMorph := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
ImagePreviewMorph>>initialize [
	"Initialize the receiver."

	super initialize.
	self
		changeTableLayout;
		color: Color transparent;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		cellInset: 16;
		imageMorph: self newImageMorph;
		textMorph: self newTextMorph;
		addMorphBack: self imageMorph;
		addMorphBack: self textMorph
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:13'
}
ImagePreviewMorph>>newImageMorph [
	"Answer a new image morph."

	^AlphaImageMorph new
		borderStyle: (BorderStyle inset width: 1);
		color: Color white;
		alpha: 1.0
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:13'
}
ImagePreviewMorph>>newTextMorph [
	"Answer a new text morph."

	^StringMorph contents: ''
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ImagePreviewMorph>>textMorph [
	"Answer the value of textMorph"

	^ textMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ImagePreviewMorph>>textMorph: anObject [
	"Set the value of textMorph"

	textMorph := anObject
]
