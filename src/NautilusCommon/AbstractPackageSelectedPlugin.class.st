"
AbstractKeyPressedPlugin is an abstraction of plugin which react when a package is selected
"
Class {
	#name : #AbstractPackageSelectedPlugin,
	#superclass : #AbstractNautilusPlugin,
	#category : #NautilusCommon-Plugin,
	#timestamp : '<historical>'
}

{
	#category : #announcement,
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractPackageSelectedPlugin>>packageSelected: anAnnouncement [

	^ self subclassResponsibility
]

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractPackageSelectedPlugin>>registerTo: aModel [
	aModel announcer
		when: NautilusPackageSelected send: #packageSelected: to: self
]
