"
A RadioButtonModel is a spec model for RadioButton.
See AbstractFormButtonModel

self example

! The method privateSetState: is really private and should only be used by RadioButtonGroup or RadioButtonGroupModel !

You can also have a look at RadioButtonGroupExample for a full example of how to use them with a group.

I provide more accessors on my super class ValueHolder
- actionWhenActivatedHolder
- actionWhenDeactivatedHolder
- enabledHolder
- stateHolder

I provide the variable canDeselectByClick and its accessors, it is a boolean representing if the radio can be deselect directly by the user using a click on it.

I specialize state: to use the variable canDeselectByClick.
"
Class {
	#name : #RadioButtonModel,
	#superclass : #AbstractFormButtonModel,
	#instVars : [
		'canDeselectByClick'
	],
	#category : #Spec-Core-Widgets
}

{ #category : #specs }
RadioButtonModel class >> adapterName [

	^ #RadioButtonAdapter
]

{ #category : #specs }
RadioButtonModel class >> defaultSpec [
	<spec: #default>
	
	^ #(RadioButtonAdapter
		adapt: #(model))
]

{ #category : #specs }
RadioButtonModel class >> title [

	^ 'Radio Button'
]

{ #category : #accessing }
RadioButtonModel >> actionWhenActivatedHolder [
	
	^ actionWhenActivatedHolder
]

{ #category : #accessing }
RadioButtonModel >> actionWhenDeactivatedHolder [
	
	^ actionWhenDeactivatedHolder
]

{ #category : #protocol }
RadioButtonModel >> canDeselectByClick [
	<api: #inspect>
	"Return true clicking on a selected radio button deselects it"

	^ canDeselectByClick value
]

{ #category : #protocol }
RadioButtonModel >> canDeselectByClick: aBoolean [
	<api: #boolean getter: #canDeselectByClick registration: #whenCanDeselectByClickChanged>
	"Set if clicking on a selected radio button can deselect it"
	
	canDeselectByClick value: aBoolean
]

{ #category : #initialization }
RadioButtonModel >> initialize [
	super initialize.
	canDeselectByClick := false asValueHolder.
]

{ #category : #private }
RadioButtonModel >> privateSetState: aBoolean [
	"Should only be used by RadioButtonGroup"
	
	stateHolder value: aBoolean.
	self changed: #state
]

{ #category : #protocol }
RadioButtonModel >> state: aBoolean [
	"Set if the radio is activated or not"

	<api: #boolean getter: #state>
	self canDeselectByClick
		ifTrue: [ stateHolder value: aBoolean ]
		ifFalse: [ self state
				ifFalse: [ stateHolder value: aBoolean ] ]
]

{ #category : #accessing }
RadioButtonModel >> stateHolder [
	
	^ stateHolder
]

{ #category : #protocol-events }
RadioButtonModel >> whenCanDeselectByClickChanged: aBlock [
	"This method is triggered when `canDeselectByClick` changes"
	
	canDeselectByClick whenChangedDo: aBlock
]
