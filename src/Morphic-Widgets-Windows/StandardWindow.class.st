"
Themed SystemWindow that avoids being picked up except via the title bar. Supports opening in ""fullscreen"" mode, taking docking bars into account.
Prevents yellow button menu.
Uses TEasilyThemed for easy theme access to subclasses.
"
Class {
	#name : #StandardWindow,
	#superclass : #SystemWindow,
	#traits : 'TEasilyThemed - {#theme}',
	#classTraits : 'TEasilyThemed classTrait',
	#category : #Morphic-Widgets-Windows-Widgets,
	#timestamp : 'AlainPlantec 10/17/2009 18:59'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
StandardWindow class>>newWithTheme: aUITheme [
	"Answer a new window with the given theme."

	^ self basicNew
		basicTheme: aUITheme;
		initialize
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:15'
}
StandardWindow>>defaultColor [
	"Answer the default color/fill style for the receiver"
	
	^self theme windowColor
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:15'
}
StandardWindow>>defaultLabel [
	"Answer the default label for the receiver."

	^'Window' translated
]

{
	#category : #open/close,
	#timestamp : ' 8/31/2017 05:26:15'
}
StandardWindow>>delete [
	"If fullscreen remove the owner too."
	
	self mustNotClose ifTrue: [^ self].
	self model ifNotNil: [ 
		self model okToChange ifFalse: [ ^ self ].
		self model okToClose ifFalse: [ ^ self ] ].
	self isFullscreen
		ifTrue: [self owner delete]
		ifFalse: [super delete]
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:15'
}
StandardWindow>>flash [
	"Flash the window."
	
	(self hasProperty: #activeModalFlash) ifTrue: [ ^self ].
	self setProperty: #activeModalFlash toValue: true.
		
	[ 
		
		| oldColor newColor duration |
	
		oldColor := self fillStyle.
		newColor := self color alphaMixed: 0.5 with: Color white.
		duration := 0.
	
		2 timesRepeat: [
			duration milliSeconds asDuration wait.
			duration := 200.
			
			self color: newColor.
			
			duration milliSeconds asDuration wait.
			
			self color = newColor ifFalse: [ 
				"the color changed while waiting (theme changed)"
				oldColor := self fillStyle 
			].
		
			self fillStyle: oldColor.
		].
	
		self removeProperty: #activeModalFlash
	
	] fork.

]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:15'
}
StandardWindow>>initialize [
	"Initialize the receiver."

	super initialize.
	self
		setLabel: self defaultLabel;
		setWindowColor: self defaultColor
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
StandardWindow>>isActive [
	"Answer active if fullscreen too."
	
	^self isFullscreen or: [super isActive]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
StandardWindow>>isFullscreen [
	"Answer whether the window should be draw as fullscreen, i.e.
	no title bar or borders."

	^self owner isKindOf: FullscreenMorph
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:15'
}
StandardWindow>>layoutBounds [
	"Bounds of pane area only."
	
	^self isFullscreen
		ifTrue: [self perform: #layoutBounds withArguments: #() inSuperclass: Morph]
		ifFalse: [super layoutBounds]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
StandardWindow>>model: anObject [
	"Reset the minimum extent."

	super model: anObject.
	self title: self title
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:15'
}
StandardWindow>>mouseMove: evt [
	"Handle a mouse-move event"

	self isFullscreen ifTrue: [^self]. "do nothing if fullscreen"
	^super mouseMove: evt
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
StandardWindow>>newTextEntryFor: aModel getText: getSel setText: setSel help: helpText [
	"Answer a text entry for the given model."

	^self theme
		newTextEntryIn: self
		for: aModel
		get: getSel
		set: setSel
		class: String
		getEnabled: nil 
		help: helpText
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
StandardWindow>>noteNewOwner: aMorph  [
	"Go fullscreen if needed."

	super noteNewOwner: aMorph.
	(self isFullscreen and: [labelArea owner notNil]) ifTrue: [
		self
			beWithoutGrips;
			removeLabelArea;
			makeBorderless.
		(self submorphs size = 1 and: [self submorphs first isKindOf: PanelMorph])
			ifTrue: [self submorphs first roundedCorners: #()]]
]

{
	#category : #open/close,
	#timestamp : ' 8/31/2017 05:26:15'
}
StandardWindow>>open [
	"Where else would you want to open it?."

	self openInWorld
]

{
	#category : #open/close,
	#timestamp : ' 8/31/2017 05:26:15'
}
StandardWindow>>openAsIsIn: aWorld [
	"Sad fixup for dodgy layout."

	super openAsIsIn: aWorld.
	self allMorphs do: [:m | m layoutChanged]
]

{
	#category : #open/close,
	#timestamp : ' 8/31/2017 05:26:15'
}
StandardWindow>>openFullscreen [
	"Open the receiver in a FullscreenMorph."

	^FullscreenMorph new
		setContentMorph: self;
		openInWorld
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
StandardWindow>>openedFullscreen [
	"Should activate and update the layout."

	self allMorphs do: [:m | m layoutChanged].
	self activate
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
StandardWindow>>title [
	
	^self label
]

{
	#category : #controls,
	#timestamp : ' 8/31/2017 05:26:15'
}
StandardWindow>>title: aString [
	
	self setLabel: aString
	
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:15'
}
StandardWindow>>wantsRoundedCorners [
	"Check to see if the property is set first."
	
	^self isFullscreen
		ifTrue: [false]
		ifFalse: [^super wantsRoundedCorners]
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:15'
}
StandardWindow>>withText: aStringOrText label: title  [
	
	self title: title.
	self 
		addMorph: (RubScrolledTextMorph new 
				setText: aStringOrText asString;
				yourself)
		fullFrame: LayoutFrame identity.						
	self themeChanged.

]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
StandardWindow>>yellowButtonActivity: shiftState  [
	"Do nothing."
	^ false
]
