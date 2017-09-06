"
A RubHighlightSegmentMorph is a volatile segment that deletes itself whenever the user interacts with the editor. It can be used to add selection-like segments.

"
Class {
	#name : #RubHighlightSegmentMorph,
	#superclass : #RubTextSegmentMorph,
	#category : #Rubric-Editing-Core,
	#timestamp : 'AndreiChis 1/12/2015 17:14'
}

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubHighlightSegmentMorph>>handlesMouseDown: evt [

	^ true
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubHighlightSegmentMorph>>mouseDown: anEvent [
	super mouseDown: anEvent.
	self delete
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubHighlightSegmentMorph>>registerTextArea [
	super registerTextArea.
	
	textArea announcer  
		when: RubKeystroke send: #whenKeyPressed: to: self;
		when: RubMouseClick send: #whenMouseClicked: to: self;
		when: RubSelectionChanged send: #whenSelectionChanged: to: self.
	
	self color: (self theme rubScrolledTextMorphThemer highlightBackgroundColorFor: textArea).
	self borderStyle: (self theme rubScrolledTextMorphThemer highlightBorderStyleFor: textArea).
	self borderWidth: (self textArea hasSelection
		ifTrue: [ 2 * self borderWidth] 
		ifFalse: [ self borderWidth ])
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubHighlightSegmentMorph>>showMouseHasEntered [

]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubHighlightSegmentMorph>>showMouseHasLeaved [


]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubHighlightSegmentMorph>>whenKeyPressed: anEvent [

	self delete
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubHighlightSegmentMorph>>whenMouseClicked: event [

	self delete
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubHighlightSegmentMorph>>whenSelectionChanged: anAnnouncement  [

	self delete
	
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubHighlightSegmentMorph>>whenTextChanged: anAnnouncement  [

	self delete
]
