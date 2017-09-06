"
A configuration info changed
"
Class {
	#name : #MBConfigurationInfoChanged,
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
MBConfigurationInfoChanged class>>changed: aConfigurationInfo [

	^(self new) 
		configurationInfo: aConfigurationInfo;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfoChanged>>configurationInfo [
	^ configurationInfo
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfoChanged>>configurationInfo: anObject [
	configurationInfo := anObject 
	
]
