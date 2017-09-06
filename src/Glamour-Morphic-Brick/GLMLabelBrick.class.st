"
A GLMLabelBrick is standard label Brick, that can shrink text if it's size becomes smaller then actual text size.

Text shrinking works out of box, you don't need to do anything

Instance Variables
	dotsBrick		<GLMStringBrick>
	isDotsAdded:		<boolean>
	stringBrick:		<GLMStringBrick>

dotsBrick
	- represents a Brick that is added at the end of the text when Brick's size becomes smaller than actual text size

isDotsAdded
	- true if dotsBrick is currently added visible, false otherwise

stringBrick
	- represents actual label text Brick

"
Class {
	#name : #GLMLabelBrick,
	#superclass : #GLMInteractableBrick,
	#instVars : [
		'dotsBrick',
		'stringBrick'
	],
	#category : #Glamour-Morphic-Brick-Widgets-Basic,
	#timestamp : 'AliakseiSyrel 3/17/2015 21:31'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick class>>exampleOpen [

	self gtExample openCenteredInBrickWindow
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick class>>exampleWithPopupOpen [
	
	self gtExampleWithPopup openCenteredInBrickWindowLabeled: 'Label example'
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick class>>gtExample [
	<gtExample>
	<label: 'Label with text'>
	
	^ self new
		text: 'Label'
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick class>>gtExampleWithPopup [
	<gtExample>
	<label: 'Label with text and popup showing when hovered with mouse'>
	
	^ self new
		enable;
		text: 'Hello';
		textPosition: #center;
		familyName: 'Bitmap DejaVu Sans';
		fontSize: 11;
		padding: 5;
		with: [ :b  | b
			when: #onMouseHover do: [ GLMPopupBrick new beHelp; openOn: b ] ]
]

{
	#category : #brick-geometry,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick>>approximateHeight [
	
	^ self label approximateHeight + self vMargin + self vPadding
]

{
	#category : #brick-geometry,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick>>approximateWidth [
	
	^ self label approximateWidth + self hMargin + self hPadding
]

{
	#category : #label-brick-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick>>contents: aStringOrText [
	"alias for text: added to support polymorphism with default morphic label widgets"
	self text: aStringOrText asString
]

{
	#category : #label-default,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick>>defaultDotsText [
	^ '...'
]

{
	#category : #label-default,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick>>defaultInsetBeforeDots [
	^ 1
]

{
	#category : #label-brick-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick>>dotsBrick [

	^ dotsBrick
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick>>familyName: aString [

	self label familyName: aString.
	self dotsBrick familyName: aString
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick>>font: aLogicalFont [

	self label font: aLogicalFont.
	self dotsBrick font: aLogicalFont.
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick>>fontSize [

	^ self label fontSize
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick>>fontSize: aNumber [
	<brickBuilderProperty: #Text name: 'Font size' as: #asInteger getter: #fontSize model: #GLMUIBuilderTextFieldProperty>

	self label fontSize: aNumber.
	self dotsBrick fontSize: aNumber
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick>>hShrinkWrap [
	super hShrinkWrap.
	
	self label hShrinkWrap.
	self dotsBrick hShrinkWrap
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick>>hSpaceFill: anInteger [
	super hSpaceFill: anInteger.
	
	self label hSpaceFill.
	self dotsBrick hShrinkWrap.
]

{
	#category : #brick-geometry,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick>>height: anObject [

	self vSpaceFill.
	super height: anObject.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick>>initialize [
	super initialize.
	
	stringBrick := self newStringBrick.
	dotsBrick := self newStringBrick.
	
	self
		hShrinkWrap;
		vShrinkWrap.
	
	stringBrick
			marginRight: self defaultInsetBeforeDots.
	self privateAddBrickBack: stringBrick.
	
	"creating dots morph, that will be displayed when text is being clipped"
	dotsBrick
		text: self defaultDotsText;
		width: #approximateWidth;
		floating: #right;
		zIndex: 2;
		marginTop: 1
]

{
	#category : #label-testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick>>isDotsAdded [

	^ self hasSubbrick: self dotsBrick
]

{
	#category : #label-brick-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick>>label [
	^ stringBrick
]

{
	#category : #label-brick-creation,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick>>newStringBrick [
	^ GLMStringBrick new
]

{
	#category : #brick-layout-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick>>onLayouted [
	super onLayouted.
	
	self label isFitsInParent
		ifTrue: [ self isDotsAdded
			ifTrue: [
				self privateRemoveBrick: self dotsBrick.
				self doLayoutForce.
				self changed ] ]
		ifFalse: [ self isDotsAdded
			ifFalse: [
				self privateAddBrickBack: self dotsBrick.
				self dotsBrick wrappedBounds height: self outerBounds height.
				self layoutPolicy layoutFloating: self dotsBrick in: self brickBounds.
				self doLayoutForce.
				self changed ] ]
	
	
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick>>text [
	^ self label text
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick>>text: aString [
	<brickBuilderProperty: #Text name: 'Text' as: #asString getter: #text model: #GLMUIBuilderTextFieldProperty>
	
	self label text: aString.
	self wrappedBounds markWidthDirty.
	self doLayout
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick>>textColor [

	^ self label textColor
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick>>textColor: aColor [
	<brickBuilderProperty: #Text name: 'Text color' as: #brickBuilderEvaluate getter: #textColor model: #GLMUIBuilderTextFieldProperty>

	self label textColor: aColor.
	self dotsBrick textColor: aColor
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick>>textPosition [

	^ self label textPosition
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick>>textPosition: aSymbol [
	<brickBuilderProperty: #Text name: 'Text position' as: #asSymbol getter: #textPosition model: #GLMUIBuilderTextFieldProperty>

	self label textPosition: aSymbol.
	self dotsBrick textPosition: aSymbol.
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick>>vShrinkWrap [
	super vShrinkWrap.
	
	self label vShrinkWrap.
	self dotsBrick vShrinkWrap
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick>>vSpaceFill: anInteger [
	super vSpaceFill: anInteger.
	
	self label vSpaceFill.
	self dotsBrick vSpaceFill.
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick>>weightValue: anInteger [

	self label weightValue: anInteger.
	self dotsBrick weightValue: anInteger.
]

{
	#category : #brick-geometry,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMLabelBrick>>width: anObject [

	self hSpaceFill.
	super width: anObject.
]
