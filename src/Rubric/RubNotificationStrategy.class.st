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
	#category : #Rubric-Editing-Core,
	#timestamp : 'AndreiChis 10/1/2014 13:34'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubNotificationStrategy>>editor [
	^ editor
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubNotificationStrategy>>editor: aSmalltalkEditor [
	editor := aSmalltalkEditor 
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubNotificationStrategy>>notify: aString at: anInteger in: aStream  [
	self subclassResponsibility 
]
