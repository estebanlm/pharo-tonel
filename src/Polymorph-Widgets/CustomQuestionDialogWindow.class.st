"
QuestionDialog supporting custom text/buttons for yes/no choices.
"
Class {
	#name : #CustomQuestionDialogWindow,
	#superclass : #QuestionDialogWindow,
	#instVars : [
		'yesButton',
		'noButton',
		'cancelButton'
	],
	#category : #Polymorph-Widgets-Windows,
	#timestamp : 'gvc 9/23/2008 11:59'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
CustomQuestionDialogWindow>>cancelButton [

	^ cancelButton
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
CustomQuestionDialogWindow>>cancelButton: anObject [

	cancelButton := anObject
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
CustomQuestionDialogWindow>>cancelText: aStringOrText help: helpString [
	"Set the cancel button label.
	if the text is nil, remove the button."

	aStringOrText
		ifNil: [self cancelButton delete]
		ifNotNil: [self cancelButton
					hResizing: #shrinkWrap;
					label: aStringOrText;
					setBalloonText: helpString]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
CustomQuestionDialogWindow>>default: defaultOption [
	"Set the default button."

	defaultOption
		ifNil: [self cancelButton isDefault: true]
		ifNotNil: [defaultOption
					ifTrue: [self yesButton isDefault: true]
					ifFalse: [self noButton isDefault: true]]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
CustomQuestionDialogWindow>>defaultCancelButton [
	"Answer a default cancel button."

	^self newCancelButton
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
CustomQuestionDialogWindow>>defaultNoButton [
	"Answer a default no button."

	^self newNoButton
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
CustomQuestionDialogWindow>>defaultYesButton [
	"Answer a default yes button."

	^self newYesButton
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
CustomQuestionDialogWindow>>initialize [
	"Initialize the receiver."

	self
		yesButton: self defaultYesButton;
		noButton: self defaultNoButton;
		cancelButton: self defaultCancelButton.
	super initialize
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
CustomQuestionDialogWindow>>newButtons [
	"Answer new buttons as appropriate."

	^{self yesButton. self noButton. self cancelButton}
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
CustomQuestionDialogWindow>>noButton [
	"Answer the value of noButton"

	^ noButton
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
CustomQuestionDialogWindow>>noButton: anObject [
	"Set the value of noButton"

	noButton := anObject
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
CustomQuestionDialogWindow>>noText: aStringOrText help: helpString [
	"Set the no button label.
	if the text is nil, remove the button."

	aStringOrText
		ifNil: [self noButton delete]
		ifNotNil: [self noButton
					hResizing: #shrinkWrap;
					label: aStringOrText;
					setBalloonText: helpString]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
CustomQuestionDialogWindow>>yesButton [
	"Answer the value of yesButton"

	^ yesButton
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
CustomQuestionDialogWindow>>yesButton: anObject [
	"Set the value of yesButton"

	yesButton := anObject
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
CustomQuestionDialogWindow>>yesText: aStringOrText help: helpString [
	"Set the yes button label.
	if the text is nil, remove the button."

	aStringOrText
		ifNil: [self cancelButton delete]
		ifNotNil: [self yesButton
					hResizing: #shrinkWrap;
					label: aStringOrText;
					setBalloonText: helpString]
]
