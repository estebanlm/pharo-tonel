"
A ButtonComposableModel is an applicative model which handle a basic button.
See AbstractWidgetModel

self example

You can also have a look at CustomerStatisfaction for another example.

I provide the following variables and their accessors
- action is the action performed when I am clicked.
- icon is the icon displayed on me.
- label is the text displayed on me.
- state is a boolean representing if I am highlighted, it is false by default and it is reversed while clicking.

todo
- askBeforeChanging
- font
- menu
- shortcut
"
Class {
	#name : #ButtonModel,
	#superclass : #AbstractWidgetModel,
	#instVars : [
		'actionHolder',
		'labelHolder',
		'fontHolder',
		'stateHolder',
		'actionPerformedHolder',
		'askBeforeChangingHolder',
		'iconHolder',
		'menuHolder',
		'shortcutHolder'
	],
	#category : #Spec-Core-Widgets,
	#timestamp : 'Spirita 6/30/2016 09:59'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel class>>adapterName [

	^ #ButtonAdapter
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel class>>defaultSpec [
	<spec>
	
	^ #(ButtonAdapter
		adapt: #(model))
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel class>>example [
	^ self new
		openWithSpec;
		label: 'Click me'
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel class>>title [

	^ 'Button'
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>action [
	"<api: #inspect>"
	"get the block performed when the button is clicked"

	^ actionHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>action: aBlock [
	"set the block performed when the button is clicked"
	"<api: #block getter: #getAction registration: #whenActionChangedDo:>"

	actionHolder value: aBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>addShortcutTipFor: aString [

	^ self 
		addShortcutTipFor: self shortcutCharacter
		on: aString
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>addShortcutTipFor: aCharacter on: aString [
	| index text |
	
	aString isNil ifTrue: [ ^ nil ].
	text := aString asText.
	aCharacter ifNil: [ ^ text ].
	index := aString asLowercase indexOf: aCharacter asLowercase.
	index isZero ifTrue: [ ^ text ].
	
	^ text
		addAttribute: (TextEmphasis underlined) 
		from: index
		to: index;
		yourself
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>askBeforeChanging [

	^ askBeforeChangingHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>askBeforeChanging: aBoolean [

	askBeforeChangingHolder value: aBoolean
]

{
	#category : #private-focus,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>ensureKeyBindingsFor: widget [

	super ensureKeyBindingsFor: widget.
	self shortcut ifNotNil: [ :s | self registerShortcut: s ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>font [

	^ fontHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>font: aFont [

	fontHolder value: aFont
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>getAction [
	"<api: #inspect>"
	"get the block performed when the button is clicked"

	^ actionHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>icon [

	^ iconHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>icon: anIcon [

	iconHolder value: anIcon
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>iconName: aSymbol [

	iconHolder value: (self iconNamed: aSymbol)
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>initialize [

	super initialize.

	actionHolder := [] asValueHolder.
	labelHolder := '' asValueHolder.
	fontHolder := nil asValueHolder.
	iconHolder := nil asValueHolder.
	stateHolder := false asValueHolder.
	actionPerformedHolder := nil asValueHolder.
	askBeforeChangingHolder := false asValueHolder.
	shortcutHolder := nil asValueHolder.
	
	labelHolder whenChangedDo: [ self changed: #label ].
	fontHolder whenChangedDo: [ self changed: #font ].
	iconHolder whenChangedDo: [ self changed: #label ].
	stateHolder whenChangedDo: [ self changed: #state ].
	askBeforeChangingHolder whenChangedDo: [:newValue | self changed: { #askBeforeChanging: . newValue} ].
	shortcutHolder whenChangedDo: [ :newShortcut :oldShortcut |
		self unregisterShortcut: oldShortcut.
		self registerShortcut: newShortcut.
		self changed: #label ].
	
	menuHolder := MenuModel new asValueHolder.	
	menuHolder whenChangedDo: [ :aMenuModel :oldMenu | 
		(oldMenu isNil or: [ oldMenu isBlock ]) ifFalse: [ oldMenu neglect: self ].
		(aMenuModel isNil or: [ aMenuModel isBlock ]) ifFalse: [ aMenuModel applyTo: self ] ].
		
	self bindKeyCombination: Character space toAction: [ self action ].
]

{
	#category : #morphic,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>label [
	"<api: #inspect>"
	
 	^ self addShortcutTipFor: labelHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>label: aStringOrImageMorph [
	"<api: #string getter: #label registration: #whenLabelChangedDo:>"

	labelHolder value: aStringOrImageMorph
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>menu [

	^ menuHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>menu: aMenu [

	menuHolder value: aMenu
]

{
	#category : #morphic,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>performAction [

	actionHolder value value.
	" Here I set a dummy value just to make the holder raise an event "
	actionPerformedHolder value: nil.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>registerShortcut: newShortcut [
	| receiver |
	receiver := self window.
	(receiver isNil or: [ newShortcut isNil ]) ifTrue: [ ^ self ].

	receiver model
		bindKeyCombination: newShortcut 
		toAction: [ self performAction ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>shortcut [

	^ shortcutHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>shortcut: aShortcut [

	shortcutHolder value: aShortcut
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>shortcutCharacter [

	^ self shortcut 
		ifNil: [ nil ]
		ifNotNil: [ :s | s currentCharacter ]
]

{
	#category : #morphic,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>state [
	"<api: #inspect>"
	^ stateHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>state: aBoolean [
	"<api: #boolean getter: #state registration: #whenStateChangedDo:>"
	"set if the button is highlighted"
	
	^ stateHolder value: aBoolean
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>unregisterShortcut: oldShortcut [
	| receiver |
	receiver := self window.
	(receiver isNil or: [ oldShortcut isNil ]) ifTrue: [ ^ self ].

	receiver model
		removeKeyCombination: oldShortcut 
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>whenActionChangedDo: aBlock  [

	actionHolder whenChangedDo: aBlock
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>whenActionPerformedDo: aBlock [
	"set a block to perform after that the button has been aclicked, and its action performed"

	actionPerformedHolder whenChangedDo: aBlock
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>whenFontChangedDo: aBlock [
	"set a block to perform after that the button has been aclicked, and its action performed"

	fontHolder whenChangedDo: aBlock
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>whenLabelChangedDo: aBlock [
	"set a block to perform after that the button has been aclicked, and its action performed"

	labelHolder whenChangedDo: aBlock
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
ButtonModel>>whenStateChangedDo: aBlock [
	"set a block to perform after that the button has been aclicked, and its action performed"

	stateHolder whenChangedDo: aBlock
]
