Extension {
	#name : #TApplyingOnClassSide
}

{
	#category : #'*Ring-Core-Kernel',
	#timestamp : ' 8/31/2017 07:17:01'
}
TApplyingOnClassSide>>asFullRingDefinition [

	^ self theNonMetaClass asFullRingDefinition theMetaClass
]

{
	#category : #'*Ring-Core-Kernel',
	#timestamp : ' 8/31/2017 07:17:01'
}
TApplyingOnClassSide>>asRingDefinition [

	^ self theNonMetaClass asRingDefinition theMetaClass
]
