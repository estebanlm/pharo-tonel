"
I am announced when existing class tag is removed
"
Class {
	#name : #ClassTagRenamed,
	#superclass : #ClassTagAnnouncement,
	#instVars : [
		'newName'
	],
	#category : #System-Announcements-System-Packages,
	#timestamp : 'DenisKudryashov 11/15/2016 18:29'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassTagRenamed class>>in: aPackage tag: aSymbol to: newTagName [

	^(self in: aPackage tag: aSymbol)
		newName: newTagName 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassTagRenamed>>newName [
	^ newName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassTagRenamed>>newName: anObject [
	newName := anObject
]
