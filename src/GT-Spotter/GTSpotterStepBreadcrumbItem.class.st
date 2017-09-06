"

"
Class {
	#name : #GTSpotterStepBreadcrumbItem,
	#superclass : #GLMInteractableBrick,
	#instVars : [
		'labelBrick',
		'triangleBrick',
		'stepModel',
		'isTriangleVisible'
	],
	#category : #GT-Spotter-UI,
	#timestamp : ''
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStepBreadcrumbItem>>click: evt [
	super click: evt.
	
	self stepModel spotter popUntil: self stepModel.
	^ true
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStepBreadcrumbItem>>deselect [
	
	self invalidateWith: [
		self labelBrick label customFont; beRegular ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStepBreadcrumbItem>>hideTriangle [

	isTriangleVisible := false.
	self themer spotterThemer breadcrumbItemTriangleWidgetStyleFor: self triangleBrick
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStepBreadcrumbItem>>initialize [
	super initialize.
	
	self
		useVerticalLinearLayout;
		labelBrick: self newLabelBrick;
		triangleBrick: self newTriangleBrick;
		enable
	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStepBreadcrumbItem>>isTriangleVisible [

	^ isTriangleVisible ifNil: [ isTriangleVisible := true ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStepBreadcrumbItem>>labelBrick [

	^ labelBrick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStepBreadcrumbItem>>labelBrick: aBrick [

	labelBrick := aBrick.
	
	self themer spotterThemer breadcrumbItemLabelStyleFor: self labelBrick.
	self addBrickBack: self labelBrick
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStepBreadcrumbItem>>newLabelBrick [

	^ GLMLabelBrick new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStepBreadcrumbItem>>newTriangleBrick [

	^ GLMBrick new
]

{
	#category : #brick-properties-events,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStepBreadcrumbItem>>onThemerChanged [
	super onThemerChanged.
	
	self themer spotterThemer breadcrumbItemLabelWidgetStyleFor: self labelBrick.
	self themer spotterThemer breadcrumbItemTriangleWidgetStyleFor: self triangleBrick
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStepBreadcrumbItem>>select [
	
	self invalidateWith: [
		self labelBrick label customFont; beBold ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStepBreadcrumbItem>>showTriangle [

	isTriangleVisible := true.
	self themer spotterThemer breadcrumbItemTriangleWidgetStyleFor: self triangleBrick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStepBreadcrumbItem>>stepModel [
	^ stepModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStepBreadcrumbItem>>stepModel: anObject [
	stepModel := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStepBreadcrumbItem>>text: aString [

	self labelBrick text: aString.
	self doLayoutForce
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStepBreadcrumbItem>>triangleBrick [

	^ triangleBrick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStepBreadcrumbItem>>triangleBrick: aBrick [

	triangleBrick := aBrick.
	
	self themer spotterThemer breadcrumbItemTriangleStyleFor: self triangleBrick.
	self addBrickBack: self triangleBrick
]
