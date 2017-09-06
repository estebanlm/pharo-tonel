Extension {
	#name : #ProcessBrowser
}

{
	#category : #'*Shout-Styling',
	#timestamp : ' 8/31/2017 05:26:28'
}
ProcessBrowser>>shoutAboutToStyle: aPluggableShoutMorphOrView [

	selectedContext ifNil: [^false].
	aPluggableShoutMorphOrView classOrMetaClass: self selectedClass.
	^ true

]
