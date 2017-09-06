"
I am an announcement raised when a scroll pane is scrolled.

My two attributes are
	- step: a point representing the scrollbar movement
	- scrollPane: a pointer to the widget raising the announcement
"
Class {
	#name : #PaneScrolling,
	#superclass : #Announcement,
	#instVars : [
		'step',
		'scrollPane'
	],
	#category : #Morphic-Widgets-Scrolling,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PaneScrolling>>scrollPane [
	^ scrollPane
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PaneScrolling>>scrollPane: anObject [
	scrollPane := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PaneScrolling>>step [
	^ step
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PaneScrolling>>step: anObject [
	step := anObject
]
