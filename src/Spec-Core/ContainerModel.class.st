"
I am a model for a container. My purpose is to hold multiple subwidgets to glue them together.


I should not be used directly
"
Class {
	#name : #ContainerModel,
	#superclass : #AbstractWidgetModel,
	#category : #Spec-Core-Support
}

{ #category : #specs }
ContainerModel class >> adapterName [

	^ #ContainerAdapter
]

{ #category : #specs }
ContainerModel class >> defaultSpec [
	<spec>
	
	^ #(ContainerAdapter
		adapt: #(model))
]

{ #category : #api }
ContainerModel >> buildAdapterWithSpec [
	"Build the widget using the spec name provided as argument"
	| adapter widget aSpecLayout |	
	aSpecLayout := (self retrieveSpec: self defaultSpecSelector).
	adapter := SpecInterpreter 
		private_interpretASpec: aSpecLayout
		model: self
		selector: self defaultSpecSelector.
	widget := adapter widget.
	self setExtentAndBindingTo: widget. 
	^ adapter
]

{ #category : #api-focus }
ContainerModel >> eventKeyStrokesForNextFocus [
	"String describing the keystroke to perform to jump to the next widget"

	^ keyStrokesForNextFocusHolder value
]

{ #category : #api-focus }
ContainerModel >> eventKeyStrokesForPreviousFocus [
	"String describing the keystroke to perform to jump to the previous widget"

	^ keyStrokesForPreviousFocusHolder value
]

{ #category : #testing }
ContainerModel >> isSpecContainer [
	^ true
]
