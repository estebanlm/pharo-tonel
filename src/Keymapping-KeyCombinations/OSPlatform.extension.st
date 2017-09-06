Extension {
	#name : #OSPlatform
}

{
	#category : #'*Keymapping-KeyCombinations',
	#timestamp : ' 8/31/2017 05:26:19'
}
OSPlatform>>defaultModifier [

	^ self subclassResponsibility
]
