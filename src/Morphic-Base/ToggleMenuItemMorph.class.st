"
A menu item that supports on/off state (using standard icons), enablement and display of ""accelerator"" key text.
"
Class {
	#name : #ToggleMenuItemMorph,
	#superclass : #MenuItemMorph,
	#instVars : [
		'getStateSelector',
		'enablementSelector',
		'keyText'
	],
	#category : #Morphic-Base-Menus,
	#timestamp : 'gvc 5/18/2007 10:22'
}

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>adjacentTo [

	^{self bounds topRight + (5 @ 0). self bounds topLeft + (2@0)}
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>adoptPaneColor: paneColor [
	"Pass on to submenu too."
	
	super adoptPaneColor: paneColor.
	self hasSubMenu ifTrue: [self subMenu adoptPaneColor: paneColor]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>argumentsBlock: aBlock [

	self arguments: aBlock value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>balloonText: aText [

	self assureExtension balloonText: aText
]

{
	#category : #drawing-private,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>basicDrawOn: aCanvas  [
	"Draw on the canvas. Taken from MenuItemMorph for minor refactoring."
	
	| stringColor stringBounds|
	stringColor := self stringColorToUse.
	stringBounds := self stringBoundsToUse.
	(self isSelected and: [self isEnabled]) ifTrue: [
		aCanvas
			fillRectangle: self bounds
			fillStyle: self selectionFillStyle
			borderStyle: self selectionBorderStyle].
	self hasIcon ifTrue: [ |iconForm|
		iconForm := self icon.
		self drawIcon: iconForm on: aCanvas in: stringBounds.
		stringBounds := stringBounds left: stringBounds left + iconForm width + 2].
	self hasMarker ifTrue: [
		stringBounds := stringBounds left: stringBounds left + self submorphBounds width + 8].
	stringBounds := stringBounds top: stringBounds top + stringBounds bottom - self fontToUse height // 2.
	stringBounds := stringBounds bottom: stringBounds top + self fontToUse height.
	self drawText: contents on: aCanvas in: stringBounds.
	self hasSubMenu ifTrue: [ |subMenuMarker| 
		subMenuMarker := self subMenuMarker deepCopy mapColor: Color black to: stringColor.
		self drawSubMenuMarker: subMenuMarker on: aCanvas in: stringBounds]
]

{
	#category : #drawing-private,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>drawIcon: aForm on: aCanvas in: aRectangle [
	"Draw the icon on the canvas within the given bounds."
	
	|iconForm|
	self isEnabled
		ifTrue: [iconForm := aForm]
		ifFalse: [iconForm := Form extent: aForm extent depth: 32.
				iconForm fillColor: (Color white alpha: 0.003922).
				(iconForm getCanvas asAlphaBlendingCanvas: 0.5)
					drawImage: aForm
					at: 0@0].
	aCanvas
		translucentImage: iconForm
		at: aRectangle topLeft + (0@(aRectangle height - iconForm height // 2))
]

{
	#category : #drawing-private,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>drawKeyTextOn: aCanvas  [
	"Draw the key text on the canvas."
	
	self keyText ifNil: [^self].
	self itemShortcut drawOn: aCanvas
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>drawOn: aCanvas  [
	"Need to check isEnabled here."
	
	self
		isEnabled;
		basicDrawOn: aCanvas;
		drawKeyTextOn: aCanvas
]

{
	#category : #drawing-private,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>drawSubMenuMarker: aForm on: aCanvas in: aRectangle [
	"Draw the submenu marker on the canvas within the given bounds."
	
	|markerRect| 
	markerRect := aRectangle topRight + (aForm width negated @ (aRectangle height - aForm height // 2)) extent: aForm extent.
	self drawIcon: aForm on: aCanvas in: markerRect
]

{
	#category : #drawing-private,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>drawText: aStringOrText on: aCanvas in: aRectangle [
	^ self 
		drawText: aStringOrText 
		on: aCanvas 
		in: aRectangle 
		color: self stringColorToUse.
]

{
	#category : #drawing-private,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>drawText: aStringOrText on: aCanvas in: aRectangle color: stringColor  [
	"Draw the text on the canvas within the given bounds."
	
	(self enabled not and: [self theme disabledItemStyle = #inset])
		ifTrue: [
				aCanvas
					drawString: aStringOrText
					in: aRectangle 
					font: self fontToUse
					color: stringColor muchLighter lighter;
					drawString: aStringOrText
					in: (aRectangle translateBy: -1)
					font: self fontToUse
					color: stringColor]
		ifFalse: [aCanvas
					drawString: aStringOrText
					in: aRectangle 
					font: self fontToUse
					color: stringColor ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>enablementSelector [
	"Answer the value of enablementSelector"

	^ enablementSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>enablementSelector: anObject [
	"Set the value of enablementSelector"

	enablementSelector := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>getStateSelector [
	"Answer the value of getStateSelector"

	^ getStateSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>getStateSelector: anObject [
	"Set the value of getStateSelector"

	getStateSelector := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>icon [
	"Answer the receiver's icon. Handle legacy case
	of wording-based mechanism."
	
	|state| 
	self getStateSelector ifNil: [^super icon].
	state := (MessageSend receiver: self target selector: self getStateSelector)
		valueWithEnoughArguments: self arguments .
	self flag: #CleanYesNoOnOffAfter.
	(state isKindOf: Association)
		ifTrue: [^ state key ifTrue: [self onImage] ifFalse: [self offImage]]
		ifFalse: [
	(state = true or: [state isString and: [(state beginsWith: '<yes>') or: [state beginsWith: '<on>']]])
		ifTrue: [^self onImage].
	(state = false or: [state isString and: [(state beginsWith: '<no>') or: [state beginsWith: '<off>']]])
		ifTrue: [^self offImage]].
	^super icon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>isEnabled [
	"Answer whether the item is enabled."
	
	|state|
	self enablementSelector ifNil: [^super isEnabled].
	state := self enablementSelector isSymbol
		ifTrue: [self target perform: self enablementSelector]
		ifFalse: [self enablementSelector value].
	self isEnabled: state.
	^state
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>isEnabled: aBoolean [

	isEnabled = aBoolean ifTrue: [^ self].
	isEnabled := aBoolean.
	self changed
]

{
	#category : #drawing-private,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>itemShortcut [

	^ ToggleMenuItemShortcut 
		owner: self 
		keyText: self keyText
		
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>keyText [
	"Answer the value of keyText"

	^ keyText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>keyText: anObject [
	"Set the value of keyText"

	keyText := anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>keyTextExpanded [
	^ ToggleMenuItemShortcut normalize: self keyText
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>minWidth [
	"Plus the key text if any."
	
	|w|
	w := super minWidth.
	self keyText ifNotNil: [w := w + (self fontToUse widthOfString: self keyTextExpanded) + 12].
	^w
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>mouseEnter: evt [
	"The mouse entered the receiver.
	Handle the case when in an EmbeddedMenuMorph."

	super mouseEnter: evt.
	(owner notNil and: [owner isKindOf: EmbeddedMenuMorph]) ifTrue:[
		owner selectedItem ~~ self
			ifTrue: [owner selectItem: self event: evt]]
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>mouseLeave: evt [
	"The mouse left the receiver.
	Handle the case when in an EmbeddedMenuMorph."

	super mouseLeave: evt.
	(owner notNil and: [owner isKindOf: EmbeddedMenuMorph]) ifTrue:[
		owner selectedItem == self
			ifTrue: [owner selectItem: nil event: evt]]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>offImage [
	"Return the form to be used for indicating an '<off>' marker."
	
	|m form|
	m := CheckboxButtonMorph new
		privateOwner: self owner;
		adoptPaneColor: self paneColor;
		selected: false.
	form := Form extent: m extent depth: 32.
	form fillColor: (Color white alpha: 0.003922).
	form getCanvas fullDrawMorph: m.
	^form
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>onImage [
	"Return the form to be used for indicating an '<on>' marker."
	
	|m form|
	m := CheckboxButtonMorph new
		privateOwner: self owner;
		adoptPaneColor: self paneColor;
		selected: true.
	form := Form extent: m extent depth: 32.
	form fillColor: (Color white alpha: 0.003922).
	form getCanvas fullDrawMorph: m.
	^form
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>select: evt [
	"Don't if not enabled."
	
	self isEnabled ifFalse: [^self].
	^super select: evt
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>selectionBorderStyle [
	"Answer the border style to use with the receiver is the selected element."
	
	^ self theme menuItemSelectedBorderStyleFor: self
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>selectionFillStyle [
	"Answer the fill style to use with the receiver is the selected element."
	
	^ self theme menuItemSelectedFillStyleFor: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>stringBoundsToUse [
	"Answer the bounds to use when drawing the item text."
	
	^ self bounds
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ToggleMenuItemMorph>>stringColorToUse [
	"Answer the state dependent color to use for drawing text."
	
	^self isEnabled
		ifTrue: [self isSelected
					ifTrue: [self theme menuItemSelectedTextColorFor: self]
					ifFalse: [self theme menuItemNormalTextColorFor: self]]
		ifFalse: [self theme menuItemDisabledTextColorFor: self]
]
