"
I am an elementary Spec Widget managing a slider and an input.

Self example

Between the bounds min and max of the slider, I ensure that the value of the input on the accept and the value of the slider are the same.

Note
====
- min and max must be set before use me.
- if autoAccept is true, the character '-' could create problems
"
Class {
	#name : #SliderInput,
	#superclass : #ComposableModel,
	#instVars : [
		'slider',
		'input'
	],
	#category : #Spec-PolyWidgets-Elementary,
	#timestamp : 'Spirita 7/21/2016 18:06'
}

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:19'
}
SliderInput class>>example [
	| example |
	example := self new
		min: 0;
		max: 250;
		autoAccept: true;
		value: 120;
		extent: 400 @ 50;
		title: 'SliderInput example';
		openWithSpec.
	^ example
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:19'
}
SliderInput class>>sliderBottom [
	<spec>
	^ SpecLayout composed
		newColumn: [ :column | 
			column
				add: #input origin: 0 @ 0 corner: 1 @ 0.15;
				add: #slider origin: 0 @ 0.15 corner: 1 @ 1 ];
		yourself
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:19'
}
SliderInput class>>sliderLeft [
	<spec: #default>
	^ SpecLayout composed
		newRow: [ :row | 
			row
				add: #slider origin: 0 @ 0 corner: 0.85 @ 1;
				add: #input origin: 0.85 @ 0 corner: 1 @ 1 ];
		yourself
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:19'
}
SliderInput class>>sliderRight [
	<spec>
	^ SpecLayout composed
		newRow: [ :row | 
			row
				add: #input origin: 0 @ 0 corner: 0.15 @ 1;
				add: #slider origin: 0.15 @ 0 corner: 1 @ 1 ];
		yourself
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:19'
}
SliderInput class>>sliderTop [
	<spec>
	^ SpecLayout composed
		newColumn: [ :column | 
			column
				add: #slider origin: 0 @ 0 corner: 1 @ 0.85;
				add: #input origin: 0 @ 0.85 corner: 1 @ 1 ];
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
SliderInput>>autoAccept [
	^ input autoAccept
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
SliderInput>>autoAccept: aBoolean [
	
	input autoAccept: aBoolean
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
SliderInput>>initializePresenter [
	slider
		whenValueChangedDo: [ :sliderValue | 
			| inputValue |
			inputValue := input text asNumber. " ifNotNil: [ :text | text asNumber ]"
			sliderValue == inputValue
				ifFalse: [ input text: sliderValue asString ] ].
	input
		whenTextChanged: [ :text | 
			| inputValue |
			inputValue := text asNumber.
			slider value == inputValue
				ifFalse: [ slider value: inputValue ] ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
SliderInput>>initializeWidgets [
	slider := self instantiate: SliderModel.
	input := self instantiate: TextInputFieldModel.
	self focusOrder add: input
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
SliderInput>>input [
	^ input
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
SliderInput>>label [
	^ slider label
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
SliderInput>>label: aString [
	slider label: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
SliderInput>>max: aNumber [
	slider max: aNumber
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
SliderInput>>min: aNumber [
	slider min: aNumber.
	input text: aNumber asString 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
SliderInput>>slider [
	^ slider
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
SliderInput>>value [
	^ slider value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
SliderInput>>value: aNumber [
	slider value: aNumber 
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:19'
}
SliderInput>>whenValueChangedDo: aBlock [
	slider whenValueChangedDo: aBlock
]
