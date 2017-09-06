Extension {
	#name : #RGClassDefinition
}

{
	#category : #'*NautilusCommon',
	#timestamp : ' 8/31/2017 05:26:22'
}
RGClassDefinition>>compile: aString classified: aCategory notifying: aController [

	self realClass compile: aString classified: aCategory notifying: aController
]

{
	#category : #'*NautilusCommon',
	#timestamp : ' 8/31/2017 05:26:22'
}
RGClassDefinition>>inheritsFrom: aClass [

	^ self realClass inheritsFrom: aClass
]
