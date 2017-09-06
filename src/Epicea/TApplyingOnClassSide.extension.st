Extension {
	#name : #TApplyingOnClassSide
}

{
	#category : #'*Epicea-Ring',
	#timestamp : ' 8/31/2017 05:26:27'
}
TApplyingOnClassSide>>asEpiceaRingDefinition [
	"Answer a Ring definition as Epicea requires it (customized for serialization)."

	^ self explicitRequirement
]
