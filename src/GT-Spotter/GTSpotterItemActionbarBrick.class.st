"

"
Class {
	#name : #GTSpotterItemActionbarBrick,
	#superclass : #GLMBrick,
	#instVars : [
		'stepModel',
		'diveInButton',
		'actOnButton',
		'candidateLink'
	],
	#category : #GT-Spotter-UI,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterItemActionbarBrick>>actOnButton [
	^ actOnButton
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterItemActionbarBrick>>addActActionButton [

	actOnButton := (self newActionButtonBrick
			icon: self themer spotterThemer iconAct;
			hintTitle: 'Default action';
			hintText: '<enter>';
			action: [ self owner beSelected. self stepModel actDueTo: #actionButton ];
			yourself).

	self addActionButton: actOnButton.
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterItemActionbarBrick>>addActionButton: anActionButton [

	self themer spotterThemer itemActionButtonStyleFor: anActionButton.
	self themer spotterThemer itemActionButtonWidgetStyleFor: anActionButton.
		
	self addBrickBack: anActionButton.

	self stepModel spotter isShiftPressed
		ifTrue: [ self themer spotterThemer hintRevealStyleFor: anActionButton ].
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterItemActionbarBrick>>addDiveInActionButton [
			
	(self stepModel canDiveIn: self candidate) ifTrue: [
		diveInButton := (self newActionButtonBrick
			icon: self themer spotterThemer iconDiveIn;
			hintTitle: 'Dive in';
			hintText: '<',OSPlatform current defaultModifier name asLowercase,'+right>';
			action: [ self owner beSelected. self stepModel diveInDueTo: #actionButton ];
			yourself).
		
		self addActionButton: diveInButton ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterItemActionbarBrick>>candidate [

	^ self candidateLink value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterItemActionbarBrick>>candidateLink [
	^ candidateLink
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterItemActionbarBrick>>candidateLink: anObject [
	candidateLink := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterItemActionbarBrick>>diveInButton [
	^ diveInButton
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterItemActionbarBrick>>hasStepModel [
	^ stepModel isNotNil
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterItemActionbarBrick>>newActionButtonBrick [

	^ GLMHintableActionButtonBrick new
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterItemActionbarBrick>>onHideHints [

	self visible ifFalse: [ ^ self ].
	self themer spotterThemer hintHideStyleFor: self diveInButton.
	self themer spotterThemer hintHideStyleFor: self actOnButton.
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterItemActionbarBrick>>onRevealHints [

	self visible ifFalse: [ ^ self ].
	self themer spotterThemer hintRevealStyleFor: self diveInButton.
	self themer spotterThemer hintRevealStyleFor: self actOnButton
]

{
	#category : #brick-properties-events,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterItemActionbarBrick>>onThemerChanged [
	super onThemerChanged.
	
	self themer spotterThemer itemActionbarStyleFor: self.
	self subbricks do: [ :aBrick | self themer spotterThemer itemActionButtonWidgetStyleFor: aBrick ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterItemActionbarBrick>>stepModel [
	^ stepModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterItemActionbarBrick>>stepModel: anObject [
	stepModel := anObject.
	
	self stepModel spotter announcer when: GTSpotterRevealHints send: #onRevealHints to: self.
	self stepModel spotter announcer when: GTSpotterHideHints send: #onHideHints to: self.
	
	self
		addActActionButton;
		addDiveInActionButton
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterItemActionbarBrick>>toggleHints [

	self visible ifFalse: [ ^ self ].
	self stepModel spotter isShiftPressed
		ifTrue: [ self onRevealHints ]
		ifFalse: [ self onHideHints ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterItemActionbarBrick>>visible: aBoolean [
	super visible: aBoolean.
	
	self toggleHints
	
	
]
