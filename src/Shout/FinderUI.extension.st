Extension {
	#name : #FinderUI
}

{
	#category : #'*Shout-Styling',
	#timestamp : ' 8/31/2017 05:26:28'
}
FinderUI>>shoutAboutToStyle: aPluggableShoutMorphOrView [

	aPluggableShoutMorphOrView classOrMetaClass: self selectedClass.
	self selectedClass ifNil: [^ false].
	self selectedMethod ifNil: [^ false].
	^ true
]
