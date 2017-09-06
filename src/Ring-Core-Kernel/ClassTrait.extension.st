Extension {
	#name : #ClassTrait
}

{
	#category : #'*Ring-Core-Kernel',
	#timestamp : ' 8/31/2017 07:17:01'
}
ClassTrait>>asFullRingDefinition [

	^ self theNonMetaClass asFullRingDefinition theMetaClass
]

{
	#category : #'*Ring-Core-Kernel',
	#timestamp : ' 8/31/2017 07:17:01'
}
ClassTrait>>asRingDefinition [

	^ self theNonMetaClass asRingDefinition theMetaClass
]
