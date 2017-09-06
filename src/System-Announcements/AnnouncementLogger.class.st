"
Use me to debug and log to the transcript annoncements.


AnnouncementLogger new subscribeTo: SystemAnnouncer announcer

To unsubscribe

AnnouncementLogger  allInstancesDo: [:each | SystemAnnouncer announcer unsubscribe: each ]
"
Class {
	#name : #AnnouncementLogger,
	#superclass : #Object,
	#category : #System-Announcements-Logging,
	#timestamp : 'StephaneDucasse 5/9/2011 17:17'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:17:00'
}
AnnouncementLogger>>logAnnouncement: ann [

	Transcript show: ann printString ; cr
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:17:00'
}
AnnouncementLogger>>subscribeTo: anAnnouncer [

	anAnnouncer "weak" 
		when: Announcement send: #logAnnouncement: to: self
]
