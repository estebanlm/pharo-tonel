"

"
Class {
	#name : #GLMAlertBrick,
	#superclass : #GLMBandBrick,
	#instVars : [
		'textBrick',
		'okButton'
	],
	#category : #Glamour-Morphic-Brick-Widgets-UI,
	#timestamp : ''
}

{
	#category : #open,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAlertBrick class>>alert: anObject [

	self new alert: anObject
	
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAlertBrick class>>exampleOpen [

	'Hello world!' brickAlert
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAlertBrick class>>gtExample [
	<gtExample>
	<label: 'Simple alert window displaying a message'>
	
	^ self new alertOn: 'Hello world!'
	
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAlertBrick>>alert: anObject [
	|window|
	self alertOn: anObject.
	window := (self openInBrickWindowLabeled: 'Alert').
	self class environment at: #GLMSystemWindowBrick ifPresent: [ 
		window
			noMenu;
			innerExtent: self extent ].

]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAlertBrick>>alertOn: anObject [

	self textBrick
		text: anObject asString
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAlertBrick>>initialize [
	super initialize.
	
	self
		width:  300;
		textBrick: self newTextBrick;
		okButton: self newButtonBrick
	
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAlertBrick>>newButtonBrick [

	^ GLMButtonBrick new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAlertBrick>>newTextBrick [

	^ GLMRubEditingAreaBrick new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAlertBrick>>okButton [
	^ okButton
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAlertBrick>>okButton: anObject [
	okButton := anObject.
	
	self okButton
		marginBottom: 3;
		text: 'OK';
		hAlign: #center;
		when: #onClicked do: [ self window ifNotNil: [ :w | w close ] ].
	
	self addBrickBack: self okButton
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAlertBrick>>textBrick [

	^ textBrick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMAlertBrick>>textBrick: aBrick [

	textBrick := aBrick.
	
	self textBrick
		margin: #(0 3 3 3);
		vShrinkWrap.
	
	self addBrickBack: self textBrick
]
