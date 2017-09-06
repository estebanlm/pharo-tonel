"
A GLMMatchingPresentationsChanged is announced by the pane when the presentations that should be displayed change due to changes in the values of the ports of the pane.
"
Class {
	#name : #GLMMatchingPresentationsChanged,
	#superclass : #Announcement,
	#instVars : [
		'pane',
		'oldMatchingPresentations'
	],
	#category : #Glamour-Announcements,
	#timestamp : 'tg 2/20/2010 14:56'
}

{
	#category : #accessing-convenience,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMMatchingPresentationsChanged>>matchingPresentations  [
	"The presentations that match now."
	^ self pane matchingPresentations
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMMatchingPresentationsChanged>>oldMatchingPresentations  [
	"The presentations that matched before this announcement." 
	 
	^oldMatchingPresentations
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMMatchingPresentationsChanged>>oldMatchingPresentations: aCollection  [
	"The presentations that matched before this announcement." 
	 
	oldMatchingPresentations := aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMMatchingPresentationsChanged>>pane  [
	"The pane on which the matching presentations changed." 
	 
	^pane
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMMatchingPresentationsChanged>>pane: aPane  [
	"The pane on which the matching presentations changed." 
	 
	pane := aPane
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMMatchingPresentationsChanged>>printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' (pane = ', self pane printString , ')'
]
