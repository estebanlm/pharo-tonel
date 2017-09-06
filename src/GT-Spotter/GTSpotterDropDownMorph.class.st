"

"
Class {
	#name : #GTSpotterDropDownMorph,
	#superclass : #GLMPagerBrick,
	#instVars : [
		'spotterModel'
	],
	#category : #GT-Spotter-UI,
	#timestamp : ''
}

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterDropDownMorph>>buildPane: aStepModel [
	|pane|
	
	pane := GTSpotterResultsBrick new stepModel: aStepModel.
	self brickThemer spotterThemer resultsPaneStyleFor: pane.
	^ pane
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterDropDownMorph>>initialize [
	super initialize.
	
	self showScrollBarWhenNeeded: false
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterDropDownMorph>>onStepAdded: ann [
	"as soon as step added we need to push it"

	self pushPane: (self buildPane: ann stepModel)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterDropDownMorph>>spotterModel [
	^ spotterModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterDropDownMorph>>spotterModel: aModel  [
	spotterModel := aModel.
	
	spotterModel steps do: [ :each | self pushPane: (self buildPane: each) ].
	
	spotterModel announcer when: GTSpotterStepAdded send: #onStepAdded: to: self.
]
