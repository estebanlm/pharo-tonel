"
A SliderModel is a spec model for a slider.
See AbstractWidgetModel

self example

I provide the following variables and their accessors
- max is the maximum of the slide.
- min is the minimum of the slide.
- value is the value of the slide, it is between the maximum and the minimum
- absoluteValue is the value of the slide in a percent of the maximum.
- label is the label in the background.

I provide the following methods
- color: to set the background color, it must be called after have displayed the widget.

todo
- quantum

"
Class {
	#name : #SliderModel,
	#superclass : #AbstractWidgetModel,
	#instVars : [
		'max',
		'min',
		'quantum',
		'value',
		'isSetting',
		'isChanging',
		'absoluteValue',
		'labelHolder'
	],
	#category : #Spec-Core-Widgets
}

{ #category : #specs }
SliderModel class >> adapterName [

	^ #SliderAdapter
]

{ #category : #specs }
SliderModel class >> defaultSpec [
	<spec: #default>
	
	^ #(SliderAdapter
		adapt: #(model))
]

{ #category : #specs }
SliderModel class >> example [
	| slider |
	slider := self new.
	slider
		min: 0;
		max: 100;
		whenValueChangedDo: [ :value | slider label: value asString ].
	slider openWithSpec.
	^ slider 
]

{ #category : #api }
SliderModel >> absoluteValue [
	"<api: #inspect>"
	"Return the position of the slider in a scale between 0 and 1 despite of the min and max value"
	^ absoluteValue value
]

{ #category : #api }
SliderModel >> absoluteValue: aFloat [
	"<api: #float min: 0 max: 1 getter:#absoluteValue registration: #whenAbsoluteValueChanged:>"
	"Set the position of the slider in a scale between 0 and 1 despite of the min and max value"

	absoluteValue value: aFloat
]

{ #category : #api }
SliderModel >> color: aColor [

	"Hack because during the interpretation, the state is slightly inconistent"
	self widget ifNotNil: [:w | w == self ifFalse: [ super color: aColor ]]
]

{ #category : #initialization }
SliderModel >> initialize [

	super initialize.
	max := 100 asValueHolder.
	min := 0 asValueHolder.
	quantum := 1 asValueHolder.
	value := 0 asValueHolder.
	absoluteValue := 0 asValueHolder.
	labelHolder := '' asValueHolder.
	isChanging := false.
	
	max whenChangedDo: [:m | self changed: { #max: . m } ].
	min whenChangedDo: [:m | self changed: { #min: . m } ].
	quantum whenChangedDo: [:m | self changed: { #quantum: . m } ].
	
	value whenChangedDo: [:v |
		isChanging ifFalse: [
			isChanging := true.
			self absoluteValue: ((v-self min)/(self max-self min)).
			self changed: { #scaledValue: . v }.
			isChanging := false ].
		self changed: #value.].
	
	absoluteValue whenChangedDo: [:v | 
		isChanging ifFalse: [
			isChanging := true.
			self value: (self min+(v*(self max-self min)) roundTo: self quantum).
			self changed: { #value: . v }.
			isChanging := false ]].
	
	labelHolder whenChangedDo: [:v | self changed: #label ].
]

{ #category : #api }
SliderModel >> label [
	"<api: #inspect>"
	"Return the label of the slider"

	^ labelHolder value
]

{ #category : #api }
SliderModel >> label: aString [
	"<api: #string getter: #label registration: #whenLabelChanged:>"
	"Set the label of the slider"
	
	labelHolder value: aString
]

{ #category : #api }
SliderModel >> max [
	"<api: #inspect>"
	"Return the maximun value"
	
	^ max value
]

{ #category : #api }
SliderModel >> max: anObject [
	"<api: #integer min: 1 max: 100 getter:#max registration: #whenMaxChanged:>"
	"Set the maximun value"

	max value: anObject
]

{ #category : #api }
SliderModel >> min [
	"<api: #inspect>"
	"Return the minimum value"
	
	^ min value
]

{ #category : #api }
SliderModel >> min: anObject [
	"<api: #integer min: 0 max: 99 getter:#min registration: #whenMinChanged:>"
	"Set the minimum value"
	
	min value: anObject
]

{ #category : #api }
SliderModel >> quantum [
	"<api: #inspect>"
	"Return the quantum betwen values"

	^ quantum value
]

{ #category : #api }
SliderModel >> quantum: aNumber [
	"<api: #integer min: #min max: #max getter:#quantum registration: #whenQuantumChanged:>"
	"Set the quantum betwen values"

	quantum value: aNumber
]

{ #category : #api }
SliderModel >> reset [
	"<api:#do>"
	"Reset the cursor to the minimum value"
	
	self value: self min
]

{ #category : #api }
SliderModel >> value [
	"<api: #inspect>"
	"Return the current value in a range between min and max"

	^ value value
]

{ #category : #api }
SliderModel >> value: aNumber [
	"<api: #integer min: #min max: #max getter:#value registration: #whenValueChanged:>"
	"Set the value in a range between min and max"
	
	value value == aNumber ifTrue: [ ^ self ].
	value value: aNumber.
]

{ #category : #api-events }
SliderModel >> whenAbsoluteValueChangedDo: aBlock [
	"Block performed when the absolute value changed"

	absoluteValue whenChangedDo: aBlock
]

{ #category : #api-events }
SliderModel >> whenLabelChangedDo: aBlock [
	"Block performed when the label changed"

	labelHolder whenChangedDo: aBlock
]

{ #category : #api-events }
SliderModel >> whenMaxChangedDo: aBlock [ 
	"Block performed when the maximum value changed"

	max whenChangedDo: aBlock
]

{ #category : #api-events }
SliderModel >> whenMinChangedDo: aBlock [ 
	"Block performed when the minimum value changed"

	min whenChangedDo: aBlock
]

{ #category : #api-events }
SliderModel >> whenQuantumChangedDo: aBlock [ 
	"Block performed when the quantum value changed"

	quantum whenChangedDo: aBlock
]

{ #category : #api-events }
SliderModel >> whenValueChangedDo: aBlock [ 
	"Block performed when the value changed"

	value whenChangedDo: aBlock
]
