"
A GLMEditableLabelBrick is improved label that can be edited in-place double-clicking on it or using edit icon

Instance Variables
	editBrick:		<Object>
	labelBrick:		<Object>

editBrick
	- xxxxx

labelBrick
	- xxxxx

"
Class {
	#name : #GLMEditableLabelBrick,
	#superclass : #GLMInteractableBrick,
	#instVars : [
		'labelBrick',
		'editBrick',
		'borderAnimation',
		'cancelOnEscape',
		'cancelOnFocusLost'
	],
	#category : #Glamour-Morphic-Brick-Widgets-UI,
	#timestamp : 'AliakseiSyrel 3/19/2015 15:22'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick class>>exampleOpen [

	self gtExample openCenteredInBrickWindow
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick class>>gtExample [
	<gtExample>
	<label: 'Editable label simple example'>
	
	^ self new
		text: 'Click me to edit. Press enter to accept';
		yourself
]

{
	#category : #label-brick-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>accept [

	self text: self editBrick text.
	self borderColor: self themer color emerald.
	self beNormal
]

{
	#category : #label-animation,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>animateToEditFocused [

	self borderAnimation
		from: self borderColor first;
		to: self themer focusedBorderColor;
		animate: self
]

{
	#category : #label-animation,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>animateToEditNotFocused [

	self borderAnimation
		from: self borderColor first;
		to: self themer normalBorderColor;
		animate: self
]

{
	#category : #label-animation,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>animateToNormal [

	self borderAnimation
		from: self borderColor first;
		to: (self borderColor first alpha: 0);
		animate: self
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>approximateHeight [
	
	^ self labelBrick approximateHeight + self vMargin + self vPadding
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>approximateWidth [
	
	^ self hMargin + self hPadding + (self isReadMode
		ifTrue: [ self labelBrick approximateWidth ]
		ifFalse: [ self editBrick width + self editBrick hPadding + self editBrick hMargin])
]

{
	#category : #label-brick-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>beEdit [

	self isEditMode ifTrue: [ ^ self ].
	self editBrick updateTextWith: self labelBrick text.
	self editBrick moveCursorToIndex: self labelBrick text size + 1.

	self addBrickFirst: self editBrick.
	self removeBrick: self labelBrick.
	self borderColor: (self themer focusedBorderColor alpha: 0).
	self editBrick rubric takeKeyboardFocus.
	self announce: #onEditMode
]

{
	#category : #label-brick-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>beNormal [
	
	self isReadMode ifTrue: [ ^ self ].
	self animateToNormal.
	self removeBrick: self editBrick.
	self activeHand releaseKeyboardFocus.
	self addBrickBack: self labelBrick.
	self announce: #onReadMode
]

{
	#category : #label-brick-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>borderAnimation [

	^ borderAnimation ifNil: [ borderAnimation := GLMAnimation borderColor duration: 200 ]
]

{
	#category : #label-brick-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>cancel [

	self borderColor: self themer color alizarin.
	self beNormal
]

{
	#category : #label-brick-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>cancelOnEscape [

	cancelOnEscape := true
]

{
	#category : #label-brick-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>cancelOnFocusLost [

	cancelOnFocusLost := true
]

{
	#category : #'reflective operations',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>doesNotUnderstand: aMessage [
	^ self labelBrick
		perform: aMessage selector
		withArguments: aMessage arguments
]

{
	#category : #label-brick-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>editBrick [

	^ editBrick
]

{
	#category : #label-brick-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>editBrick: aBrick [

	editBrick := aBrick.
	
	self editBrick
		hShrinkWrap;
		vShrinkWrap;
		withoutMargins;
		withoutAdornment;
		withoutBorder;
		beTransparent;
		autoAccept: true;
		rubricTextFamilyName: self themer textFamilyName;
		rubricTextFontSize: self themer textFontSize.
	
	self editBrick rubric forceHeight: [ self labelBrick height ].
	
	self editBrick rubric announcer when: RubReturnEntered  send: #onTextAccepted: to: self.
	self editBrick rubric announcer when: MorphLostFocus send: #onLostFocus to: self.
	self editBrick rubric announcer when: MorphGotFocus send: #onGotFocus: to: self.
	self editBrick rubric announcer when: RubTextAcceptRequest send: #onTextChanged: to: self
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>hShrinkWrap [
	super hShrinkWrap.
	
	self labelBrick hShrinkWrap.
	self editBrick hShrinkWrap
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>hSpaceFill: anInteger [
	super hSpaceFill: anInteger.
	
	self labelBrick hSpaceFill.
	self editBrick hSpaceFill
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>initialize [
	super initialize.
	
	self labelBrick: self newLabelBrick.
	self editBrick: self newEditBrick.
	
	self
		padding: self themer focusedBorderWidth;
		borderWidth: self themer focusedBorderWidth;
		hShrinkWrap;
		vShrinkWrap;
		enable;
		enableDoubleClick;
		when: #onDoubleClicked do: [ (self hasSubbrick: self editBrick) ifFalse: [ self beEdit ] ];
		bindKeyCombination: Character escape toAction: [ self onEscapePressed ]
]

{
	#category : #label-brick-testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>isCancelOnEscape [

	^ cancelOnEscape ifNil: [ cancelOnEscape := false ]
]

{
	#category : #label-brick-testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>isCancelOnFocusLost [

	^ cancelOnFocusLost ifNil: [ cancelOnFocusLost := false ]
]

{
	#category : #label-brick-testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>isEditMode [

	^ self hasSubbrick: self editBrick
]

{
	#category : #label-brick-testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>isReadMode [

	^ self isEditMode not
]

{
	#category : #label-brick-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>labelBrick [

	^ labelBrick
]

{
	#category : #label-brick-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>labelBrick: aBrick [

	labelBrick := aBrick.
	
	self labelBrick
		textPosition: #leftCenter.
	
	self addBrickBack: labelBrick
	
]

{
	#category : #label-brick-creation,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>newEditBrick [

	^ GLMRubTextFieldBrick new
]

{
	#category : #label-brick-creation,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>newLabelBrick [

	^ GLMLabelBrick new
]

{
	#category : #label-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>onEscapePressed [

	self isCancelOnEscape ifTrue: [ self cancel ]
]

{
	#category : #label-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>onGotFocus: ann [

	self animateToEditFocused
]

{
	#category : #label-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>onLostFocus [
	
	self isCancelOnFocusLost & self isEditMode
		ifTrue: [ self cancel ].
	
	self isEditMode
		ifTrue: [ self animateToEditNotFocused ]
		ifFalse: [ self animateToNormal ]
]

{
	#category : #label-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>onTextAccepted: ann [
	|isChanged|
	
	isChanged := (self text asString = ann morph text asString) not.
	ann morph text isEmpty
		ifFalse: [ self accept ]
		ifTrue: [ self cancel ].
	isChanged ifTrue: [ self announce: #onAccepted ]
]

{
	#category : #label-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>onTextChanged: ann [

	self onTextAccepted: ann
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>vShrinkWrap [
	super vShrinkWrap.
	
	self labelBrick vShrinkWrap.
	self editBrick vShrinkWrap
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditableLabelBrick>>vSpaceFill: anInteger [
	super vSpaceFill: anInteger.
	
	self labelBrick vSpaceFill.
	self editBrick vSpaceFill.
]
