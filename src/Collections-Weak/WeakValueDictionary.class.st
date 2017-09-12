"
I am a dictionary holding only weakly on my values. Clients may expect to get a nil value for any object they request.
"
Class {
	#name : #WeakValueDictionary,
	#superclass : #Dictionary,
	#category : #Collections-Weak
}

{ #category : #adding }
WeakValueDictionary >> add: anAssociation [
	self at: anAssociation key put: anAssociation value.
	^ anAssociation
]

{ #category : #accessing }
WeakValueDictionary >> at: key put: anObject [ 
	"Set the value at key to be anObject.  If key is not found, create a new
	entry for key and set is value to anObject. Answer anObject."
	| index element |
	index := self findElementOrNil: key.
	element := array at: index.
	element == nil
		ifTrue: [self atNewIndex: index put: (WeakValueAssociation key: key value: anObject)]
		ifFalse: [element value: anObject].
	^ anObject
]

{ #category : #enumerating }
WeakValueDictionary >> valuesDo: aBlock [ 
	"See comments in Dictionary>>valuesDo:.  The code keeps
	a reference to the value to facilitate debugging"

	tally = 0 ifTrue: [ ^self ].
	1 to: array size do:
		[ :eachIndex | 
			| eachAssociation eachValue |
			eachAssociation := array at: eachIndex.
			nil == eachAssociation ifFalse:
				[
					eachValue := eachAssociation value.
					aBlock value: eachValue
				]
		]
]
