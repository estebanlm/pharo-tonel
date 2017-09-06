"
An AthensWrappedWorldDisplay acts as a DisplayScreen
for a wrapped WorldMorph.

Instance Variables
	realDisplay:		the realdisplay
	wrapMorph:	the wrapped world

"
Class {
	#name : #AthensWrappedWorldDisplay,
	#superclass : #Object,
	#instVars : [
		'realDisplay',
		'wrapMorph'
	],
	#category : #Athens-Morphic,
	#timestamp : 'NicolaiHess 1/4/2015 18:29'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensWrappedWorldDisplay class>>on: aWorldWrapMorph [
	^ self new wrapMorph:aWorldWrapMorph
]

{
	#category : #'display protocol',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensWrappedWorldDisplay>>boundingBox [
	^ wrapMorph ifNotNil: [ wrapMorph fullBounds ] ifNil: [ 0 @ 0 extent: 0 @ 0 ]
]

{
	#category : #'display protocol',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensWrappedWorldDisplay>>doesNotUnderstand: aMessage [
	"delegate all not implemented methods to the real display"

	^ (realDisplay respondsTo: aMessage selector)
		ifTrue: [ realDisplay perform: aMessage selector withEnoughArguments: aMessage arguments ]
		ifFalse: [ super doesNotUnderstand: aMessage ]
]

{
	#category : #'display protocol',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensWrappedWorldDisplay>>extent [
	^ wrapMorph ifNotNil: [ wrapMorph extent ] ifNil: [ 0 @ 0 ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensWrappedWorldDisplay>>initialize [

	super initialize.

	realDisplay := Display.
	wrapMorph := nil.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensWrappedWorldDisplay>>wrapMorph [
	^ wrapMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensWrappedWorldDisplay>>wrapMorph: anObject [
	wrapMorph := anObject
]
