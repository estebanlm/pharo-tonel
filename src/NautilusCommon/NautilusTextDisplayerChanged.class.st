"
A NautilusTextDisplayerChanged is raised when the way to display the method changed.
"
Class {
	#name : #NautilusTextDisplayerChanged,
	#superclass : #Announcement,
	#instVars : [
		'displayerSymbol'
	],
	#category : #NautilusCommon-Announcements,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusTextDisplayerChanged class>>displayerSymbol: anObject [

	^ self new
		displayerSymbol: anObject;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusTextDisplayerChanged>>displayerSymbol [
	^ displayerSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusTextDisplayerChanged>>displayerSymbol: anObject [
	displayerSymbol := anObject
]
