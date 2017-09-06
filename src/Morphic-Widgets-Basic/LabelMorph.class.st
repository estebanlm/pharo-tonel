"
String morph with enablement support. When disabled the text will appear inset.
"
Class {
	#name : #LabelMorph,
	#superclass : #StringMorph,
	#instVars : [
		'getEnabledSelector',
		'getTextSelector',
		'enabled',
		'model',
		'disabledStyle'
	],
	#category : #Morphic-Widgets-Basic,
	#timestamp : 'gvc 5/18/2007 12:48'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph class>>example [
	"self example"

	<exampleWidget>
	^ (self newLabel: 'A Label') openInWindow
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph class>>exampleDisable [
	"self exampleDisable"

	<exampleWidget>
	^ (self newLabel: 'A Label')
		disable;
		openInWindow
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph class>>exampleDisableInset [
	"self exampleDisable"

	<exampleWidget>
	^ (self newLabel: 'A Label')
		disable;
		disabledStyle: #inset;
		changeFont;
		openInWindow
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph class>>labelFont [
	"in the future should access an instance variable"
		
	^StandardFonts defaultFont
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph class>>newLabel: aString [
	"Answer a new text label morph."

	^self
		newLabelFor: nil
		label: aString
		getEnabled: nil
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph class>>newLabelFor: aModel label: aString getEnabled: enabledSel [
	"Answer a new text label whose model is aModel"

	^ ( self contents: aString font: self labelFont )
		model: aModel;
		getEnabledSelector: enabledSel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph>>adoptPaneColor: aColor [

]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph>>disable [
	"Disable the receiver."
	
	self enabled: false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph>>disabledStyle [
	"Answer the value of disabledStyle"

	^ disabledStyle
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph>>disabledStyle: anObject [
	"Set the value of disabledStyle"

	disabledStyle := anObject.
	self changed
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph>>drawOn: aCanvas [
	"Draw based on enablement."

	super drawOn: aCanvas.

	(self enabled not and: [ self disabledStyle = #inset ])	ifTrue: [
		aCanvas
			drawString: self contents
			in: (self stringBounds translateBy: 1)
			font: self fontToUse
			color: self theme lightBackgroundColor.
	].




		

]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph>>enable [
	"Enable the receiver."
	
	self enabled: true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph>>enabled [
	"Answer the value of enabled"

	^enabled
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph>>enabled: aBoolean [
	"Set the value of enabled"

	enabled == aBoolean ifFalse: [
		enabled := aBoolean.
		self
			changed: #enabled;
			changed]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph>>getEnabledSelector [
	"Answer the value of getEnabledSelector"

	^ getEnabledSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph>>getEnabledSelector: anObject [
	"Set the value of getEnabledSelector"

	getEnabledSelector := anObject.
	self updateEnabled
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph>>getTextSelector [

	^ getTextSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph>>getTextSelector: aSymbol [

	getTextSelector := aSymbol.
	self updateText
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph>>initWithContents: aString font: aFont emphasis: emphasisCode [
	"Grrr, why do they do basicNew?"
	
	super initWithContents: aString font: aFont emphasis: emphasisCode.
	self
		disabledStyle: #plain;
		enabled: true
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph>>initialColorInSystemWindow: aSystemWindow [
	^ self theme textColor
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph>>initialize [
	"Initialize the receiver."

	super initialize.
	self
		disabledStyle: #plain;
		enabled: true
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph>>interactionState: aSymbol [
	"Backstop here to prevent 'legacy' color handling being applied from
	pluggable buttons."
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph>>isMorphicModel [
	^true
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph>>minHeight [
	"Answer the receiver's minimum height.
	based on font height."
	
	^self fontToUse height rounded max: super minHeight
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph>>minWidth [
	"Answer the minmum width of the receiver.
	Based on font and contents."

	^self valueOfProperty: #minWidth ifAbsent: [self measureContents x] "allow override"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph>>model [
	"Answer the value of model"

	^model
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph>>model: anObject [
	"Set my model and make me me a dependent of the given object."

	model ifNotNil: [model removeDependent: self].
	anObject ifNotNil: [anObject addDependent: self].
	model := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph>>stringColor [

	^ self enabled
		ifTrue: [ self color ]
		ifFalse: [ self theme labelDisabledColorFor: self ]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph>>update: aSymbol  [
	"Refer to the comment in View|update:."

	aSymbol == self getEnabledSelector ifTrue:
		[self updateEnabled.
		^ self].
	aSymbol == self getTextSelector ifTrue:
		[self updateText.
		^ self]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph>>updateEnabled [
	"Update the enablement state."

	self model ifNotNil: [
		self getEnabledSelector ifNotNil: [
			self enabled: (self model perform: self getEnabledSelector)]]
]

{
	#category : #update,
	#timestamp : ' 8/31/2017 05:26:14'
}
LabelMorph>>updateText [
	"Update the text contents."

	self model ifNotNil: [
		self getTextSelector ifNotNil: [
			self contents: (self model perform: self getTextSelector)]]
]
