"

"
Class {
	#name : #GTSpotterCategoryBrick,
	#superclass : #GLMInteractableBrick,
	#instVars : [
		'listBrick',
		'titleBrick',
		'stepModel',
		'category'
	],
	#category : #GT-Spotter-UI,
	#timestamp : ''
}

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCategoryBrick>>addItem: anItem [
	self addBrickBack: anItem
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCategoryBrick>>addItems: aCollectionOfItems [
	self addAllBricks: aCollectionOfItems
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCategoryBrick>>category [

	^ category
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCategoryBrick>>category: aProcessorClass [

	category := aProcessorClass
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCategoryBrick>>initialize [
	super initialize.
	self
		useVerticalLinearLayout;
		vShrinkWrap;
		initializeListeners;
		enable
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCategoryBrick>>initializeListeners [
	self announcer when: #onMouseHover send: #onHovered to: self. 
	self announcer when: #onMouseUnhover send: #onUnhovered to: self
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCategoryBrick>>on: aStepModel category: aProcessor [

	self stepModel: aStepModel.
	self category: aProcessor.
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCategoryBrick>>onHovered [
	self titleBrick showActionbar
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCategoryBrick>>onUnhovered [
	(self stepModel isCategorySelected: self category)
		ifFalse: [ self titleBrick hideActionbar ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCategoryBrick>>order [
	^ self category order
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCategoryBrick>>privateAddIntoWorld: aBrick [
	super privateAddIntoWorld: aBrick.
	self setAmountVisible: self subbricksCount all: '...'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCategoryBrick>>setAmountVisible: visible all: all [

	self titleBrick setAmountVisible: visible all: all
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCategoryBrick>>stepModel [
	^ stepModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCategoryBrick>>stepModel: anObject [
	stepModel := anObject.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCategoryBrick>>titleBrick [
	^ titleBrick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCategoryBrick>>titleBrick: aBrick [

	titleBrick := aBrick
]
