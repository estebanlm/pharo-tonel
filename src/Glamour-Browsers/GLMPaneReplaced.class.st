"
An old pane was replaced with a new one

Instance Variables
	newPane:		<Object>
	oldPane:		<Object>

newPane
	- the new pane
	
oldPane
	- the old pane
"
Class {
	#name : #GLMPaneReplaced,
	#superclass : #GLMPaneAnnouncement,
	#instVars : [
		'oldPane',
		'newPane'
	],
	#category : #Glamour-Browsers-Announcements,
	#timestamp : 'TorstenBergmann 3/10/2015 21:59'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPaneReplaced class>>oldPane: oldPane newPane: newPane fromBrowser: aBrowser [
	^ self new 
		oldPane: oldPane;
		newPane: newPane;
		browser: aBrowser
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPaneReplaced>>newPane [
	^ newPane
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPaneReplaced>>newPane: anObject [
	newPane := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPaneReplaced>>oldPane [
	^ oldPane
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPaneReplaced>>oldPane: anObject [
	oldPane := anObject
]
