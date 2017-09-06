"
An OkCancelToolbar is a model for a basic Ok toolbar
"
Class {
	#name : #OkToolbar,
	#superclass : #ComposableModel,
	#instVars : [
		'okButton',
		'okAction'
	],
	#category : #Spec-Core-Support,
	#timestamp : '<historical>'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
OkToolbar class>>defaultSpec [
	<spec>
	
	^ SpecLayout composed
		add: #okButton origin: 1@0 corner: 1@1 offsetOrigin: (self buttonWidth negated)@0 offsetCorner: 0@0;
		send: #vShrinkWrap;
		yourself
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
OkToolbar class>>title [

	^ 'Ok Toolbar'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
OkToolbar>>addAll: aWindow  withSpec: aSpec [

	aWindow
		addMorph: (self buildWithSpec: aSpec)
		fullFrame: ((0@0 corner: 1@0) asLayoutFrame bottomOffset: 30).
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
OkToolbar>>cancel [
	
	owner 
		ifNil: [ self delete ] 
		ifNotNil: [ owner delete ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
OkToolbar>>hFill [

	^ Morph new
		color: Color transparent;
		height: 0;
		vResizing: #rigid;
		hResizing: #spaceFill
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
OkToolbar>>initialize [

	super initialize.
	okAction := [ true ] asValueHolder.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
OkToolbar>>initializePresenter [

	okButton action: self okActionBlock
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
OkToolbar>>initializeWidgets [
	
	
	okButton := self newButton.
	self registerOkButtonEvents.
	
	self focusOrder
		add: okButton
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
OkToolbar>>okAction [

	^ okAction value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
OkToolbar>>okAction: aBlock [

	^ okAction value: aBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
OkToolbar>>okActionBlock [

	^ [ okAction value value == false
		ifFalse: [ owner 
			ifNil: [ self delete ] 
			ifNotNil: [ owner delete ] ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
OkToolbar>>okButton [

	^ okButton
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
OkToolbar>>registerOkButtonEvents [

	okButton 
		label: 'Ok';
		enabled: true;
		state: false
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
OkToolbar>>triggerCancelAction [
	
	self cancel
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
OkToolbar>>triggerOkAction [

	self okActionBlock value
]
