"
I am a morph that captures keymappings, so they can be used for configuration/customization, or debugging.
"
Class {
	#name : #KMCatcherMorph,
	#superclass : #BorderedMorph,
	#instVars : [
		'focused',
		'keystrokes',
		'keymapSetting',
		'labelMorph',
		'initialShortcut',
		'edited'
	],
	#category : #Keymapping-Settings,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCatcherMorph class>>for: aModel [
	^ (self new)
		keymapSetting: aModel;
		yourself
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCatcherMorph>>accept [
	| shortcut |
	shortcut := self shortcut.
	keymapSetting accept: shortcut.
	self initialShortcut: shortcut.
	edited := false.
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCatcherMorph>>allowsKeymapping [
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCatcherMorph>>balloonText [
	^ 'Click to edit shortcut.  Right click to open context menu.'
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCatcherMorph>>cancel [
	edited
		ifFalse: [ ^ self ].
	self keystrokes: OrderedCollection new.
	self showInitialShortcut.
	self initializeKeystrokes
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCatcherMorph>>clear [
	self keystrokes removeAll.
	self showKeystrokes.
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCatcherMorph>>drawOn: aCanvas [
	"Indicate unaccepted edits, conflicts etc."

	super drawOn: aCanvas. 
	focused ifTrue: [
		Smalltalk ui theme drawTextAdornmentFor: self color: Color orange on: aCanvas]
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCatcherMorph>>handlesKeyboard: event [
	^ focused
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCatcherMorph>>handlesMouseDown: event [
	^ true
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCatcherMorph>>initialShortcut: aShortcut [
	initialShortcut := aShortcut.
	self showInitialShortcut.
	self initializeKeystrokes.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCatcherMorph>>initialize [
	super initialize.
	self layoutPolicy: TableLayout new.
	self listCentering: #center.
	self width: 300.
	self height: 25.
	self color: (Smalltalk ui theme textEditorDisabledFillStyleFor: self).
	self borderStyle: (Smalltalk ui theme textEditorDisabledBorderStyleFor: self).
	
	labelMorph := StringMorph contents: ''.
	self addMorph: (labelMorph).
	
	edited := false.
	focused := false.
	self initializeKeystrokes.
	
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCatcherMorph>>initializeKeystrokes [
	keystrokes := OrderedCollection new.
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCatcherMorph>>keyStroke: aKeyStroke  [
	edited := true.
	self keystrokes add: aKeyStroke.
	self showKeystrokes.
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCatcherMorph>>keyboardFocusChange: aBoolean [
	super keyboardFocusChange: aBoolean.
	focused := aBoolean.
	focused
		ifTrue: [ self color: (Smalltalk ui theme textEditorNormalFillStyleFor: self) ]
		ifFalse: [ self color: (Smalltalk ui theme textEditorDisabledFillStyleFor: self) ].
	^ true
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCatcherMorph>>keymapSetting: aSetting [
	keymapSetting := aSetting.
	self initialShortcut: keymapSetting shortcut.
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCatcherMorph>>keystrokes [
	^ keystrokes
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCatcherMorph>>keystrokes: someKeystrokes [
	keystrokes := someKeystrokes.
	self showKeystrokes.
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCatcherMorph>>mouseDown: event  [
	super mouseDown: event.
	event yellowButtonPressed 
		ifTrue: [ self showContextMenu ]
		ifFalse: [ World activeHand newKeyboardFocus: self ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCatcherMorph>>setMessage: aMessage  [
	labelMorph contents: aMessage
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCatcherMorph>>shortcut [
	| theKeystrokes |
	theKeystrokes := self keystrokes.
	theKeystrokes 
		ifEmpty: [ ^ KMNoShortcut new ].
		
	^ theKeystrokes allButFirst 
		inject: theKeystrokes first asKeyCombination 
		into: [ :acum :each | 
			acum , each asKeyCombination ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCatcherMorph>>shortcutString [
	| shortcut |
	self keystrokes 
		ifEmpty: [ ^ '' ].
	shortcut := self shortcut.
	^ shortcut asString
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCatcherMorph>>showContextMenu [
	| menu |
	menu := MenuMorph new defaultTarget: self.
	
	edited 
		ifTrue: [
			menu add: 'accept' selector: #accept.
			menu add: 'clear' selector: #clear.
			menu add: 'cancel' selector: #cancel.
			].
		
	menu popUpInWorld
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCatcherMorph>>showInitialShortcut [
	self setMessage: initialShortcut asString.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCatcherMorph>>showKeystrokes [
	self setMessage: self shortcutString.
]

{
	#category : #'halos and balloon help',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCatcherMorph>>wantsBalloon [
	^ true
]
