"
A GLMContextChanged is announced by a presentation when an outer port event raises.
"
Class {
	#name : #GLMContextChanged,
	#superclass : #Announcement,
	#instVars : [
		'presentation',
		'property',
		'value',
		'oldValue'
	],
	#category : #Glamour-Announcements,
	#timestamp : 'tg 2/20/2010 14:55'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMContextChanged>>announcesNewSelection  [
	"ContextChanged announces a new selection if 
	the updated port is #selection and the new value is different from the current selection. 
	This method is useful when updating the selection in UI widgets, because 
	we only want to affect the widget when there actually is a new selection" 
	 
	^self property = #selection 
		and: [self presentation selection ~~ self value]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMContextChanged>>oldValue  [
	 
	^oldValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMContextChanged>>oldValue: anObject  [
	 
	oldValue := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMContextChanged>>presentation  [
	 
	^presentation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMContextChanged>>presentation: aPresentation  [
	 
	presentation := aPresentation
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMContextChanged>>printOn: aStream [
	super printOn: aStream.
	aStream 
		nextPutAll: ' (presentation = ';
		nextPutAll: self presentation printString;
		nextPutAll: ', property = #';
		nextPutAll: self property;
		nextPutAll: ', oldValue = ';
		nextPutAll: self oldValue gtDisplayString;
		nextPutAll: ', value = ';
		nextPutAll: self value gtDisplayString;
		nextPutAll: ')'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMContextChanged>>property  [
	 
	^property
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMContextChanged>>property: aSymbol  [
	 
	property := aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMContextChanged>>value  [
	 
	^value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMContextChanged>>value: anObject  [
	 
	value := anObject
]
