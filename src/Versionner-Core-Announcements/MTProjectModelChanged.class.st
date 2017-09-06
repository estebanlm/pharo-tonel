"
A MTAnnouncement is used to signal a change on a MTProject model.
"
Class {
	#name : #MTProjectModelChanged,
	#superclass : #Announcement,
	#instVars : [
		'project'
	],
	#category : #Versionner-Core-Announcements,
	#timestamp : '<historical>'
}

{
	#category : #creation,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProjectModelChanged class>>project: anObject [
	^ self new 
		project: anObject;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProjectModelChanged>>project [
	^ project
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProjectModelChanged>>project: anObject [
	project := anObject
]
