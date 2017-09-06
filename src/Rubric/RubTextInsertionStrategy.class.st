"
I insert the notification directly in the text at the given position. (I alter the content of the text editor)
"
Class {
	#name : #RubTextInsertionStrategy,
	#superclass : #RubNotificationStrategy,
	#category : #Rubric-Editing-Core,
	#timestamp : 'AndreiChis 10/1/2014 13:35'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextInsertionStrategy>>notify: aString at: anInteger in: aStream  [
	"The compilation of text failed. The syntax error is noted as the argument, 
	aString. Insert it in the text at starting character position anInteger."

	| pos |
	pos := self editor selectionInterval notEmpty
		ifTrue: [self editor startIndex + anInteger - 1 ]
		ifFalse: [anInteger].
	self editor insertAndSelect: aString at: (pos max: 1)
]
