"
AbstractKeyPressedPlugin is an abstract plugin which reacts to key strokes by sending the message keyPressed to the plugin.
"
Class {
	#name : #AbstractKeyPressedPlugin,
	#superclass : #AbstractNautilusPlugin,
	#category : #NautilusCommon-Plugin,
	#timestamp : 'StephaneDucasse 10/30/2014 07:36'
}

{
	#category : #announcement,
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractKeyPressedPlugin>>keyPressed: anAnnouncement [

	self subclassResponsibility
]

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractKeyPressedPlugin>>registerTo: aModel [

	aModel announcer
		when: NautilusKeyPressed send: #keyPressed: to: self
]
