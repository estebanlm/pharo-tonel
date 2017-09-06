"
This class simply specifies that the updating announcement could come from any of the objects in the announcer objects collection.
"
Class {
	#name : #GLMMultipleUpdateAction,
	#superclass : #GLMUpdateAction,
	#category : #Glamour-Core,
	#timestamp : 'TudorGirba 1/7/2011 07:31'
}

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMMultipleUpdateAction>>computeAnnouncerObjects  [
	^ self transformation glamourValue: self presentation entity
]
