"
A NautilusChanged is raised when a NautilusUI send th message #changed:
"
Class {
	#name : #NautilusChanged,
	#superclass : #Announcement,
	#instVars : [
		'symbol'
	],
	#category : #NautilusCommon-Announcements,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusChanged class>>symbol: symbol [

	^ self new
		symbol: symbol;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusChanged>>symbol [
	^ symbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusChanged>>symbol: anObject [
	symbol := anObject
]
