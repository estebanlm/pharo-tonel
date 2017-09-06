"
I represent the morph which shows the current selection 
"
Class {
	#name : #RubPrimarySelectionMorph,
	#superclass : #RubPlainSegmentMorph,
	#category : #Rubric-Editing-Core,
	#timestamp : 'FranckWarlouzet 7/29/2015 13:15'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubPrimarySelectionMorph>>defaultBorderColor [
	^ Color orange

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubPrimarySelectionMorph>>defaultColor [
	^ self theme selectionColor

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubPrimarySelectionMorph>>initialize [
	super initialize.
	self beExtendable
]

{
	#category : #ui,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubPrimarySelectionMorph>>readWriteView [
	| view |
	view  := super readWriteView.
	^ view
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubPrimarySelectionMorph>>registerTextArea  [
	super registerTextArea.
	
	textArea announcer 
	when:  RubSelectionChanged send: #whenTextAreaSelectionChanged: to: self;
	when:  MorphGotFocus send: #whenTextAreaGotFocus: to: self;	
	when:  MorphLostFocus send: #whenTextAreaLostFocus: to: self.	

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubPrimarySelectionMorph>>selectionColor [
	^ self textArea hasFocus
		ifTrue: [ self theme selectionColor ]
		ifFalse: [ self theme lessConspicuousColorFrom: (self theme unfocusedSelectionColor) ]
]

{
	#category : #protocol-events,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubPrimarySelectionMorph>>whenTextAreaGotFocus: anAnnouncement  [
	self color: self selectionColor 
]

{
	#category : #protocol-events,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubPrimarySelectionMorph>>whenTextAreaLostFocus: anAnnouncement  [
	self color: self selectionColor 
]

{
	#category : #protocol-events,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubPrimarySelectionMorph>>whenTextAreaSelectionChanged: anAnnouncement  [
	firstIndex := self textArea markIndex min: self textArea pointIndex.
	lastIndex := self textArea pointIndex max: self textArea markIndex.
	self computeVertices.
	self announcer announce: RubTextSetInModel.

]
