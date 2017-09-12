"
A yes/no message dialog. Yes (return) is the default. Escape will answer no.
"
Class {
	#name : #QuestionWithoutCancelDialogWindow,
	#superclass : #QuestionDialogWindow,
	#category : #Polymorph-Widgets-Windows
}

{ #category : #'as yet unclassified' }
QuestionWithoutCancelDialogWindow >> escapePressed [
	"Default is to cancel."

	self no
]

{ #category : #'as yet unclassified' }
QuestionWithoutCancelDialogWindow >> newButtons [
	"Answer new buttons as appropriate."

	^{self newYesButton isDefault: true. self newNoButton}
]
