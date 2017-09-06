"
I'm an abstract superclass for Job announcements. 

My subclasses are announced in Job jobAnnouncer.
"
Class {
	#name : #JobAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'job'
	],
	#category : #Jobs-Announcements,
	#timestamp : 'MartinDias 6/24/2015 14:59'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:14'
}
JobAnnouncement class>>on: aJob  [

	^ self new job: aJob.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:14'
}
JobAnnouncement>>job [
	
	^ job
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:14'
}
JobAnnouncement>>job: anObject [
	
	job := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:14'
}
JobAnnouncement>>max [
	^ job max
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:14'
}
JobAnnouncement>>min [
	^ job min
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:14'
}
JobAnnouncement>>progress [
	^ job progress
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:14'
}
JobAnnouncement>>title [
	^ job title
]
