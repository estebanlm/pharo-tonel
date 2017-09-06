"
I am responsible for storing information about FileLocator objects.
"
Class {
	#name : #FileLocatorStoredSetting,
	#superclass : #AbstractStoredSetting,
	#instVars : [
		'origin',
		'pathSegments'
	],
	#category : #System-Settings-Persistence-Ston-StoredSettings,
	#timestamp : 'JurajKubelka 10/1/2015 14:39'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
FileLocatorStoredSetting>>origin: anObject [
	origin := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
FileLocatorStoredSetting>>pathSegments: anObject [
	pathSegments := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
FileLocatorStoredSetting>>realValue [
	^ FileLocator origin: origin path: (RelativePath withAll: pathSegments)
]
