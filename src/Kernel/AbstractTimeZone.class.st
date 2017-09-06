"
I am an abstract superclass for timezones.
See my subclasses for specific implementations.

Timezones are used to encapsulate the offset from the Coordinated Univeral Time (UTC) used for proper Date and Time display and manipulations.
"
Class {
	#name : #AbstractTimeZone,
	#superclass : #Object,
	#pools : [
		'ChronologyConstants'
	],
	#category : #Kernel-Chronology,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
AbstractTimeZone>>abbreviation [
	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
AbstractTimeZone>>name [
	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
AbstractTimeZone>>offset [
	"Return a duration representing the offset from UTC for this timezone"
	self subclassResponsibility
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
AbstractTimeZone>>printOn: aStream [
 
 	super printOn: aStream.
 	aStream
 		nextPut: $(;
 		nextPutAll: self abbreviation;
 		nextPut: $).
]
