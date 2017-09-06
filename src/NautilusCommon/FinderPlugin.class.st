"
I show the finder bar within Nautilus
"
Class {
	#name : #FinderPlugin,
	#superclass : #AbstractNautilusPlugin,
	#instVars : [
		'finder',
		'finderui'
	],
	#category : #NautilusCommon-Plugin,
	#timestamp : '<historical>'
}

{
	#category : #position,
	#timestamp : ' 8/31/2017 05:26:22'
}
FinderPlugin class>>defaultPosition  [
	^ #top
]

{
	#category : #information,
	#timestamp : ' 8/31/2017 05:26:22'
}
FinderPlugin class>>description [
	"Use class comment as a description for the plugin"
	^ self comment
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:22'
}
FinderPlugin>>display [
	"Nautilus calls this method when the plugin is first displayed. Show the Finder bar."
	finder := Finder new.
	
	finder
		when: #updateResultDictionary
		send: #openFinderUI
		to: self.
		
	finderui := FinderUI on: finder.
	
	^ (finderui buildSearchModeToolBar: StandardWindow new) height: 25
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:22'
}
FinderPlugin>>openFinderUI [
	"The finder bar calls this method when the user accepts his search query."
	finderui open.
	
	"Without that, if you reuse the same Finder for anotehr research, it will open a new window again"
	finder
		removeActionsWithReceiver: self
]

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:22'
}
FinderPlugin>>registerTo: aModel [
	"I don't see any use of Nautilus notifications for this plugin."
]
