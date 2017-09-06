"
A GLMFormBrick is scriptable html-like form with possibility to submit it.

"
Class {
	#name : #GLMFormBrick,
	#superclass : #GLMBandBrick,
	#category : #Glamour-Morphic-Brick-Widgets-Basic,
	#timestamp : 'AliakseiSyrel 2/26/2015 23:27'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFormBrick class>>exampleOpen [

	self gtExample
		when: GLMFormSubmitted do: [ :ann | ann result brickAlert ];
		openCenteredInBrickWindow
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFormBrick class>>gtExample [
	<gtExample>
	<label: 'Input form with title, two labels, four checkboxes, text and submit button'>
	
	^ self new
		title: [ :t | t
			text: 'Grüezi' ];
		text: [ :t | t
			text: 'Welcome to the Restaurant Zukunft zu Pharo in Berne'];
		label: [ :l | l
			text: 'What would you like to eat?' ];
		checkbox: [ :c | c
			id: #fondue;
			check;
			text: 'Cheese Fondue, CHF 20.-' ];
		checkbox: [ :c | c
			id: #raclette;
			text: 'Raclette, CHF 15.-' ];
		
		label: [ :l | l 
			text: 'What would you like to drink?' ];
		checkbox: [ :c | c
			id: #schorle;
			text: 'Apfel Schorle, CHF 4.-' ];
		checkbox: [ :c | c
			id: #rivella;
			check;
			text: 'Rivella, CHF 4.-' ];
		submit;
		yourself
]

{
	#category : #brick-structure-converting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFormBrick>>asFormValue [
	|result|
	result := OrderedCollection new.
	self subbricks do: [ :each |
		each asFormValue ifNotNil: [ :v | result addAll: v asOrderedCollection ] ].
	^ result
]

{
	#category : #form-scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFormBrick>>checkbox [

	^ self addBrickBack: self newCheckbox
]

{
	#category : #form-scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFormBrick>>checkbox: aBlock [

	aBlock cull: self checkbox
	
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFormBrick>>initialize [
	super initialize.
	
	self
		hShrinkWrap;
		color: Color veryVeryLightGray muchLighter;
		borderWidth: 1;
		borderColor: Color veryVeryLightGray;
		padding: #(4 7)
]

{
	#category : #form-scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFormBrick>>label [

	^ self addBrickBack: self newLabel
]

{
	#category : #form-scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFormBrick>>label: aBlock [

	aBlock cull: self label
	
]

{
	#category : #form-brick-creation,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFormBrick>>newButton [

	^ GLMButtonBrick new margin: #(3 0)
]

{
	#category : #form-brick-creation,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFormBrick>>newCheckbox [

	^ GLMCheckboxBrick new margin: #(3 0)
]

{
	#category : #form-brick-creation,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFormBrick>>newLabel [

	^ GLMLabelBrick new margin: #(3 0)
]

{
	#category : #form-brick-creation,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFormBrick>>newText [

	^ GLMRubTextAreaBrick new
		width: 200;
		margin: #(3 0);
		vShrinkWrap;
		rubricTextFamilyName: StandardFonts defaultFont familyName
]

{
	#category : #form-scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFormBrick>>submit [

	^ self addBrickBack: (
		self newButton
			text: 'Submit';
			when: #onClicked do: [ self submitForm ])
]

{
	#category : #form-scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFormBrick>>submit: aBlock [

	aBlock cull: self submit
]

{
	#category : #form-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFormBrick>>submitForm [

	self announce: (GLMFormSubmitted new result: self asFormValue)
]

{
	#category : #form-scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFormBrick>>text [

	^ self addBrickBack: self newText
]

{
	#category : #form-scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFormBrick>>text: aBlock [

	aBlock cull: self text
]

{
	#category : #form-scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFormBrick>>title [

	^ self addBrickBack: (self newLabel hAlign: #center)
]

{
	#category : #form-scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFormBrick>>title: aBlock [

	aBlock cull: self title
]
