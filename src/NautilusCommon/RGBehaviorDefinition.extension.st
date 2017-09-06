Extension {
	#name : #RGBehaviorDefinition
}

{
	#category : #'*NautilusCommon',
	#timestamp : ' 8/31/2017 05:26:22'
}
RGBehaviorDefinition>>addCategory: newName before: aCategory [

	^ self addProtocol: newName
]
