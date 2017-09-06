"
Common superclass for parser notifications
"
Class {
	#name : #ParserNotification,
	#superclass : #Notification,
	#instVars : [
		'name'
	],
	#category : #Compiler-Exceptions,
	#timestamp : 'TorstenBergmann 1/31/2014 11:18'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:32'
}
ParserNotification class>>name: aString [
	^ (self new setName: aString) signal
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:32'
}
ParserNotification>>defaultAction [
	
	self openMenuIn: 
		[:labels :lines :caption | 
		UIManager default chooseFrom: labels lines: lines title: caption]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:32'
}
ParserNotification>>openMenuIn: aBlock [
	self subclassResponsibility
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:32'
}
ParserNotification>>setName: aString [
	name := aString
]
