Extension {
	#name : #ClassTrait
}

{
	#category : #'*Epicea-Ring',
	#timestamp : ' 8/31/2017 05:26:27'
}
ClassTrait>>asEpiceaRingDefinition [

	^ self theNonMetaClass asEpiceaRingDefinition theMetaClass
]
