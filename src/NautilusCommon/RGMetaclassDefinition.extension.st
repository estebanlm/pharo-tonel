Extension {
	#name : #RGMetaclassDefinition
}

{
	#category : #'*NautilusCommon',
	#timestamp : ' 8/31/2017 05:26:22'
}
RGMetaclassDefinition>>inheritsFrom: aClass [

	^ self realClass inheritsFrom: aClass
]
