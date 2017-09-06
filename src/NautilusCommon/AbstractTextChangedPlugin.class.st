"
An AbstractTextChangedPlugin is a plugin which simply log each time the method displayer changed
"
Class {
	#name : #AbstractTextChangedPlugin,
	#superclass : #AbstractNautilusPlugin,
	#category : #NautilusCommon-Plugin,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractTextChangedPlugin>>displayerChanged: anAnnouncement [

	self logCr: anAnnouncement displayerSymbol
]

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractTextChangedPlugin>>registerTo: aModel [

	aModel announcer
		when: NautilusTextDisplayerChanged send: #displayerChanged: to: self
]
