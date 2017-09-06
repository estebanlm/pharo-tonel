"
AbstractFormButtonModel is an abstract class for button of form (like radiobuttons or checkbox).
See AbstractWidgetModel

self example

I provide the following variables and their accessors
- activationAction and desactivationAction are actions to perform when I am activeted / desactivated.
- label is the text displayed near the box.
- state is a boolean representing if I am activated, it is false by default

I provide the following methods
- click to simulate a click on me.
- toggleState to reverse my state.

"
Class {
	#name : #AbstractFormButtonModel,
	#superclass : #AbstractWidgetModel,
	#instVars : [
		'actionWhenActivatedHolder',
		'stateHolder',
		'labelClickableHolder',
		'labelHolder',
		'actionWhenDeactivatedHolder'
	],
	#category : #Spec-Core-Widgets-Support,
	#timestamp : 'Spirita 6/29/2016 11:11'
}

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractFormButtonModel>>activationAction: aBlock [
	"<api: #block getter: #activationAction registration: #whenActivationActionChanged:>"
	"This method is used to set the action to perform when I am activated"
	
	actionWhenActivatedHolder value: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractFormButtonModel>>click [
	"<api: #do>"
	"Simulate a click on the checkbox
	Used when the checkboc is a list item"

	self toggleState
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractFormButtonModel>>deactivationAction: aBlock [
	"<api: #block getter: #desactivationAction registration: #whenDeactivationActionChanged:>"
	"This method is used to set the action to perform when I am deactivated"
	
	actionWhenDeactivatedHolder value: aBlock
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractFormButtonModel>>initialize [

	super initialize.
	actionWhenActivatedHolder := [] asValueHolder.
	actionWhenDeactivatedHolder := [] asValueHolder.
	enabledHolder := true asValueHolder.
	stateHolder := false asValueHolder.
	labelClickableHolder := true asValueHolder. 
	labelHolder := '' asValueHolder.
	stateHolder whenChangedDo: [:bool |
		bool
			ifTrue: actionWhenActivatedHolder value
			ifFalse: actionWhenDeactivatedHolder value.
		self changed: #state ].
	
	labelClickableHolder whenChangedDo: [:aBoolean | self changed: { #labelClickable: . aBoolean } ].
	labelHolder whenChangedDo: [:label | self changed: { #label: . label } ].
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractFormButtonModel>>label [
	"<api: #inspect>"
	^ labelHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractFormButtonModel>>label: aString [
	"<api: #string getter: #label>"
	"Set the label of the checkbox"

	labelHolder value: aString
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractFormButtonModel>>labelClickable [
"	<api: #inspect>"
	"Return true if the label can be clicked to select the checkbox"

	^ labelClickableHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractFormButtonModel>>labelClickable: aBoolean [
	"<api: #boolean getter: #labelClickable registration: #whenLabelClickableChanged:>"
	"Set if the label can be clicked to select the checkbox"
	
	labelClickableHolder value: aBoolean
]

{
	#category : #api-valueHolder,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractFormButtonModel>>labelHolder [

	^ labelHolder
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractFormButtonModel>>state [
	"<api: #inspect>"

	"Return the current state of the form button"

	^ stateHolder value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractFormButtonModel>>state: aBoolean [
	"Set if the checkbox is activated or not"
	"<api: #boolean getter: #state>"
	stateHolder value: aBoolean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractFormButtonModel>>toggleState [
	"<api: #do>"
	"Toogle the current state of the checkbox"

	self state: self state not
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractFormButtonModel>>whenActivatedDo: aBlock [
	"This method is used to propagate the event that I have been activated" 
	
	stateHolder whenChangedDo: [:bool | bool ifTrue: aBlock ]
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractFormButtonModel>>whenActivationActionChanged: aBlock [
	"A block performed when the activation action changed"
	actionWhenActivatedHolder whenChangedDo: aBlock 
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractFormButtonModel>>whenChangedDo: aBlock [
	"This method is used to propagate the event that I have changed"
	
	stateHolder whenChangedDo: aBlock
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractFormButtonModel>>whenDeactivatedDo: aBlock [
	"This method is used to propagate the event that I have been deactivated"
	
	stateHolder whenChangedDo: [:bool | bool ifFalse: aBlock ]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractFormButtonModel>>whenDeactivationActionChanged: aBlock [
	"A block performed when the deactivation action changed"
	actionWhenDeactivatedHolder whenChangedDo:  aBlock 
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractFormButtonModel>>whenLabelClickableChanged: aBlock [
	"A block performed when the label click is activated or descativated"
	
	labelClickableHolder whenChangedDo:  aBlock 
]
