"

"
Class {
	#name : #GTSpotterPreviewArrowBrick,
	#superclass : #GLMBrick,
	#instVars : [
		'triangleBrick',
		'selectedItemBrick',
		'spotterModel',
		'isTriangleVisible'
	],
	#category : #GT-Spotter-UI,
	#timestamp : ''
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPreviewArrowBrick>>hideTriangle [

	isTriangleVisible := false.
	self themer spotterThemer spotterPreviewArrowWidgetStyleFor: self triangleBrick.
	self changed
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPreviewArrowBrick>>initialize [
	super initialize.
	
	self triangleBrick: self newTriangleBrick
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPreviewArrowBrick>>isTriangleVisible [

	^ isTriangleVisible ifNil: [ isTriangleVisible := false ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPreviewArrowBrick>>moveTo: anItemBrick [
	|itemBounds delta selfBounds|
	anItemBrick ifNil: [ ^ self ].
	
	itemBounds := anItemBrick globalBounds.
	selfBounds := self globalBounds.
	
	delta := ((itemBounds top - selfBounds top) max: 0) min: (selfBounds height - self triangleBrick height).
	self triangleBrick brickBounds top = delta ifTrue: [ ^ self ].
	
	self triangleBrick marginTop: delta.
	self triangleBrick doLayoutForce.
	self owner changed
	
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPreviewArrowBrick>>newTriangleBrick [

	^ GLMHintableActionButtonBrick new
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPreviewArrowBrick>>onAllCandidatesRemoved [

	self selectedItemBrick: nil
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPreviewArrowBrick>>onCandidateMoved [

	self moveTo: self selectedItemBrick
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPreviewArrowBrick>>onCandidateSelected: ann [

	self selectedItemBrick: ann itemBrick.
	self moveTo: self selectedItemBrick
]

{
	#category : #brick-drawing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPreviewArrowBrick>>onDraw: aCanvas [
	super onDraw: aCanvas.
	
		aCanvas
			fillRectangle: ((self brickBounds withWidth: self themer spotterThemer outerBorderWidth) translateBy: (self themer scrollbarWidth + self themer scrollbarOffset + 1)@0)
			color: (self spotterModel isPreviewVisible
				ifTrue: [ self themer spotterThemer backgroundColor ]
				ifFalse: [ Color transparent ])
	
	
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPreviewArrowBrick>>onHideHints [

	self themer spotterThemer hintHideArrowStyleFor: self triangleBrick
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPreviewArrowBrick>>onHidePreview [

	self triangleBrick renderer border: self themer spotterThemer outerBorderWidth.
	self triangleBrick selectedColor: Color transparent.
	self changed
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPreviewArrowBrick>>onRevealHints [

	self themer spotterThemer hintRevealArrowStyleFor: self triangleBrick
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPreviewArrowBrick>>onShowPreview [

	self triangleBrick renderer border: 0.
	self triangleBrick selectedColor: self themer spotterThemer borderColor.
	self changed
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPreviewArrowBrick>>onStepAdded [
	
	self selectedItemBrick: nil.
	self spotterModel steps last candidates announcer when: GTSpotterAllCandidatesRemoved send: #onAllCandidatesRemoved to: self.
]

{
	#category : #brick-properties-events,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPreviewArrowBrick>>onThemerChanged [
	super onThemerChanged.
	
	self themer spotterThemer spotterPreviewArrowWidgetStyleFor: self triangleBrick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPreviewArrowBrick>>selectedItemBrick [
	
	^ selectedItemBrick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPreviewArrowBrick>>selectedItemBrick: aBrick [
	
	selectedItemBrick isNil & aBrick isNotNil ifTrue: [ self showTriangle ].
	selectedItemBrick isNotNil & aBrick isNil ifTrue: [ self hideTriangle ].
	
	selectedItemBrick := aBrick
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPreviewArrowBrick>>showTriangle [

	isTriangleVisible := true.
	self themer spotterThemer spotterPreviewArrowWidgetStyleFor: self triangleBrick.
	self changed
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPreviewArrowBrick>>spotterModel [

	^ spotterModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPreviewArrowBrick>>spotterModel: aSpotterModel [

	spotterModel := aSpotterModel.
	
	self spotterModel announcer when: GTSpotterCandidateSelected send: #onCandidateSelected: to: self.
	self spotterModel announcer when: GTSpotterCandidateSelectedMoved send: #onCandidateMoved to: self.
	self spotterModel announcer when: GTSpotterStepAdded send: #onStepAdded to: self.
	self spotterModel announcer when: GTSpotterShowPreview send: #onShowPreview to: self.
	self spotterModel announcer when: GTSpotterHidePreview send: #onHidePreview to: self.
	
	self spotterModel announcer when: GTSpotterRevealHints send: #onRevealHints to: self.
	self spotterModel announcer when: GTSpotterHideHints send: #onHideHints to: self.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPreviewArrowBrick>>triangleBrick [

	^ triangleBrick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPreviewArrowBrick>>triangleBrick: aBrick [

	triangleBrick := aBrick.
	self triangleBrick
		hintTitle: 'Toggle preview';
		hintText: '<',OSPlatform current defaultModifier name asLowercase,'+p>';
		action: [ self spotterModel togglePreview ].
	self themer spotterThemer spotterPreviewArrowStyleFor: self triangleBrick.
	self addBrickBack: self triangleBrick
	
]
