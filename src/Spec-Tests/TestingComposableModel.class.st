"
A TestingComposableModel is a stupid composable model used to test SpecInterpreter.
"
Class {
	#name : #TestingComposableModel,
	#superclass : #ComposableModel,
	#instVars : [
		'list'
	],
	#category : #Spec-Tests-Utils
}

{ #category : #specs }
TestingComposableModel class >> defaultSpec [
	<spec>

	^ SpecLayout composed
		add: #list;
		yourself
]

{ #category : #specs }
TestingComposableModel class >> testingSpec [
	^ {#RubPluggableTextMorph. #model:. #model. }
]

{ #category : #specs }
TestingComposableModel class >> title [

	^ 'You should not see me !'
]

{ #category : #accessing }
TestingComposableModel >> getText [
	^ Text new
]

{ #category : #initialization }
TestingComposableModel >> initializeWidgets [
	list := self newList
]

{ #category : #accessing }
TestingComposableModel >> list [

	^ list
]
