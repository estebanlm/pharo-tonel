"

"
Class {
	#name : #GTSpotterPaneBrick,
	#superclass : #GLMBrick,
	#instVars : [
		'contentsBrick',
		'previewBrick',
		'arrowBrick'
	],
	#category : #GT-Spotter-UI,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPaneBrick>>arrowBrick [

	^ arrowBrick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPaneBrick>>arrowBrick: aBrick [

	arrowBrick := aBrick.
	self themer spotterThemer spotterPreviewArrowContainerStyleFor: self arrowBrick.
	self addBrickBack: self arrowBrick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPaneBrick>>contentsBrick [

	^ contentsBrick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPaneBrick>>contentsBrick: aBrick [
	
	contentsBrick ifNotNil: [self removeBrick: contentsBrick].
	contentsBrick := aBrick.
		
	self themer spotterThemer spotterContentsStyleFor: contentsBrick.

	self addBrickBack: contentsBrick
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPaneBrick>>hidePreview [

	self isPreviewShown ifFalse: [ ^ self ].

	self removeBrick: self previewBrick.
	self contentsBrick layout hSpaceFill.
	self changed.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPaneBrick>>initialize [
	super initialize.
	
	self contentsBrick: self newContentsBrick.
	self arrowBrick: self newArrowBrick.
	self previewBrick: self newPreviewBrick
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPaneBrick>>isPreviewShown [

	^ self hasSubbrick: self previewBrick
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPaneBrick>>newArrowBrick [

	^ GTSpotterPreviewArrowBrick new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPaneBrick>>newContentsBrick [

	^ GTSpotterContentsBrick new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPaneBrick>>newPreviewBrick [

	^ GTSpotterPreviewBrick new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPaneBrick>>previewBrick [

	^ previewBrick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPaneBrick>>previewBrick: aBrick [

	previewBrick ifNotNil: [self removeBrick: aBrick].
	previewBrick := aBrick.
	
	self themer spotterThemer spotterPreviewStyleFor: previewBrick
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPaneBrick>>showPreview [
	
	self isPreviewShown ifTrue: [ ^ self ].
	
	self addBrickBack: self previewBrick.
	self previewBrick spotterModel ifNotNil: [ :aSpotter |
		aSpotter hasSelected ifTrue: [
			self previewBrick updatePreviewWith: aSpotter currentStep selected candidate ] ].
	
	self contentsBrick hSpaceFill: (100 - self previewBrick layout hPercent).
	self changed.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterPaneBrick>>spotterModel: aSpotter [

	self contentsBrick spotterModel: aSpotter.
	self arrowBrick spotterModel: aSpotter.
	self previewBrick spotterModel: aSpotter
]
