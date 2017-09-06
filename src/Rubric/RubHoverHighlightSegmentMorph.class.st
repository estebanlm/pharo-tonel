"
I am a text segment morph used for highlighting a text segment on mouse over. 
My default color are the text secondary (light) color.
And my default behavior is to delete myself when the mouse focus leaves me.
"
Class {
	#name : #RubHoverHighlightSegmentMorph,
	#superclass : #RubTextSegmentMorph,
	#category : #Rubric-Editing-Core,
	#timestamp : 'NicolaiHess 8/10/2016 12:33'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubHoverHighlightSegmentMorph>>defaultBorderColor [
	^ self defaultColor muchDarker

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubHoverHighlightSegmentMorph>>defaultColor [
	^ Smalltalk ui theme secondarySelectionColor
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubHoverHighlightSegmentMorph>>initialize [
	super initialize.
	self borderWidth: 1.
	self borderColor: self defaultBorderColor
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubHoverHighlightSegmentMorph>>mouseLeave: anEvent [
	super mouseLeave: anEvent.
	self delete.
]
