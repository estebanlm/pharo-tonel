"
ShortcutReminder is an object used to bring up a notification whenever a menu entry that has a keyboard shortcut is clicked on instead of using the keyboard.

It is configurable from the settings browser, where one can choose the location and size of the notification Morph. The notification also holds a count of how many times a specific menu entry has been reminded for, and will only notify up to that limit. It is possible to set this limit to -1 such that it will always notify.

"
Class {
	#name : #ShortcutReminder,
	#superclass : #Object,
	#instVars : [
		'limit',
		'size',
		'position',
		'countDict',
		'backgroundColor',
		'textColor'
	],
	#classVars : [
		'DefaultReminder',
		'Enabled'
	],
	#category : #Morphic-Base-Menus,
	#timestamp : 'HenrikNergaard 1/17/2016 00:17'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder class>>defaultReminder [

	^DefaultReminder ifNil: [ DefaultReminder := self new ]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder class>>enabled [

	^Enabled ifNil: [ Enabled := false ]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder class>>enabled: aBoolean [

	Enabled := aBoolean
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder class>>settingsOn: aBuilder  [
	<systemsettings>
	(aBuilder setting: #'Shortcut Reminder') 
		target: self;
		parent: #appearance;
		description: 'Shortcut reminder is a reminding tool which pops up when a menu entry which includes a keyboard shortcut is invoked by the mouse instead';
		selector: #enabled;
		iconName: #smallConfigurationIcon;
		with: [ self defaultReminder customSettingsOn: aBuilder ]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder class>>showShortcut: aShortcut [
	
	(aShortcut keyText isNil or: [ self enabled not ]) ifTrue: [ ^self ].
	
	self defaultReminder remind: aShortcut.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>backgroundColor [

	^backgroundColor 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>backgroundColor: aColor [

	backgroundColor := aColor
]

{
	#category : #'private - utilities',
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>createKeyTextMorph: aString [

	^(self fixKeyText: aString) asStringMorph 
		font: self keyTextFont emphasis: 2;
		color: textColor;
		yourself. 
]

{
	#category : #'private - utilities',
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>createLabelMorph: aString [

	^aString asStringMorph 
		font: self labelFont emphasis: 0;
		color: textColor;
		yourself. 
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>createResetCountButtonMorph [

	^SimpleButtonMorph new
		target: self;
		label: 'Reset notification counts';
		actionSelector: #resetCount;
		themeChanged;
		yourself
	
]

{
	#category : #'shortcut creation',
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>createShortcutMorphFor: aMenuItem  [

	^FadingMorph new
		addMorphBack: (self createLabelMorph: aMenuItem contents);
		addMorphBack: (self createKeyTextMorph: aMenuItem keyText);
		color: backgroundColor;
		yourself

]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>customSettingsOn: aBuilder [

	(aBuilder pickOne: #position)
		order: 1;
		target: self;
		label: 'Position in World';
		description: 'Select one of the positons available to specify where the shortcut notification morph will be shown';
		domainValues: self positions.
		
	(aBuilder pickOne: #textSize) 
		order: 2;
		target: self;
		label: 'Size of the reminder';
		description: 'Set the size (small medium or large) of the reminder morph shown';
		domainValues: self sizes.
		
	(aBuilder setting: #textColor)
		order: 3;
		target: self;
		label: 'Text color';
		default: self defaultTextColor.
		
	(aBuilder setting: #backgroundColor)
		target: self;
		label: 'Background color';
		default: self defaultBackgroundColor.
		
	(aBuilder range: #limit) 
		order: 6;
		target: self; 
      label: 'Notification limit' ;
		description: 'Set the limit of how many notifications per menu entry one should be reminded about. Setting the value to -1 means that it will allways remind you' ;
		default: self defaultLimit;
		range: (-1 to: 100).
		
	(aBuilder group: #'Reset count')
		order: 7;
		target: self;
		label: 'Reset the reminder count';
		dialog: [ self createResetCountButtonMorph ].
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>defaultBackgroundColor [

	^Color gray
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>defaultFontFamiliyName [

	^'Source Sans Pro'
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>defaultLimit [

	^5
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>defaultTextColor [

	^Color black
]

{
	#category : #'private - utilities',
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>fixKeyText: aString [

	^ToggleMenuItemShortcut normalize: aString
]

{
	#category : #'private - utilities',
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>fontSized: aPointSize [

	^LogicalFont familyName: self defaultFontFamiliyName pointSize: aPointSize
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>initialize [

	countDict := Dictionary new.
	limit := self defaultLimit.
	size := #small.
	position := #bottomLeft.
	backgroundColor := self defaultBackgroundColor.
	textColor := self defaultTextColor.

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>keyTextFont [

	^self fontSized: self pointSize * 2
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>labelFont [

	^self fontSized: self pointSize 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>large [

	^55
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>limit [
	
	^limit
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>limit: aNumber [

	limit := aNumber
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>medium [

	 ^27
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>pointSize [

	^size value: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>position [

	^position
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>position: aSymbol [

	(self positions includes: aSymbol) ifFalse: [ self error ].
	
	position := aSymbol
]

{
	#category : #'shortcut creation',
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>positionShortcut: aMorph [
	
	| area |
	
	area := World clearArea insetBy: 3. 
	
	aMorph 
	cellPositioning: position;
	fullBounds. 
	"the layout has to be computed before changing the position."
	
	aMorph perform: (position , ':') asSymbol with: (position value: area).
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>positions [

	^#(#topLeft #topRight #center #bottomLeft #bottomRight)
]

{
	#category : #'shortcut creation',
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>remind: aMenuItem  [

	| itemHash |
	
	itemHash := (aMenuItem contents hash + aMenuItem keyText hash) hashMultiply.
	
	(self wantsToShow: itemHash) ifFalse: [ ^self ].
	
	self 
	show: aMenuItem;
	updateCount: itemHash.
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>resetCount [

	countDict := Dictionary new. 
	
]

{
	#category : #'shortcut creation',
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>show: aMenuItem [

	| shortcutMorph |
	
	shortcutMorph := self createShortcutMorphFor: aMenuItem.
	
	self positionShortcut: shortcutMorph.
	
	shortcutMorph openInWorld.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>sizes  [

	^#(#small #medium #large) 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>small [

	^15
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>textColor [

	^textColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>textColor: aColor [

	textColor := aColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>textSize [

	^size
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>textSize: aSymbol [

	(self sizes includes: aSymbol) ifFalse: [ self error ].
	
	size := aSymbol
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>updateCount: aHashValue [
	
	| value |
	
	value := countDict at: aHashValue ifAbsent: [ 0 ].
	
	countDict at: aHashValue put: value + 1.
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 05:26:13'
}
ShortcutReminder>>wantsToShow: aHashValue [
	
	^limit < 0 or: [ 
		(countDict at: aHashValue ifAbsent: [ 0 ]) < limit
	]
]
