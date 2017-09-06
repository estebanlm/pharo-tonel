"
My classes represent class tags modifications on package
"
Class {
	#name : #ClassTagAnnouncement,
	#superclass : #SystemAnnouncement,
	#instVars : [
		'package',
		'tag'
	],
	#category : #System-Announcements-System-Packages,
	#timestamp : 'DenisKudryashov 11/15/2016 18:28'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassTagAnnouncement class>>in: aPackage tag: aSymbol [
	^self new 
		package: aPackage;
		tag: aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassTagAnnouncement>>package [
	^ package
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassTagAnnouncement>>package: anObject [
	package := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassTagAnnouncement>>packagesAffected [
	^{self package}
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassTagAnnouncement>>tag [
	^ tag
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassTagAnnouncement>>tag: anObject [
	tag := anObject
]
