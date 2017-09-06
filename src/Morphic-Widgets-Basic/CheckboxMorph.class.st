"
Checkbox with box button and label with enablement support.
"
Class {
	#name : #CheckboxMorph,
	#superclass : #MorphicModel,
	#traits : 'TEnableOnHaloMenu',
	#classTraits : 'TEnableOnHaloMenu classTrait',
	#instVars : [
		'buttonMorph',
		'labelMorph',
		'getLabelSelector',
		'setStateSelector',
		'getStateSelector',
		'enabled',
		'getEnabledSelector',
		'labelClickable'
	],
	#category : #Morphic-Widgets-Basic,
	#timestamp : 'gvc 5/18/2007 13:47'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph class>>on: anObject selected: getSelectionSel changeSelected: setSelectionSel [
	"Answer a new instance of the receiver on the given model using
	the given selectors as the interface."

	^self new
		on: anObject 
		selected: getSelectionSel
		changeSelected: setSelectionSel
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>beCheckbox [
	"Change the button to be a checkbox."
	
	self buttonMorph beCheckbox
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>beRadioButton [
	"Change the button to be a radio button."
	
	self buttonMorph beRadioButton
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>buttonMorph [
	"Answer the value of buttonMorph"

	^ buttonMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>buttonMorph: aMorph [
	"Set the value of buttonMorph"

	buttonMorph ifNotNil: [
		self removeDependent: buttonMorph.
		buttonMorph delete].
	buttonMorph := aMorph.
	self
		addDependent: aMorph;
		addMorphFront: aMorph
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>buttonMouseDown: evt [
	"Sent from the checkbox button to handle focus."

	self wantsKeyboardFocusOnMouseDown ifTrue: [
		self takeKeyboardFocus]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>disable [
	"Disable the receiver."
	
	self enabled: false
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>drawSubmorphsOn: aCanvas  [
	"Display submorphs back to front.
	Draw the focus here since we are using inset bounds
	for the focus rectangle."

	super drawSubmorphsOn: aCanvas.
	self hasKeyboardFocus ifTrue: [self drawKeyboardFocusOn: aCanvas]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>enable [
	"Enable the receiver."
	
	self enabled: true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>enabled [
	"Answer the value of enabled"

	^ enabled
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>enabled: aBoolean [
	"Set the value of enabled"

	enabled := aBoolean.
	self labelMorph ifNotNil: [:m | m enabled: aBoolean].
	self buttonMorph ifNotNil: [:m | m enabled: aBoolean].
	self changed: #enabled
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>font [
	"Answer the label font"

	^self labelMorph font
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>font: aFont [
	"Set the label font"

	self labelMorph font: aFont
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>getEnabledSelector [
	"Answer the value of getEnabledSelector"

	^ getEnabledSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>getEnabledSelector: anObject [
	"Set the value of getEnabledSelector"

	getEnabledSelector := anObject.
	self updateEnabled
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>getLabelSelector [

	^ getLabelSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>getLabelSelector: anObject [

	getLabelSelector := anObject.
	self updateLabel.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>getStateSelector [
	"Answer the value of getStateSelector"

	^ getStateSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>getStateSelector: anObject [
	"Set the value of getStateSelector"

	getStateSelector := anObject.
	self updateSelection
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>handlesKeyboard: evt [
	"Yes, we do it here."
	
	^true
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>initialize [
	"Initialize the receiver."

	super initialize.
	
	labelClickable := true.
	
	self
		borderWidth: 2; "space for focus"
		borderColor: Color transparent;
		enabled: true;
		changeTableLayout;
		listDirection: #leftToRight;
		wrapCentering: #center;
		cellInset: 4;
		labelMorph: self newLabelMorph;
		buttonMorph: self newButtonMorph;
		on: #click send: #updateButton: to: self;
		on: #mouseMove send: #updateButton: to: self;
		on: #mouseUp send: #updateButton: to: self
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>isSelected [
	"Answer whether the receiver is selected."

	self model ifNil: [^false].
	^self model perform: (self getStateSelector ifNil: [^false])
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>keyStroke: event  [
	"Process keys navigation and space to toggle."
	
	(self navigationKey: event) ifTrue: [^self].
	event keyCharacter = Character space
		ifTrue: [self toggleSelected]
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>keyboardFocusChange: aBoolean [
	"The message is sent to a morph when its keyboard focus changes.
	Update for focus feedback."
	
	super keyboardFocusChange: aBoolean.
	self focusChanged
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>label [
	"Answer the contents of the label morph."

	^(self labelMorph ifNil: [^'']) contents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>label: aStringOrMorph [
	"Set the label morph or label morph contents."

	self labelMorph: (aStringOrMorph isMorph
		ifTrue: [aStringOrMorph]
		ifFalse: [self labelMorph contents: aStringOrMorph.
				self newLabel])
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>labelClickable: aBoolean [

	labelClickable := aBoolean.
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>labelClicked [

	labelClickable ifTrue: [ self toggleSelected ].
	
	self doAnnounce: (LabelClicked source: self stateChanged: labelClickable).
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>labelMorph [
	"Answer the value of labelMorph"

	^ labelMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>labelMorph: aMorph [
	"Set the value of labelMorph"

	labelMorph ifNotNil: [labelMorph delete].
	labelMorph := aMorph.
	labelMorph color: (self theme checkboxButtonLabelNormalFillStyleFor: self label: labelMorph).
	self addMorphBack: aMorph.
	self enabled: self enabled.
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>listRenderOn: aCanvas atRow: aRow bounds: drawBounds color: drawColor backgroundColor: backgroundColor from: aMorph [

	self color: backgroundColor.
	self bounds: drawBounds.
	self fullDrawOn: aCanvas.
	aMorph addMorph: self
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>newButtonMorph [
	"Answer a new button morph"

	^(CheckboxButtonMorph new
		target: self;
		actionSelector: #toggleSelected;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap)
		on: #mouseDown send: #buttonMouseDown: to: self
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>newLabel [
	"Answer a new label morph"

	^self theme checkboxLabelFor: self
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>newLabelMorph [
	"Answer a new label morph"
	^	(LabelMorph contents: self label)
			on: #mouseDown send: #toggleSelected to: self; yourself
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>on: anObject selected: getSelectionSel changeSelected: setSelectionSel [
	"Set the receiver to the given model parameterized by the given message selectors."

	self
		model: anObject;
		getStateSelector: getSelectionSel;
		setStateSelector: setSelectionSel;
		updateSelection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>setStateSelector [
	"Answer the value of setStateSelector"

	^ setStateSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>setStateSelector: anObject [
	"Set the value of setStateSelector"

	setStateSelector := anObject
]

{
	#category : #'focus handling',
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>takesKeyboardFocus [
	"Answer whether the receiver can normally take keyboard focus."

	^true
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>toggleSelected [
	"Toggle the selection state."

	self takeKeyboardFocus.
	self enabled ifFalse: [^self].
	self model ifNil: [^self].

	(self setStateSelector ifNil: [^self]) numArgs = 0
		ifTrue: [self model perform: self setStateSelector].
	self setStateSelector numArgs = 1
		ifTrue: [	self model perform: self setStateSelector with: self isSelected not].
	self updateSelection.
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>update: aParameter  [
	"Refer to the comment in View|update:."

	aParameter == self getStateSelector ifTrue: 
		[self updateSelection.
		^ self].
	aParameter == self getEnabledSelector ifTrue:
		[self updateEnabled.
		^ self].
	aParameter == self getLabelSelector ifTrue:
		[self updateLabel.
		^ self].
	
	aParameter isArray ifFalse: [ ^ self ].
	aParameter size == 2 ifFalse: [ ^ self ].
	
	aParameter first = #labelClickable: ifTrue: [ self labelClickable: aParameter second ].
	aParameter first = #label: ifTrue: [ self label: aParameter second ]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>updateButton: evt [
	"Update the button due to mouse activity in the receiver."

	self enabled ifFalse: [^self].
	evt isMouseDown ifTrue: [
		self buttonMorph state == #on ifTrue: [^self buttonMorph state: #repressed].
		self buttonMorph state == #off ifTrue: [^self buttonMorph state: #pressed]].
	evt isMouseUp ifTrue: [
		self buttonMorph state == #repressed ifTrue: [
			^self buttonMorph state: #off; doButtonAction].
		self buttonMorph state == #pressed ifTrue: [
			^self buttonMorph state: #on; doButtonAction]].
	evt isMove ifTrue: [
		(self containsPoint: evt cursorPoint)
			ifTrue: [self buttonMorph state == #on ifTrue: [^self buttonMorph state: #repressed].
					self buttonMorph state == #off ifTrue: [^self buttonMorph state: #pressed]]
			ifFalse: [self buttonMorph state == #repressed ifTrue: [^self buttonMorph state: #on].
					self buttonMorph state == #pressed ifTrue: [^self buttonMorph state: #off]]]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>updateButtonDown: evt [
	"Check for keyboard focus."

	self wantsKeyboardFocusOnMouseDown ifTrue: [
		self takeKeyboardFocus].
	self updateButton: evt
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>updateEnabled [
	"Update the enablement state."

	self model ifNotNil: [
		self getEnabledSelector ifNotNil: [
			self enabled: (self model perform: self getEnabledSelector)]]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>updateLabel [
	"Update the label."

	self model ifNotNil: [
		self getLabelSelector ifNotNil: [
			self label: (self model perform: self getLabelSelector)]]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>updateSelection [
	"Update the selection state."

	self buttonMorph ifNotNil: [:m | m selected: self isSelected].
	self changed: #isSelected
]

{
	#category : #'focus handling',
	#timestamp : ' 8/31/2017 05:26:14'
}
CheckboxMorph>>wantsKeyboardFocusOnMouseDown [
	"Answer whether the receiver would like keyboard focus
	on a mouse down event. use a property here for apps that want to take keyboard
	focus when the button is pressed (so that other morphs can, e.g. accept on focus change)."

	^self wantsKeyboardFocus and: [self valueOfProperty: #wantsKeyboardFocusOnMouseDown ifAbsent: [false]]
]
