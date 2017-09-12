"
Use me to debug and log to the transcript annoncements.


AnnouncementLogger new subscribeTo: SystemAnnouncer announcer

To unsubscribe

AnnouncementLogger  allInstancesDo: [:each | SystemAnnouncer announcer unsubscribe: each ]
"
Class {
	#name : #AnnouncementLogger,
	#superclass : #Object,
	#category : #System-Announcements-Logging
}

{ #category : #'as yet unclassified' }
AnnouncementLogger >> logAnnouncement: ann [

	Transcript show: ann printString ; cr
]

{ #category : #'as yet unclassified' }
AnnouncementLogger >> subscribeTo: anAnnouncer [

	anAnnouncer "weak" 
		when: Announcement send: #logAnnouncement: to: self
]
