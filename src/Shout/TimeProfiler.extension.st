Extension {
	#name : #TimeProfiler
}

{
	#category : #'*Shout-Styling',
	#timestamp : ' 8/31/2017 05:26:28'
}
TimeProfiler>>shoutAboutToStyle: aPluggableShoutMorphOrView  [
	self selectedNode
		ifNotNil: [ :currNode | 
			aPluggableShoutMorphOrView getTextSelector = #selectedMethodCode
				ifTrue: [aPluggableShoutMorphOrView classOrMetaClass: currNode methodClass.
					^ true]].
	aPluggableShoutMorphOrView getTextSelector = #summaryText
			ifTrue: [^ false].
	aPluggableShoutMorphOrView getTextSelector = #blockCode
			ifTrue: [^ true].
	 ^ false

]
