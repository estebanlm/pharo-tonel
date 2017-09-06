"
A KMPartialMatch is an announcement raised when a partial match is completed
"
Class {
	#name : #KMPartialMatch,
	#superclass : #Announcement,
	#instVars : [
		'event',
		'source'
	],
	#category : #Keymapping-Core-Announcements,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPartialMatch class>>event: event from: source [

	^ self new
		event: event;
		source: source;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPartialMatch>>event [
	^ event
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPartialMatch>>event: anObject [
	event := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPartialMatch>>source [
	^ source
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPartialMatch>>source: anObject [
	source := anObject
]
