"
GLMFormatedPresentation is an abstract presentation that offers a format block to be used for formatting the rendering of the presentation. The renderer will use the formatDisplayValueOf: method.
"
Class {
	#name : #GLMFormatedPresentation,
	#superclass : #GLMPresentation,
	#instVars : [
		'format',
		'icon'
	],
	#category : #Glamour-Core,
	#timestamp : 'TudorGirba 2/4/2011 17:56'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMFormatedPresentation>>format [
	^ format ifNil: [ format := #asString ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMFormatedPresentation>>format: anObject  [
	 
	format := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMFormatedPresentation>>formatedDisplayValue [
	^ self formatedDisplayValueOf: self displayValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMFormatedPresentation>>formatedDisplayValueOf: anObject [
	^ self format glamourValue: (anObject asGlamorousMultiValue, self entity asGlamorousMultiValue)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMFormatedPresentation>>icon [
	^ icon ifNil: [ icon := [nil] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMFormatedPresentation>>icon: anObject [
	icon := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMFormatedPresentation>>iconFor: anObject [
	^ self icon glamourValue: (anObject asGlamorousMultiValue, self entity asGlamorousMultiValue)
]
