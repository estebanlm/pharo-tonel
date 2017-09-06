Extension {
	#name : #RGTraitDefinition
}

{
	#category : #'*NautilusCommon',
	#timestamp : ' 8/31/2017 05:26:22'
}
RGTraitDefinition>>inheritsFrom: aClass [

	^ self realClass inheritsFrom: aClass
]
