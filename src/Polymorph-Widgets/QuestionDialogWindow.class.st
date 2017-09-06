"
A yes/no/cancel message dialog. Cancel (escape & return) is the default.
"
Class {
	#name : #QuestionDialogWindow,
	#superclass : #ProceedDialogWindow,
	#instVars : [
		'answer'
	],
	#category : #Polymorph-Widgets-Windows,
	#timestamp : 'gvc 5/18/2007 12:20'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
QuestionDialogWindow>>answer [
	"Answer the value of answer"

	^ answer
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
QuestionDialogWindow>>answer: anObject [
	"Set the value of answer"

	answer := anObject
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
QuestionDialogWindow>>newButtons [
	"Answer new buttons as appropriate."

	^{self newYesButton. self newNoButton. self newCancelButton isDefault: true}
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
QuestionDialogWindow>>no [
	"Answer no."

	self
		answer: false;
		ok
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
QuestionDialogWindow>>yes [
	"Answer yes."

	self
		answer: true;
		ok
]
