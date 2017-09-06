"
This is a dummy for a custom Help browser that can be registered as a replacement for the HelpBrowser class.

Instance Variables
	rootTopic:		<HelpTopic>

rootTopic
	- The root help topic

"
Class {
	#name : #AdvancedHelpBrowserDummy,
	#superclass : #Object,
	#instVars : [
		'rootTopic',
		'isOpen'
	],
	#category : #HelpSystem-Tests-Core-UI,
	#timestamp : 'tbn 5/3/2010 19:30'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:43'
}
AdvancedHelpBrowserDummy>>initialize [
	isOpen := false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:43'
}
AdvancedHelpBrowserDummy>>isOpen [
	^isOpen
]

{
	#category : #mocking,
	#timestamp : ' 8/31/2017 05:26:43'
}
AdvancedHelpBrowserDummy>>open [
	isOpen := true
]

{
	#category : #mocking,
	#timestamp : ' 8/31/2017 05:26:43'
}
AdvancedHelpBrowserDummy>>rootTopic [
	^rootTopic
]

{
	#category : #mocking,
	#timestamp : ' 8/31/2017 05:26:43'
}
AdvancedHelpBrowserDummy>>rootTopic: aTopic [
	rootTopic := aTopic
]
