"
These announcements are used by the browser to communicate with the renderer whenever the panes configuration is modified in some way.

Instance Variables:
	pane	<GLMPane>
	browser	<GLMBrowser>
	position	<Integer>
"
Class {
	#name : #GLMPaneAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'pane',
		'browser',
		'position'
	],
	#category : #Glamour-Browsers-Announcements,
	#timestamp : 'TudorGirba 2/4/2011 21:24'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPaneAnnouncement class>>pane: aPane atPosition: anInteger inBrowser: aBrowser  [
	 
	^(self new) 
		pane: aPane; 
		position: anInteger; 
		browser: aBrowser; 
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPaneAnnouncement>>browser  [
	 
	^browser
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPaneAnnouncement>>browser: anObject  [
	 
	browser := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPaneAnnouncement>>pane  [
	 
	^pane
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPaneAnnouncement>>pane: anObject  [
	 
	pane := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPaneAnnouncement>>position  [
	 
	^position
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPaneAnnouncement>>position: anObject  [
	 
	position := anObject
]
