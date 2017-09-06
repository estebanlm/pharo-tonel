"

"
Class {
	#name : #GTSpotterContentsBrick,
	#superclass : #GLMBrick,
	#instVars : [
		'headerBrick',
		'dropDownBrick',
		'spotterModel'
	],
	#category : #GT-Spotter-UI,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContentsBrick>>dropDownBrick [
	^ dropDownBrick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContentsBrick>>dropDownBrick: aBrick [
	dropDownBrick ifNotNil: [self removeBrick: dropDownBrick].
	dropDownBrick := aBrick asBrick.
	
	dropDownBrick morph pagerModel: self spotterModel pagerModel.
	self themer spotterThemer dropDownPaneStyleFor: dropDownBrick.
	
	self addBrickBack: dropDownBrick
	"aBrick openInWindow"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContentsBrick>>headerBrick [
	^ headerBrick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContentsBrick>>headerBrick: aBrick [
	
	headerBrick ifNotNil: [self removeBrick: headerBrick].
	headerBrick := aBrick.
	
	self themer spotterThemer headerStyleFor: headerBrick.
	
	self addBrickBack: headerBrick
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContentsBrick>>initialize [
	super initialize.
		
	self headerBrick: self newHeaderBrick.

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContentsBrick>>isDropDownPaneVisible [

	^ self dropDownBrick isNotNil
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContentsBrick>>newDropDownMorph [

	^ GTSpotterDropDownMorph new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContentsBrick>>newHeaderBrick [

	^ GTSpotterHeaderBrick new
]

{
	#category : #events-processing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContentsBrick>>onStepAdded [
	"as soon as step added I need to show drop down pane"
	self isDropDownPaneVisible ifTrue: [ ^ self ].
	
	self showDropDownPane
]

{
	#category : #brick-properties-events,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContentsBrick>>onThemerChanged [
	super onThemerChanged.
	
	self themer spotterThemer spotterContentsWidgetStyleFor: self
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContentsBrick>>showDropDownPane [

	self dropDownBrick: self newDropDownMorph.
	self dropDownBrick spotterModel: self spotterModel.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContentsBrick>>spotterModel [

	^ spotterModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterContentsBrick>>spotterModel: aModel [

	spotterModel := aModel.
	self headerBrick spotterModel: spotterModel.
	
	spotterModel steps isEmpty ifFalse: [ spotterModel currentStep hasCandidates ifTrue: [ self showDropDownPane ] ].

	spotterModel announcer when: GTSpotterStepAdded send: #onStepAdded to: self.
]
