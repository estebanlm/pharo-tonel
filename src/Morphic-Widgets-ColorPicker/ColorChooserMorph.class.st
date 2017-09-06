"
ColorPresenter that opens a colour selector when clicked.
"
Class {
	#name : #ColorChooserMorph,
	#superclass : #ColorPresenterMorph,
	#traits : 'TEnableOnHaloMenu',
	#classTraits : 'TEnableOnHaloMenu classTrait',
	#instVars : [
		'setColorSelector',
		'enabled',
		'getEnabledSelector'
	],
	#category : #Morphic-Widgets-ColorPicker,
	#timestamp : 'gvc 5/18/2007 13:45'
}

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:14'
}
ColorChooserMorph class>>example [

	^ (ColorChooserMorph 
		on: (BorderedMorph new) 
		color: #color changeColor: #color:) openInWorld
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:14'
}
ColorChooserMorph class>>on: anObject color: getSel changeColor: setSel [
	"Answer a new instance of the receiver on the given model using
	the given selectors as the interface."
	"(ColorChooserMorph on: (BorderedMorph new) color: #color changeColor: #color:) openInWorld"
	^self new
		on: anObject 
		color: getSel
		changeColor: setSel
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:14'
}
ColorChooserMorph>>chooseColor [
	"Popup the color picker for now."

	|newColor|
	newColor := self theme
		chooseColorIn: ((self ownerThatIsA: SystemWindow) ifNil: [self])
		title: 'Choose Color' translated
		color: self labelMorph color.
	newColor ifNil: [^self].
	self labelMorph color: newColor.
	self solidLabelMorph color: newColor asNontranslucentColor.
	self setColorSelector ifNotNil: [self model perform: self setColorSelector with: newColor]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ColorChooserMorph>>enabled [
	"Answer the enabled state of the receiver."
	
	^enabled
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ColorChooserMorph>>enabled: aBoolean [
	"Set the enabled state of the receiver."

	enabled := aBoolean.
	self contentMorph ifNotNil: [:m | m enabled: aBoolean].
	self changed: #enabled
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ColorChooserMorph>>getEnabledSelector [
	"Answer the value of getEnabledSelector"

	^ getEnabledSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ColorChooserMorph>>getEnabledSelector: anObject [
	"Set the value of getEnabledSelector"

	getEnabledSelector := anObject.
	self updateEnabled
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
ColorChooserMorph>>initialize [
	"Initialize the receiver."

	enabled := true.
	super initialize
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:14'
}
ColorChooserMorph>>newContentMorph [
	"Answer a new button morph"

	|b|
	b := (self theme
		newButtonIn: self
		for: self
		getState: nil
		action: #chooseColor
		arguments: #()
		getEnabled: #enabled
		label: (self newHatchMorph layoutInset: 2)
		help: nil)
		hResizing: #spaceFill.
	b contentHolder hResizing: #spaceFill.
	^b
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:14'
}
ColorChooserMorph>>on: anObject color: getColSel changeColor: setColSel [
	"Set the receiver to the given model parameterized by the given message selectors."

	self
		on: anObject color: getColSel;
		setColorSelector: setColSel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ColorChooserMorph>>setColorSelector [
	"Answer the value of setColorSelector"

	^ setColorSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ColorChooserMorph>>setColorSelector: anObject [
	"Set the value of setColorSelector"

	setColorSelector := anObject
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:14'
}
ColorChooserMorph>>update: aSymbol  [
	"Refer to the comment in View|update:."

	super update: aSymbol.
	aSymbol == self getEnabledSelector ifTrue: 
		[self updateEnabled.
		^ self]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:14'
}
ColorChooserMorph>>updateEnabled [
	"Update the enablement state."

	self model ifNotNil: [
		self getEnabledSelector ifNotNil: [
			self enabled: (self model perform: self getEnabledSelector)]]
]
