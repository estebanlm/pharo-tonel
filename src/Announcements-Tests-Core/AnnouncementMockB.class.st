"
This is a simple test mock
"
Class {
	#name : #AnnouncementMockB,
	#superclass : #Announcement,
	#instVars : [
		'parameter'
	],
	#category : #Announcements-Tests-Core-Mocks,
	#timestamp : 'Tbn 11/12/2010 10:54'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:41'
}
AnnouncementMockB class>>with: anObject [
	^self new 
		parameter: anObject 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:41'
}
AnnouncementMockB>>parameter [
	^ parameter
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:41'
}
AnnouncementMockB>>parameter: anObject [
	parameter := anObject
]
