"
See class side messages #welcome, #doingVSPrinting....

"
Class {
	#name : #Lesson,
	#superclass : #Object,
	#instVars : [
		'title',
		'lesson'
	],
	#category : #ProfStef-Core,
	#timestamp : 'LaurentLaffont 1/15/2010 10:25'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:23'
}
Lesson class>>title: aStringForTitle lesson: aStringForLesson [
	^ self new title: aStringForTitle; lesson: aStringForLesson; yourself.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
Lesson>>lesson [
	^ lesson ifNil: [lesson := '']
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
Lesson>>lesson: aString [
	lesson := aString
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:23'
}
Lesson>>printOn: aStream [
	super printOn: aStream.  
	aStream 
		nextPutAll: '(';
		nextPutAll: self title;
		nextPutAll: ')'.    
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
Lesson>>title [
	^ title ifNil: [title := '']
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
Lesson>>title: aString [
	title := aString
]
