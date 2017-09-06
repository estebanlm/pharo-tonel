Extension {
	#name : #RGElementDefinition
}

{
	#category : #'*Epicea-Ring',
	#timestamp : ' 8/31/2017 05:26:27'
}
RGElementDefinition>>asEpiceaRingDefinition [

	^ self shallowCopy
		epiceaCleanUp;
		yourself
]

{
	#category : #'*Epicea-Ring',
	#timestamp : ' 8/31/2017 05:26:27'
}
RGElementDefinition>>epiceaCleanUp [

	parent := nil.

]
