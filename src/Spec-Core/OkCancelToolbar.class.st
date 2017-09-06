"
An OkCancelToolbar is a model for a basic Ok-Cancel toolbar
"
Class {
	#name : #OkCancelToolbar,
	#superclass : #OkToolbar,
	#instVars : [
		'cancelButton',
		'cancelAction',
		'cancelled'
	],
	#category : #Spec-Core-Support,
	#timestamp : '<historical>'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
OkCancelToolbar class>>defaultSpec [
	<spec>
	
	^ SpecLayout composed
		add: #okButton origin: 1@0 corner: 1@1 offsetOrigin: (2*(self buttonWidth negated))@0 offsetCorner: (self buttonWidth negated)@0;
		add: #cancelButton origin: 1@0 corner: 1@1 offsetOrigin: (self buttonWidth negated)@0 offsetCorner: 0@0;
		send: #vShrinkWrap;
		yourself
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
OkCancelToolbar class>>title [

	^ 'Ok Cancel'
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
OkCancelToolbar>>cancel [

	self cancelled: true
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
OkCancelToolbar>>cancelAction [

	^ cancelAction value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
OkCancelToolbar>>cancelAction: aBlock [

	^ cancelAction value: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
OkCancelToolbar>>cancelButton [

	^ cancelButton
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
OkCancelToolbar>>cancelled [

	^ cancelled value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
OkCancelToolbar>>cancelled: aBoolean [

	cancelled value: aBoolean
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
OkCancelToolbar>>initialize [

	cancelled := false asValueHolder.
	cancelAction := [ true ] asValueHolder.
	super initialize.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
OkCancelToolbar>>initializePresenter [

	super initializePresenter.
	cancelButton action: [ self performCancelAction ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
OkCancelToolbar>>initializeWidgets [

	super initializeWidgets.
	cancelButton := self newButton.

	self registerCancelButtonEvents.
	self focusOrder
		add: cancelButton
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
OkCancelToolbar>>performCancelAction [

	^ cancelAction value value == false
		ifFalse: [ 
			cancelled value: true.
			owner ifNil: [ self delete ] ifNotNil: [ owner delete ] ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
OkCancelToolbar>>registerCancelButtonEvents [

	cancelButton 
		label: 'Cancel';
		enabled: true;
		state: false
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
OkCancelToolbar>>triggerCancelAction [

	self performCancelAction
]
