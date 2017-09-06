"
A new pane was removed
"
Class {
	#name : #GLMPaneRemoved,
	#superclass : #GLMPaneAnnouncement,
	#category : #Glamour-Browsers-Announcements,
	#timestamp : 'TorstenBergmann 3/10/2015 21:58'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPaneRemoved class>>pane: aPane fromBrowser: aBrowser  [
	 
	^(self new) 
		pane: aPane; 
		browser: aBrowser; 
		yourself
]
