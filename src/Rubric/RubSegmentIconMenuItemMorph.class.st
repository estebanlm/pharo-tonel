"

"
Class {
	#name : #RubSegmentIconMenuItemMorph,
	#superclass : #ToggleMenuItemMorph,
	#instVars : [
		'segment'
	],
	#category : #Rubric-Editing-Widgets,
	#timestamp : ''
}

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSegmentIconMenuItemMorph>>deselect: anEvent [
	self segment showMouseHasLeaved.
	super deselect: anEvent.

]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSegmentIconMenuItemMorph>>invokeWithEvent: evt [
	super invokeWithEvent: evt.
	self owner defaultTarget changed
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSegmentIconMenuItemMorph>>segment [
	
	^ segment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSegmentIconMenuItemMorph>>segment: aSegment [
	
	segment := aSegment
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSegmentIconMenuItemMorph>>select: anEvent [
	self segment showMouseHasEntered.
	super select: anEvent.

]
