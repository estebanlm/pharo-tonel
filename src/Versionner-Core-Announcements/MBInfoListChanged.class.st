"
The info list changed
"
Class {
	#name : #MBInfoListChanged,
	#superclass : #MBAnnouncement,
	#instVars : [
		'configurationInfo'
	],
	#category : #Versionner-Core-Announcements,
	#timestamp : 'TorstenBergmann 2/20/2014 14:05'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInfoListChanged class>>changed: aConfigurationInfo [

	^(self new) 
		configurationInfo: aConfigurationInfo;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInfoListChanged>>configurationInfo [
	^ configurationInfo
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInfoListChanged>>configurationInfo: anObject [
	configurationInfo := anObject
]
