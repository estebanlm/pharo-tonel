"
ImageMorph is a morph that displays a picture (Form). My extent is determined by the extent of my form.

Use #image: to set my picture.

Structure:
 instance var		Type 		Description
 image				Form		The Form to use when drawing

Code examples:
	ImageMorph new openInWorld; grabFromScreen

	(Form fromFileNamed: 'myGraphicsFileName') asMorph openInWorld

Relationship to SketchMorph: ImageMorph should be favored over SketchMorph, a parallel, legacy class -- see the Swiki FAQ for details ( http://minnow.cc.gatech.edu/squeak/1372 ). 

"
Class {
	#name : #ImageMorph,
	#superclass : #Morph,
	#traits : 'TAbleToRotate',
	#classTraits : 'TAbleToRotate classTrait',
	#instVars : [
		'image'
	],
	#classVars : [
		'DefaultForm'
	],
	#category : #Morphic-Base-Basic,
	#timestamp : 'efc 3/7/2003 17:48'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph class>>defaultForm [
	^DefaultForm
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph class>>fromStream: aStream [

	^self withForm: (ImageReadWriter formFromStream: aStream)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph class>>fromString: aString  [
	"Create a new ImageMorph which displays the input string in the standard button font"

	^ self fromString: aString font: StandardFonts buttonFont
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph class>>fromString: aString font: aFont [
	"Create a new ImageMorph showing the given string in the given font"

	^ self new form: (StringMorph contents: aString font: aFont) imageForm
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph class>>initialize [
	"ImageMorph initialize"

	| h p d |
	DefaultForm := (Form extent: 80@40 depth: 16).
	h := DefaultForm height // 2.
	0 to: h - 1 do: [:i |
		p := (i * 2)@i.
		d := i asFloat / h asFloat.
		DefaultForm fill:
			(p corner: DefaultForm extent - p)
			fillColor: (Color r: d g: 0.5 b: 1.0 - d)].

]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph class>>withForm: aForm [

	^ self new form: aForm ; yourself
]

{
	#category : #menus,
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph>>addCustomMenuItems: aMenu hand: aHand [
	super addCustomMenuItems: aMenu hand: aHand.
	aMenu addUpdating: #opacityString selector: #changeOpacity
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph>>adoptPaneColor: paneColor [
	"Change our border color too."
	
	super adoptPaneColor: paneColor.
	paneColor ifNil: [^self].
	self borderStyle baseColor: paneColor twiceDarker
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph>>areasRemainingToFill: aRectangle [

	^self isOpaque
		ifTrue: [aRectangle areasOutside: self bounds]
		ifFalse: [Array with: aRectangle]
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph>>basicExtent: aPoint [

	"For sublcasses which need to use Morph>>#extent:"
	
	^super extent: aPoint
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph>>borderStyle: newStyle [
	"Set the extent to include border width."
	
	| newExtent |
	self borderStyle = newStyle ifTrue: [^self].
	newExtent := 2 * newStyle width + image extent.
	bounds extent = newExtent ifFalse: [super extent: newExtent].
	super borderStyle: newStyle
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph>>borderWidth: bw [

	| newExtent |
	newExtent := 2 * bw + image extent.
	bounds extent = newExtent ifFalse: [super extent: newExtent].
	super borderWidth: bw
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph>>changeOpacity [
	self isOpaque: self isOpaque not
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph>>color: aColor [
	"Set the color.
	Change to a ColorForm here if depth 1."
	
	super color: aColor.
    (image depth = 1 and: [aColor isColor]) ifTrue: [
		image isColorForm ifFalse: [
			image := ColorForm mappingWhiteToTransparentFrom: image].
			image colors: {Color transparent. aColor}.
			self changed]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph>>defaultImage [
	"Answer the default image for the receiver."

	^ DefaultForm
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph>>drawOn: aCanvas [
	"Draw the border after the image."
	
	| style |
	self isOpaque
		ifTrue: [aCanvas drawImage: image at: self innerBounds origin]
		ifFalse: [aCanvas translucentImage: image at: self innerBounds origin].
	(style := self borderStyle) ifNotNil: [style frameRectangle: bounds on: aCanvas]
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph>>extent: aPoint [
	"Do nothing; 
		My extent is determined by my image Form. 
		For subclasses which need to set the extent, use #basicExtent:"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph>>form [
	^ image

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph>>form: aForm [
	image := aForm. 
	super extent: (2 * self borderWidth) asPoint + image extent.
	self changed
]

{
	#category : #'menu commands',
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph>>grabFromScreen [

	self form: Form fromUser.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph>>image: anImage  [
	
	image := anImage. 
	super extent: (2 * self borderWidth) asPoint + image extent.
	self changed
]

{
	#category : #other,
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph>>imageExport [
	
	^ self form bits asArray
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph>>initialize [

	super initialize.
	self form: self defaultImage.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph>>isOpaque [
	"Return true if the receiver is marked as being completely opaque"
	
	^ self
		valueOfProperty: #isOpaque
		ifAbsent: [false]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph>>isOpaque: aBool [
	"Mark the receiver as being completely opaque or not"
	
	aBool == false
		ifTrue: [self removeProperty: #isOpaque]
		ifFalse: [self setProperty: #isOpaque toValue: aBool].
	self changed
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph>>opacityString [
	^ (self isOpaque) -> 'opaque' translated
]

{
	#category : #'menu commands',
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph>>readFromFile [
	| fileName |
	fileName := UIManager default
		request: 'Please enter the image file name' translated
		initialAnswer: 'fileName'.
	fileName isEmptyOrNil ifTrue: [^ self].
	self form: (Form fromFileNamed: fileName).

]

{
	#category : #caching,
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph>>releaseCachedState [

	super releaseCachedState.
	image hibernate.

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph>>shouldFlex [
	^ true.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph>>wantsRecolorHandle [
	^ image notNil and: [image depth = 1]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ImageMorph>>withSnapshotBorder [
	self 
		borderStyle:
			((ComplexBorder style: #complexFramed)
				color: (Color r: 0.613 g: 1.0 b: 0.516);
				width: 1;
				yourself)
]
