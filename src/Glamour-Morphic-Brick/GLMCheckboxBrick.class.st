"
A GLMCheckboxBrick is very simple checkbox with label support. If label text is set it becomes clickable too.

Instance Variables
	checkBrick:		<GLMInteractableBrick>
	labelBrick:		<GLMLabelBrick>

checkBrick
	- checkbox itself

labelBrick
	- label position to the right from checkbox

"
Class {
	#name : #GLMCheckboxBrick,
	#superclass : #GLMInteractableBrick,
	#instVars : [
		'labelBrick',
		'checkBrick',
		'id'
	],
	#category : #Glamour-Morphic-Brick-Widgets-Basic,
	#timestamp : 'AliakseiSyrel 3/18/2015 17:11'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCheckboxBrick class>>exampleOpen [

	self gtExample openCenteredInBrickWindow
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCheckboxBrick class>>exampleWithLabelOpen [

	self gtExampleWithLabel openCenteredInBrickWindow
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCheckboxBrick class>>gtExample [
	<gtExample>
	<label: 'Checkbox without label'>
	
	^ self new
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCheckboxBrick class>>gtExampleWithLabel [
	<gtExample>
	<label: 'Checkbox with label'>
	
	^ self new
		text: 'I''m label, click me';
		action: [ :boolean | self inform: 'Checkbox set to ', boolean asString ];
		yourself
]

{
	#category : #checkbox-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCheckboxBrick>>action: aBlockClosure  [
	"aBlockClosure can receive as the first argument aBoolean, as the second argument this object."
	self 
		when: #onChecked 
			do: [ :anAnnouncement :anAnnouncer | 
					aBlockClosure cull: true cull: self cull: anAnnouncement cull: anAnnouncer ];
		when: #onUnchecked
			do: [ :anAnnouncement :anAnnouncer | 
					aBlockClosure cull: false cull: self cull: anAnnouncement cull: anAnnouncer ]
]

{
	#category : #brick-structure-converting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCheckboxBrick>>asFormValue [

	^ self id -> self isChecked
]

{
	#category : #checkbox-brick-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCheckboxBrick>>box [

	^ checkBrick
]

{
	#category : #brick-interactable-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCheckboxBrick>>check [
	self box check.
	self label check.
	super check
]

{
	#category : #checkbox-brick-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCheckboxBrick>>checkBrick: anObject [
	checkBrick := anObject.
	self box
		borderColor: self themer checkboxBorderColor;
		borderWidth: self themer checkboxBorderWidth;
		vAlign: #center;
		checkedImage: self themer checkboxCheckedImage;
		width: self themer checkboxWidth;
		height: self themer checkboxHeight.
		
	self addBrickFirst: self box
]

{
	#category : #brick-interactable-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCheckboxBrick>>click: evt [

	self toggle.
	^ true
]

{
	#category : #brick-interactable-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCheckboxBrick>>deselect: anEvent [
	super deselect: anEvent.
	self box deselect: anEvent.
	self label deselect: anEvent
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCheckboxBrick>>hShrinkWrap [
	super hShrinkWrap.
	
	self label hShrinkWrap
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCheckboxBrick>>hSpaceFill: anInteger [
	super hSpaceFill: anInteger.
	
	self label hSpaceFill
]

{
	#category : #checkbox-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCheckboxBrick>>id [

	^ id ifNil: [ self ]
]

{
	#category : #checkbox-scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCheckboxBrick>>id: anObejct [

	id := anObejct
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCheckboxBrick>>initialize [
	super initialize.
	
	self
		checkBrick: self newCheckboxBrick;
		labelBrick: self newLabelBrick;
		useHorizontalLinearLayout;
		vShrinkWrap;
		hShrinkWrap;
		enable
]

{
	#category : #checkbox-brick-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCheckboxBrick>>label [

	^ labelBrick
]

{
	#category : #checkbox-brick-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCheckboxBrick>>labelBrick: anObject [
	labelBrick := anObject.
	
	labelBrick
		vAlign: #center;
		marginLeft: 5;
		textPosition: #leftCenter.
]

{
	#category : #checkbox-brick-creation,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCheckboxBrick>>newCheckboxBrick [

	^ GLMInteractableBrick new
]

{
	#category : #checkbox-brick-creation,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCheckboxBrick>>newLabelBrick [

	^ GLMLabelBrick new
]

{
	#category : #brick-interactable-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCheckboxBrick>>select: anEvent [
	super select: anEvent.
	self box select: anEvent.
	self label select: anEvent
]

{
	#category : #checkbox-scripting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCheckboxBrick>>text: aString [

	self label text: aString.
	self label text isEmpty
			ifTrue: [ self removeBrick: self label ]
			ifFalse: [ (self hasSubbrick: self label)
				ifFalse: [ self addBrickBack: self label ] ].
	self doLayoutForce
]

{
	#category : #checkbox-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCheckboxBrick>>toggle [

	self isChecked
		ifTrue: [ self uncheck ]
		ifFalse: [ self check ]
]

{
	#category : #brick-interactable-actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCheckboxBrick>>uncheck [
	self box uncheck.
	self label uncheck.
	super uncheck
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCheckboxBrick>>vShrinkWrap [
	super vShrinkWrap.
	
	self label vShrinkWrap
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCheckboxBrick>>vSpaceFill: anInteger [
	super vSpaceFill: anInteger.
	
	self label vSpaceFill.
]
