"
This is a special widget renderer in that it will get to render multiple panes on the same container morph provided by a unique instance of the GLMWatcherWindow.
"
Class {
	#name : #GLMMorphicWatcherRenderer,
	#superclass : #GLMMorphicWidgetRenderer,
	#instVars : [
		'process'
	],
	#category : #Glamour-Morphic-Renderer,
	#timestamp : '<historical>'
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicWatcherRenderer>>actOnMatchingPresentationsChanged: anAnnouncement [
	"whenever a relevant pane changes its presentations,
	we override the contents from the GLMWatcherWindow"
	
	GLMWatcherWindow uniqueInstance 
		addContent: [ self renderObject: anAnnouncement pane presentations ]
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicWatcherRenderer>>render: aPane [
	"we just register for the announcement"

	aPane when: GLMMatchingPresentationsChanged send: #actOnMatchingPresentationsChanged: to: self
]
