"
This is a simple test mock
"
Class {
	#name : #AnnouncementMockC,
	#superclass : #AnnouncementMockB,
	#instVars : [
		'announcingCounter'
	],
	#category : #Announcements-Tests-Core-Mocks,
	#timestamp : 'Tbn 11/12/2010 10:54'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:41'
}
AnnouncementMockC>>announcingCounter [
	^ announcingCounter
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:41'
}
AnnouncementMockC>>initialize [
	super initialize.
	announcingCounter := 0
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:41'
}
AnnouncementMockC>>prepareForDelivery [

	announcingCounter := announcingCounter + 1
]
