"

"
Class {
	#name : #GLMMorphicFinderRenderer,
	#superclass : #GLMMorphicBrowserRenderer,
	#instVars : [
		'container'
	],
	#category : #Glamour-Morphic-Renderer,
	#timestamp : ''
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicFinderRenderer>>actOnPaneAdded: ann [
	self subclassResponsibility
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicFinderRenderer>>actOnPaneRemoved: ann [
	self subclassResponsibility
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicFinderRenderer>>actOnPaneReplaced: ann [
	self subclassResponsibility
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicFinderRenderer>>registerAnnouncementsFor: aBrowser [
	aBrowser when: GLMPaneRemoved send: #actOnPaneRemoved: to: self.
	aBrowser when: GLMPaneAdded send: #actOnPaneAdded: to: self.
	aBrowser when: GLMPaneReplaced send: #actOnPaneReplaced: to: self.
	aBrowser when: GLMBrowserClosed send: #actOnBrowserClosed: to: self
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicFinderRenderer>>render: aBrowser [
	^ self subclassResponsibility
]
