"
I announce that an entry has been added to a log.
"
Class {
	#name : #EpEntryAdded,
	#superclass : #Announcement,
	#instVars : [
		'entry'
	],
	#category : #Epicea-Announcements,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryAdded class>>for: anEntry [

	^ self basicNew
		initializeWith: anEntry;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryAdded>>entry [
	^ entry
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpEntryAdded>>initializeWith: anEntry [

	self initialize.
	entry := anEntry.
]
