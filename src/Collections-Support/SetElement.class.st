"
I am a helper class for handling the contents of Set.
My main purpose is to allow a Set to contain nil.
Since nil represents an empty slot in a Set, it cannot be stored directly in the array of values. Instead, an instance of SetElement is used as a wrapper. See implementors and senders of #asElement for wrapping, and #enclosedSetElement for unwrapping.
"
Class {
	#name : #SetElement,
	#superclass : #Object,
	#instVars : [
		'enclosedElement'
	],
	#classVars : [
		'NilElement'
	],
	#category : #Collections-Support,
	#timestamp : 'StephaneDucasse 7/14/2011 21:29'
}

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 07:16:56'
}
SetElement class>>initialize [
	NilElement := self with: nil.

]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:56'
}
SetElement class>>with: anObject [
	^ self new enclosedSetElement: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
SetElement class>>withNil [
	^ NilElement

]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:56'
}
SetElement>>= anObject [
	^ anObject class = self class and: [ enclosedElement = anObject enclosedSetElement ]

]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:56'
}
SetElement>>asSetElement [
	"A receiver has to be included into a set, as a distinct object.
	We need to wrap receiver in own turn, otherwise #enclosedSetElement will return wrong object for that set"
	^ SetElement with: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
SetElement>>enclosedSetElement [
	^ enclosedElement
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
SetElement>>enclosedSetElement: anObject [
	enclosedElement := anObject
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:56'
}
SetElement>>hash [
	^ enclosedElement hash

]
