"
Announcement sent when a Version has finished loading
"
Class {
	#name : #MCVersionLoaderStopped,
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
MCVersionLoaderStopped>>label [
	^ label
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionLoaderStopped>>label: anObject [
	label := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionLoaderStopped>>versionLoader [
	^ versionLoader
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionLoaderStopped>>versionLoader: anObject [
	versionLoader := anObject
]
