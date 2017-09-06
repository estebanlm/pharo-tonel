Extension {
	#name : #DiffMorph
}

{
	#category : #'*Shout-Styling',
	#timestamp : ' 8/31/2017 05:26:28'
}
DiffMorph>>shoutAboutToStyle: aPluggableShoutMorphOrView [
	aPluggableShoutMorphOrView classOrMetaClass: self contextClass.
	^ self contextClass notNil 
]
