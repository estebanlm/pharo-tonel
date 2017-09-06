"
A GrowlMorph is a little Morph to announce event happening. Freely inspired from the MIT Snarl developed by  Tony Garnock-Jones. 

GrowlMorph new openInWorld.

10 timesRepeat: [
	(GrowlMorph openWithLabel: 'The time' contents: DateAndTime now)
""		vanishDelay: 1000;
		resetVanishTimer"".
	World doOneCycle ].

(GrowlMorph openWithLabel: 'The time' contents: DateAndTime now) 
	actionBlock: [Transcript open].
"
Class {
	#name : #GrowlMorph,
	#superclass : #TextMorph,
	#instVars : [
		'dismissHandle',
		'vanishTime',
		'alpha',
		'actionBlock',
		'vanishDelay',
		'attr',
		'labelAttr',
		'contentsAttr',
		'labelColor',
		'contentsColor'
	],
	#classVars : [
		'DefaultBackgroundColor',
		'Position'
	],
	#category : #Growl,
	#timestamp : 'StephanEggermont 9/5/2014 12:12'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph class>>contents: contentString [
	
	^ self new
		label: '' contents: contentString;
		yourself
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph class>>growlPositionChoices [

	^#(topRight 'top right' 
		bottomLeft 'bottom left'
		bottomRight 'bottom right'
		topLeft 'topLeft') pairsCollect: [:a :b | b -> a]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph class>>growlSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder group: #growl)
		label: 'Popup notification';  
		parent: #appearance;
		description: 'All settings concerned with the notifications popup look''n feel';
		with: [
			(aBuilder pickOne: #position)
				label: 'Popup position';
				target: self;
				default: #topRight;
				order: 1;
				domainValues: self growlPositionChoices.]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph class>>label: aString contents: contentString [
	
	^ self new
		label: aString contents: contentString;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph class>>openWithContents: contentString [
	
	^ (self contents: contentString) openInWorld
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph class>>openWithLabel: aString contents: contentString [
	
	^ (self label: aString contents: contentString) openInWorld
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph class>>openWithLabel: aString contents: contentString backgroundColor: aColor labelColor: aLabelColor [
	
	^ (self label: aString contents: contentString)
			backgroundColor: aColor;
			labelColor: aLabelColor;
			contentsColor: aLabelColor; 
			openInWorld
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph class>>openWithLabel: aString contents: contentString color: aColor [
	
	^ (self label: aString contents: contentString)
			backgroundColor: aColor;
			openInWorld
]

{
	#category : #position,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph class>>position [

	^ Position ifNil: [ Position := #topRight ]
]

{
	#category : #position,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph class>>position: aSymbol [

	(self possiblePositions includes: aSymbol) ifFalse: [ ^ self ].

	Position := aSymbol
]

{
	#category : #position,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph class>>possiblePositions [

	^ #( bottomRight bottomLeft topRight topLeft )
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>actionBlock: aBlock [

	actionBlock := aBlock
]

{
	#category : #internal,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>activeGrowlMorphs [

	^World submorphs select: [ :morph | morph isKindOf: GrowlMorph ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>alpha [
	^ alpha

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>alpha: newAlpha [

	"self alpha = newAlpha ifTrue: [^ self]."
	alpha := newAlpha.
	labelAttr color: (self labelColor alpha: alpha).
	contentsAttr color: (self contentsColor alpha: alpha).
	self backgroundColor: (self nextColorStep: self backgroundColor).
	self allMorphsDo: [:m |
		m borderColor: (self nextColorStep: m borderColor).
		m color: (self nextColorStep: m color)].
	self borderColor isTransparent ifTrue: [self delete].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>backgroundColor [

	^ backgroundColor ifNil: [ backgroundColor := self defaultBackgroundColor ]
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>contents: contentsString [

	self streamDo: [ :w |
		w withAttributes: self contentsAttributes do: [w nextPutAll: contentsString asString]].
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>contentsAttributes [
	^ { contentsAttr. TextAlignment centered. TextFontChange font2. }
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>contentsColor [
	^ contentsColor ifNil: [ contentsColor := self theme growlContentsColorFor: self ]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>contentsColor: aColor [
	"when you set this contentsColor, it takes precedence over theme one. In certain case (such as for green as in SUnit) it is needed, normally you do not need it."
	contentsColor := aColor.
	contentsAttr color: aColor.
	
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>createDismissHandle [
	| handle |
	handle := self theme growlDismissHandleFor: self.
	handle on: #mouseUp send: #delete to: self.
	^ handle
]

{
	#category : #default,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>defaultBackgroundColor [

	^ self theme growlFillColorFor: self
]

{
	#category : #default,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>defaultBorderColor [
	
	^ self theme growlBorderColorFor: self
]

{
	#category : #default,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>defaultTextStyle [
	^ TextStyle actualTextStyles at: #Accuny
]

{
	#category : #default,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>defaultVanishDelay [
	
	^ 1  seconds
]

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>enabled [

	^ false
]

{
	#category : #interaction,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>handlesMouseDown: evt [
	^ actionBlock notNil or: [super handlesMouseDown: evt]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>initialize [
	super initialize.
 	self  borderStyle: BorderStyle thinGray.
	
	self setProperty: #autoFitContents toValue: false.
 
	self initializeLabelAttributes.
	self initializeContentsAttributes.
	self vanishDelay: self defaultVanishDelay.
	self label: 'A cool title' contents: 'Here an important message'.
	dismissHandle := self createDismissHandle.
	self addMorph: dismissHandle
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>initializeContentsAttributes [
	contentsAttr := TextColor color: self contentsColor.
	
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>initializeLabelAttributes [
	labelAttr := TextColor color: self labelColor.
	
]

{
	#category : #internal,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>is: rect saneWithRespectTo: morphs [

	^(morphs anySatisfy: [ :morph | morph owner isNotNil and: [morph bounds intersects: rect]]) not

]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>label: labelString contents: contentsString [

	self streamDo: [ :w |
		w withAttributes: self labelAttributes do: [w nextPutAll: labelString asString; cr].
		w withAttributes: self contentsAttributes do: [w nextPutAll: contentsString asString].
		].
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>labelAttributes [
	^ { labelAttr. TextAlignment centered. TextFontChange font4. TextEmphasis bold. }
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>labelColor [
	^ labelColor ifNil: [ labelColor := self theme growlLabelColorFor: self ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>labelColor: aColor [
	"when you set this labelColor, it takes precedence over theme one. In certain case (such as for green as in SUnit) it is needed, normally you do not need it."
	labelColor := aColor.
	labelAttr color: self labelColor.
]

{
	#category : #default,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>minimumExtent [
	^ 256@38
]

{
	#category : #interaction,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>mouseDown: evt [
	super mouseDown: evt.
	evt yellowButtonPressed ifTrue: [^ self].
	actionBlock ifNotNil: [actionBlock valueWithPossibleArgs: { self }].
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>nextColorStep: aColor [
	^ aColor alpha: self alpha
]

{
	#category : #internal,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>openInWorld [

	self position: self unoccupiedPosition.
	super openInWorld
]

{
	#category : #internal,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>resetAlpha [
	^ self alpha: 0.9
]

{
	#category : #internal,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>resetVanishTimer [

	vanishTime := DateAndTime now + self vanishDelay.
	self resetAlpha.
]

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>step [

	(self containsPoint: ActiveHand position) ifTrue: [
		self resetAlpha.
		^ self].
	vanishTime ifNotNil: [DateAndTime now < vanishTime ifTrue: [^self]].
	self alpha: self alpha - 0.05.
]

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>stepTime [
	^ 100
]

{
	#category : #internal,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>streamDo: aBlock [

	self contentsWrapped: (Text streamContents: aBlock).
	self extent: self minimumExtent.
	self height: (paragraph extent y + (self borderWidth * 2) + (margins ifNil: [0] ifNotNil: [margins top + margins bottom]) + 2).

	self vanishDelay: ((((self contents size /50)seconds)+1 seconds) max: self defaultVanishDelay).
]

{
	#category : #position,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>unoccupiedPosition [

	self class position = #bottomLeft
		ifTrue: [ ^ self unoccupiedPositionBottomLeft ].
	self class position = #topRight
		ifTrue: [ ^ self unoccupiedPositionTopRight ].
	self class position = #bottomRight
		ifTrue: [ ^ self unoccupiedPositionBottomRight ].
	self class position = #topLeft
		ifTrue: [ ^ self unoccupiedPositionTopLeft ].
	^ 0@0	
	
]

{
	#category : #position,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>unoccupiedPositionBottomLeft [

	| startPos area rect morphs |
	
	startPos := 10 negated @ (self height + 10).
	area := World clearArea.
	rect := (area bottomLeft - startPos) extent: self extent.
	
	morphs := self activeGrowlMorphs.
	[self is: rect saneWithRespectTo: morphs] whileFalse: [
		rect := rect translateBy: 0@(-10).
		rect top < 0 ifTrue: [^ area bottomLeft - startPos]
	].
	^ rect origin
]

{
	#category : #position,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>unoccupiedPositionBottomRight [

	| startPos area rect morphs |
	
	startPos := (self width + 10 ) @ (self height + 10).
	area := World clearArea.
	rect := (area bottomRight - startPos) extent: self extent.
	
	morphs := self activeGrowlMorphs.	
	[self is: rect saneWithRespectTo: morphs] whileFalse: [
		rect := rect translateBy: 0@(-10).
		rect top < 0 ifTrue: [^ area bottomRight - startPos ]
	].
	^ rect origin
]

{
	#category : #position,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>unoccupiedPositionTopLeft [

	| startPos area rect morphs |
	
	startPos := 10@10.
	area := World clearArea.
	rect := area topLeft + (startPos) extent: self extent.
	
	morphs := self activeGrowlMorphs.
	[self is: rect saneWithRespectTo: morphs] whileFalse: [
		rect := rect translateBy: 0@10.
		rect bottom > area height ifTrue: [^ area topLeft + startPos ]
	].
	^ rect origin
]

{
	#category : #position,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>unoccupiedPositionTopRight [

	| startPos area rect morphs |
	
	startPos := (self width + 10 @ 10 negated).
	area := World clearArea.
	rect := (area topRight - startPos) extent: self extent.
	
	morphs := self activeGrowlMorphs.	
	[self is: rect saneWithRespectTo: morphs] whileFalse: [
		rect := rect translateBy: 0@10.
		rect bottom > area height ifTrue: [^ (area topRight - startPos) ]
	].

	^ rect origin
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>vanishDelay [

	^ vanishDelay
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>vanishDelay: aDuration [

	vanishDelay := aDuration.
	self resetVanishTimer
]

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:13'
}
GrowlMorph>>wantsSteps [
	^ true
]
