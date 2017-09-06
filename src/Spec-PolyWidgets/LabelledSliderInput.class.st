"
I am a LabelledContainer specialized to manage a SliderInput.
See LabelledContainer

self example

I provide the accessors sliderInput to be more intuitive than subwidget, and the shortcuts input and slider.

I provide shortcuts for the most common methods to avoid the use of the DoesNotUnderstand or the writing of long chain of accessors.
"
Class {
	#name : #LabelledSliderInput,
	#superclass : #LabelledContainer,
	#category : #Spec-PolyWidgets-Labelled,
	#timestamp : 'Spirita 8/1/2016 11:11'
}

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledSliderInput class>>example [
	| example |
	example := self new
		min: 0;
		max: 250;
		autoAccept: true;
		value: 120;
		extent: 400 @ 50;
		title: 'LabelledSliderInput example';
		openWithSpec.
	^ example
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledSliderInput>>absoluteValue [
	^ self sliderInput absoluteValue
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledSliderInput>>absoluteValue: aBoolean [
	^ self sliderInput absoluteValue: aBoolean
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledSliderInput>>autoAccept [
	^ self sliderInput autoAccept
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledSliderInput>>autoAccept: aBoolean [
	^ self sliderInput autoAccept: aBoolean
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledSliderInput>>initializeWidgets [
	super initializeWidgets.
	self content: SliderInput 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledSliderInput>>input [
	^ subwidget input
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledSliderInput>>max: aNumber [
	^ self sliderInput max: aNumber
]

{
	#category : #api-shortcuts,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledSliderInput>>min: aNumber [
	^ self sliderInput min: aNumber
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledSliderInput>>slider [
	^ subwidget slider
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledSliderInput>>sliderInput [
	^ subwidget
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledSliderInput>>value [
	^ self sliderInput value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledSliderInput>>value: aNumber [
	^ self sliderInput value: aNumber
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:19'
}
LabelledSliderInput>>whenValueChangedDo: aBlock [
	self sliderInput whenValueChangedDo: aBlock
]
