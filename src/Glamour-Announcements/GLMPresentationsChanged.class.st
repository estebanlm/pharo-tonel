"
A GLMPresentationsChanged is announced by the pane when the set of presentations changes.
"
Class {
	#name : #GLMPresentationsChanged,
	#superclass : #Announcement,
	#instVars : [
		'pane',
		'oldPresentations'
	],
	#category : #Glamour-Announcements,
	#timestamp : 'tg 2/20/2010 14:57'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPresentationsChanged>>oldPresentations  [
	"The presentations that were present on the pane before the change." 
	 
	^oldPresentations
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPresentationsChanged>>oldPresentations: aCollection  [
	"The presentations that were present on the pane before the change." 
	 
	oldPresentations := aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPresentationsChanged>>pane  [
	"The pane on which the presentations changed." 
	 
	^pane
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPresentationsChanged>>pane: aPane  [
	"The pane on which the presentations changed." 
	 
	pane := aPane
]

{
	#category : #accessing-convenience,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPresentationsChanged>>presentations  [
	"The presentationt that are currently present on the pane." 
	 
	^self pane presentations
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPresentationsChanged>>printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' (pane = ', self pane printString , ')'
]
