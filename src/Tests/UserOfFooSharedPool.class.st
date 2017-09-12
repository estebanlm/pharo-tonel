"
I am an sunit test for SystemNavigation.
"
Class {
	#name : #UserOfFooSharedPool,
	#superclass : #Object,
	#pools : [
		'FooSharedPool'
	],
	#category : #Tests-System
}

{ #category : #'as yet unclassified' }
UserOfFooSharedPool >> simpleMethod [
	^FooValue1
]
