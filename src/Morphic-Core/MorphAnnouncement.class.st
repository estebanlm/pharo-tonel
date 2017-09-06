"
I am an abstract announcement for morphic events.  I carry the morph where the event has ocurred.

My subclasses should add information for more precise events.
"
Class {
	#name : #MorphAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'morph'
	],
	#category : #Morphic-Core-Announcements,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphAnnouncement class>>morph: aMorph [
	^self new
			morph: aMorph;
			yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphAnnouncement>>morph [
	^ morph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphAnnouncement>>morph: anObject [
	morph := anObject
]
