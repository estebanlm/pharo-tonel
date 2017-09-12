"
A yes/no/cancel message dialog. Cancel (escape & return) is the default.
"
Class {
	#name : #QuestionDialogWindow,
	#superclass : #ProceedDialogWindow,
	#instVars : [
		'answer'
	],
	#category : #Polymorph-Widgets-Windows
}

{ #category : #'as yet unclassified' }
QuestionDialogWindow >> answer [
	"Answer the value of answer"

	^ answer
]

{ #category : #'as yet unclassified' }
QuestionDialogWindow >> answer: anObject [
	"Set the value of answer"

	answer := anObject
]

{ #category : #'as yet unclassified' }
QuestionDialogWindow >> newButtons [
	"Answer new buttons as appropriate."

	^{self newYesButton. self newNoButton. self newCancelButton isDefault: true}
]

{ #category : #'as yet unclassified' }
QuestionDialogWindow >> no [
	"Answer no."

	self
		answer: false;
		ok
]

{ #category : #'as yet unclassified' }
QuestionDialogWindow >> yes [
	"Answer yes."

	self
		answer: true;
		ok
]
