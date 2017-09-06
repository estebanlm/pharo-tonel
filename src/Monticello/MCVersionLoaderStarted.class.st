"
Announcement sent when a Version is starting to load
"
Class {
	#name : #MCVersionLoaderStarted,
	#superclass : #Announcement,
	#instVars : [
		'versionLoader',
		'label'
	],
	#category : #Monticello-Announcements,
	#timestamp : 'StefanReichhart 12/4/2015 22:01'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionLoaderStarted>>label [
	^ label
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionLoaderStarted>>label: anObject [
	label := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionLoaderStarted>>versionLoader [
	^ versionLoader
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionLoaderStarted>>versionLoader: anObject [
	versionLoader := anObject
]
