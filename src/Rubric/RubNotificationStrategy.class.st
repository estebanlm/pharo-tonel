"
I encapsulate the logic that gets executed when, during compilation, a RubSmalltalkEditor receives a notification from the compiler. 

I am an abstract class. My subclasses define the actual behaviour.
"
Class {
	#name : #RubNotificationStrategy,
	#superclass : #Object,
	#instVars : [
		'editor'
	],
	#category : #Rubric-Editing-Core
}

{ #category : #'as yet unclassified' }
RubNotificationStrategy >> editor [
	^ editor
]

{ #category : #'as yet unclassified' }
RubNotificationStrategy >> editor: aSmalltalkEditor [
	editor := aSmalltalkEditor 
]

{ #category : #'as yet unclassified' }
RubNotificationStrategy >> notify: aString at: anInteger [ in: aStream 
	self subclassResponsibility 
]
