"
I am an announcement raised when there is a full match between the key buffer and a shortcut.
"
Class {
	#name : #KMCompleteMatch,
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
KMCompleteMatch class>>event: event from: source [

	^ self new
		event: event;
		source: source;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCompleteMatch>>event [
	^ event
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCompleteMatch>>event: anObject [
	event := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCompleteMatch>>source [
	^ source
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCompleteMatch>>source: anObject [
	source := anObject
]
