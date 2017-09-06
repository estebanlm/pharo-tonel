"
I am announced when the image has been saved. 

Note that the announcement is done *after* the execution was frozen. So you can send me #isNewImage to know if the current image instance is the same that started the save action.
"
Class {
	#name : #SnapshotDone,
	#superclass : #SystemAnnouncement,
	#instVars : [
		'isNewImage'
	],
	#category : #System-Announcements-System-Base,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:00'
}
SnapshotDone class>>isNewImage: aBoolean [
	 ^ self new isNewImage: aBoolean.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
SnapshotDone>>isNewImage [
	^ isNewImage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
SnapshotDone>>isNewImage: anObject [
	isNewImage := anObject
]
