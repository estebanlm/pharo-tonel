"
A yes/no message dialog. Yes (return) is the default. Escape will answer no.
"
Class {
	#name : #QuestionWithoutCancelDialogWindow,
	#superclass : #QuestionDialogWindow,
	#category : #Polymorph-Widgets-Windows,
	#timestamp : 'gvc 5/18/2007 12:20'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
QuestionWithoutCancelDialogWindow>>escapePressed [
	"Default is to cancel."

	self no
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
QuestionWithoutCancelDialogWindow>>newButtons [
	"Answer new buttons as appropriate."

	^{self newYesButton isDefault: true. self newNoButton}
]
