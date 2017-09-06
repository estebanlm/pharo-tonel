"
I opened a new popper window that displays the given notification. (I do not alter the content of the text editor.)
"
Class {
	#name : #GLMPopperNotificationStrategy,
	#superclass : #RubNotificationStrategy,
	#category : #Glamour-Morphic-Widgets,
	#timestamp : 'AndreiChis 10/1/2014 13:35'
}

{
	#category : #notification,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopperNotificationStrategy>>notify: aString at: anInteger in: aStream [
	| pos |
	pos := self editor selectionInterval notEmpty
		ifTrue: [self editor startIndex + anInteger - 1 ]
		ifFalse: [anInteger].
	self editor selectFrom: pos to: pos.
	
	GLMErrorPopper
		installAlarm: #popupError:
		for: self
		withArguments: { aString }
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopperNotificationStrategy>>popupError: aString [
	(GLMErrorPopper new withString: aString from: self editor textArea owner owner owner)
		openInWorld
]
