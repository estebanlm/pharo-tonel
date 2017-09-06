"
I represent a cursor for the mouse 
"
Class {
	#name : #RubCursor,
	#superclass : #Morph,
	#instVars : [
		'stayVisible',
		'invisibleCursorColor',
		'visibleCursorColor',
		'period'
	],
	#classVars : [
		'DefaultColor',
		'DefaultWidth',
		'FixedColor',
		'Period'
	],
	#category : #Rubric-Editing-Core,
	#timestamp : 'FranckWarlouzet 7/29/2015 12:55'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor class>>cursorWithFixedColor [
	^ FixedColor ifNil: [ FixedColor := false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor class>>cursorWithFixedColor: aBoolean [
	FixedColor := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor class>>defaultColor [
	^ DefaultColor ifNil: [ DefaultColor := Color lightGray ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor class>>defaultColor: aColor [
	DefaultColor := aColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor class>>defaultWidth [
	^ DefaultWidth ifNil: [ DefaultWidth := 2 ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor class>>defaultWidth: anInteger [
	DefaultWidth := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor class>>period [
	^ Period ifNil: [ Period :=  700 ] 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor class>>period: anInteger [
	Period :=  anInteger
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor class>>rubricSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder group: #'Rubric cursor')
		parent: #Rubric;
		label: 'Cursor';
		with: [ 
					(aBuilder setting: #cursorWithFixedColor)
						target: self;
						label: 'Fixed color';
						with: [ 
									(aBuilder setting: #defaultColor)
										target: self;
										description: 'The cursolr color color';
										label: 'Color'  ].
					(aBuilder range: #defaultWidth)
						target: self;
						label: 'Width';
						description: 'Specify the cursor width';
						range: (1 to: 4).
					(aBuilder range: #period)
						target: self;
						label: 'Blinking period';
						description:
								'Specify the cursor blinking period in milliseconds. If it is set to zero then the cursor will not blink';
						range: (0 to: 1000) ]
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>aboutToBeRemoved [
	self beNotVisible.
	self removeAlarm.
	self textArea announcer unsubscribe: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>actualCursorColor [
	self textArea readOnly ifTrue: [ ^ Color transparent ].
	^ (self textArea hasFocus and: [ self stayVisible not ])
		ifFalse: [ self invisibleCursorColor ]
		ifTrue: [ self visibleCursorColor ]
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>addAlarm [

	self addAlarmAt: self period
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>addAlarmAt: millisecs [
	self removeAlarm.
	(self stayVisible not and: [ self textArea hasFocus ])
		ifFalse: [ ^ self ].
	self world
		ifNotNil: [ :wld | 
			wld
				addAlarm: #hideShow
				withArguments: #()
				for: self
				at: Time millisecondClockValue + millisecs ]
]

{
	#category : #blinking,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>beNotVisible [
	self color = self invisibleCursorColor
		ifFalse: [ self color: self invisibleCursorColor ]
]

{
	#category : #blinking,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>beVisible [
	self color = self invisibleCursorColor
		ifTrue: [ self color: self actualCursorColor ]
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>defaultBounds [
	^ 0 @ 0 corner: 0 @ 0
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>defaultColor  [
	^ Color transparent
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>defaultVisibleCursorColor [
	^ self theme textColor
]

{
	#category : #blinking,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>ensureFor: millisecs [
	self removeAlarm.
	self beVisible.
	self textArea canChangeText
		ifTrue: [ self addAlarmAt: millisecs ]
]

{
	#category : #blinking,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>hideShow [
	self textArea canChangeText 
		ifFalse: [ ^ self beNotVisible ].
	self stayVisible 
		ifTrue: [ ^ self beVisible ].
	self isBlinkingCursor
		ifTrue: [ 
			self switchColor.
			self addAlarm ]
		ifFalse: [ self beVisible ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>invisibleCursorColor [
	^ invisibleCursorColor ifNil: [ invisibleCursorColor := Color transparent ]
]

{
	#category : #blinking,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>isBlinkingCursor [
	^ self period > 0
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>noteNewOwner: aMorph  [
	super noteNewOwner: aMorph.
	self textArea announcer when: MorphGotFocus send: #whenGotFocus: to: self.
	self textArea announcer when: MorphLostFocus send: #whenLostFocus: to: self.
	self textArea announcer when: RubExtentChanged send: #whenTextAreaExtentChanged: to: self.
	self textArea announcer when: RubSelectionChanged send: #whenTextAreaSelectionChanged: to: self.
	self textArea announcer when: RubTextStyleChanged send: #whenTextAreaTextStyleChanged: to: self.

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>outOfWorld: aWorld [

	super outOfWorld: aWorld.
	
	aWorld removeAlarm: #hideShow for: self.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>period [
	^ period ifNil: [ period := self class period ]
]

{
	#category : #blinking,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>removeAlarm [
	self world
		ifNotNil: [ :wld | 
			wld removeAlarm: #hideShow for: self ] 
]

{
	#category : #blinking,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>startBlinking [
	self beVisible.
	self ensureFor: 1000
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>stayVisible [
	^ stayVisible ifNil: [ stayVisible := false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>stayVisible: aBoolean [
	stayVisible := aBoolean.
	self color: self visibleCursorColor 
]

{
	#category : #blinking,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>switchColor [
	self color = self invisibleCursorColor
		ifTrue: [ self color: self actualCursorColor ]
		ifFalse: [ self beNotVisible ].

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>textArea [
	^ owner
]

{
	#category : #structure,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>topRendererOrSelf [
	^owner topRendererOrSelf
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>unplug [
	self removeAlarm.
	self textArea announcer unsubscribe: self.
	super unplug
]

{
	#category : #'private - layout',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>updateBounds [
	| x line |
	self textArea ifNil: [ ^self ].
	line := self textArea selectionStop textLine.
	x := self textArea selectionStop left.
	self position: x @ line top.
	self extent: self class defaultWidth @ (line height + 1)
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>updateVisibility [
	(self textArea isNil or: [ self textArea canChangeText not ])
		ifTrue: [ ^ self beNotVisible ].
	self beVisible.
	self isBlinkingCursor
		ifTrue: [ self startBlinking ]
		ifFalse: [ self beVisible ].
	self changed
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>visibleCursorColor [
	self class cursorWithFixedColor 
		ifTrue: [ ^ self class defaultColor ].
	^ visibleCursorColor ifNil: [ self defaultVisibleCursorColor ] 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>visibleCursorColor: aColor [
	visibleCursorColor := aColor
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>whenGotFocus: anAnnouncement [
	self updateBounds.
	self updateVisibility 
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>whenLostFocus: anAnnouncement [
	self stayVisible
		ifFalse: [ 
			self removeAlarm.
			self beNotVisible ]
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>whenTextAreaExtentChanged: anAnnouncement [
	self updateBounds
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>whenTextAreaSelectionChanged: anAnnouncement [
	self updateBounds.
	self updateVisibility 
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubCursor>>whenTextAreaTextStyleChanged: anAnnouncement [
	self updateBounds.

]
