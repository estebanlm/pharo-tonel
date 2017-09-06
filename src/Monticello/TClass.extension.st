Extension {
	#name : #TClass
}

{
	#category : #'*Monticello',
	#timestamp : ' 8/31/2017 07:17:01'
}
TClass>>asClassDefinition [
	^self explicitRequirement.
]

{
	#category : #'*Monticello',
	#timestamp : ' 8/31/2017 07:17:01'
}
TClass>>classDefinitions [
	^self explicitRequirement.
]
