"
I am raised when a morph property changed, and should be propagated to dependents
"
Class {
	#name : #MorphChanged,
	#superclass : #MorphAnnouncement,
	#instVars : [
		'selector'
	],
	#category : #Morphic-Core-Announcements,
	#timestamp : '<historical>'
}

{
	#category : #delivering,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphChanged>>deliverTo: aHandler [

	^ aHandler update: selector

	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphChanged>>selector [
	^ selector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphChanged>>selector: anObject [
	selector := anObject
]
