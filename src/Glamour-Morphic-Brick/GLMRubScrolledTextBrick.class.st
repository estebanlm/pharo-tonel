"
A GLMRubScrolledTextBrick is a wrapper for rubric scrolled text morph, to allow simple integration of rubric text field in brick

Instance Variables
	rubricMorph:		<Object>

rubricMorph
	- xxxxx

"
Class {
	#name : #GLMRubScrolledTextBrick,
	#superclass : #GLMMorphBrick,
	#category : #Glamour-Morphic-Brick-Widgets-Core,
	#timestamp : 'AliakseiSyrel 1/30/2015 11:35'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick class>>exampleBandOpen [

	self gtExampleBand openInBrickWindow
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick class>>exampleOpen [

	self gtExample openInBrickWindow
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick class>>gtExample [
	<gtExample>
	<label: 'Two rubric text areas filling half of size'>
	
	^ GLMBrick new
		useVerticalLinearLayout;
		padding: #(20 20);
		hSpaceFill;
		vSpaceFill;
		color: Color veryVeryLightGray;
		addAllBricks: { self new vSpaceFill: 50. self new vSpaceFill: 50 };
		yourself
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick class>>gtExampleBand [
	<gtExample>
	<label: 'Two rubric text areas in band'>
	
	^ GLMBandBrick new
		padding: #(20 20);
		hSpaceFill;
		color: Color veryVeryLightGray;
		addAllBricks: { self new vShrinkWrap. self new vShrinkWrap};
		yourself
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick>>beTransparent [

	self rubricBackgroundColor: Color transparent
]

{
	#category : #'reflective operations',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick>>doesNotUnderstand: aMessage [
	^ self rubric
		perform: aMessage selector 
		withArguments: aMessage arguments
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick>>initialize [
	super initialize.
	
	self rubric: self newRubricMorph.
	self withoutBackground.
	self
		hSpaceFill;
		vSpaceFill
]

{
	#category : #rubric-brick-creation,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick>>newRubricMorph [

	^ RubScrolledTextMorph new
]

{
	#category : #brick-properties-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick>>onThemerChanged [

	self updateStyle
]

{
	#category : #rubric-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick>>rubric [

	^ self morph
]

{
	#category : #rubric-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick>>rubric: aMorph [

	self morph ifNotNil: [ self removeMorph: self morph ].
	self on: aMorph
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick>>rubricBackgroundColor [

	^ self valueOfProperty: #brickRubricBackgroundColor ifAbsent: [ self themer rubricBackgroundColor ]
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick>>rubricBackgroundColor: aColor [

	self setProperty: #brickRubricBackgroundColor toValue: aColor.
	self updateStyle
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick>>rubricBorderColor [

	^ self valueOfProperty: #brickRubricBorderColor ifAbsent: [ self themer rubricBorderColor ]
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick>>rubricBorderColor: aColor [

	self setProperty: #brickRubricBorderColor toValue: aColor.
	self updateStyle
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick>>rubricBorderWidth [

	^ self valueOfProperty: #brickRubricBorderWidth ifAbsent: [ self themer rubricBorderWidth ]
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick>>rubricBorderWidth: aColor [

	self setProperty: #brickRubricBorderWidth toValue: aColor.
	self updateStyle
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick>>rubricCursorColor [

	^ self valueOfProperty: #brickRubricCursorColor ifAbsent: [ self themer rubricCursorColor ]
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick>>rubricCursorColor: aColor [

	self setProperty: #brickRubricCursorColor toValue: aColor.
	self updateStyle
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick>>rubricTextColor [

	^ self valueOfProperty: #brickRubricTextColor ifAbsent: [ self themer rubricTextColor ]
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick>>rubricTextColor: aColor [

	self setProperty: #brickRubricTextColor toValue: aColor.
	self updateStyle
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick>>rubricTextFamilyName [

	^ self valueOfProperty: #brickRubricTextFamilyName ifAbsent: [ self themer rubricTextFamilyName ]
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick>>rubricTextFamilyName: aString [

	self setProperty: #brickRubricTextFamilyName toValue: aString.
	self updateStyle
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick>>rubricTextFontSize [

	^ self valueOfProperty: #brickRubricTextFontSize ifAbsent: [ self themer rubricTextFontSize ]
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick>>rubricTextFontSize: aFloat [

	self setProperty: #brickRubricTextFontSize toValue: aFloat.
	self updateStyle
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick>>takeKeyboardFocus [
	self rubric takeKeyboardFocus
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick>>text: aText [

	self rubric updateTextWith: aText
]

{
	#category : #rubric-updating,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick>>updateStyle [

	self color: self rubricBackgroundColor.
	self rubric borderColor: self rubricBorderColor.
	self rubric borderWidth: self rubricBorderWidth.
	self rubric textColor: self rubricTextColor.
	self rubric font: (LogicalFont familyName: self rubricTextFamilyName pointSize: self rubricTextFontSize).
	self rubric cursor visibleCursorColor: self rubricCursorColor
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick>>withoutBackground [

	self rubric color: Color transparent.
	self rubric textArea color: Color transparent
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick>>withoutBorder [

	self rubricBorderWidth: 0.
	self rubricBorderColor: Color transparent.
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubScrolledTextBrick>>withoutMargins [

	self margins: (0@0 corner: 0@0)
]
