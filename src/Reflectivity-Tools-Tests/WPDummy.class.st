"
I am a dummy class to test watchpoints
"
Class {
	#name : #WPDummy,
	#superclass : #Object,
	#instVars : [
		'foo'
	],
	#category : #Reflectivity-Tools-Tests
}

{ #category : #'as yet unclassified' }
WPDummy >> exampleAssignment [
	foo := 1.
	
	
]

{ #category : #'as yet unclassified' }
WPDummy >> exampleAssignment: anObject [
	foo := anObject.
	
	
]

{ #category : #'as yet unclassified' }
WPDummy >> exampleMessageSend [
	self exampleOperation
	
	
]

{ #category : #'as yet unclassified' }
WPDummy >> exampleOperation [ 
	^ 2+3
]

{ #category : #'as yet unclassified' }
WPDummy >> exampleOperationAndAssignment [
	|a|
	a := 1 + 1.
	foo := a + a.
	
	
]

{ #category : #'as yet unclassified' }
WPDummy >> exampleOperationAndAssignment: aNumber [
	|a|
	a := aNumber.
	foo := a + a.
	
	
]

{ #category : #accessing }
WPDummy >> foo [
	^ foo
]

{ #category : #accessing }
WPDummy >> foo: anObject [
	foo := anObject
]
