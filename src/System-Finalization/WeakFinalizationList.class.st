"
IMPORTANT!!!

This class is a special object, recognized by VM.
Its only purpose is to 
a) identify a special kind of objects who usually having a weak references but
  also having an instance of me held by first non-weak fixed slot (instance variable).

b) a 'first' instance variable points to the head of a list of items, reported by VM which has weak references which became garbage during last garbage collection

At my class side, there are some public behavior, which is used by finalization process to detect if VM supports new finalization scheme or should use the old one.
Weak registry using #hasNewFinalization for switching to correct finalization logic,
depending on VM it currently runs on.

"
Class {
	#name : #WeakFinalizationList,
	#superclass : #Object,
	#instVars : [
		'first'
	],
	#classVars : [
		'HasNewFinalization'
	],
	#category : #System-Finalization,
	#timestamp : 'Igor.Stasenko 9/22/2010 21:09'
}

{
	#category : #'vm capability test',
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakFinalizationList class>>hasNewFinalization [
	"new finalization is always false"
	^ false
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakFinalizationList class>>initialize  [
	SessionManager default
		registerSystemClassNamed: self name.
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakFinalizationList class>>startUp: resuming  [
	resuming ifTrue: [ 
		HasNewFinalization := Smalltalk vm isPharoVM ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakFinalizationList>>first [
	^ first
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
WeakFinalizationList>>swapWithNil [

	| head |
	head := first.
	first := nil.
	^ head
]
