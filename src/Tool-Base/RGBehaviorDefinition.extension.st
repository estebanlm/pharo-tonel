Extension {
	#name : #RGBehaviorDefinition
}

{
	#category : #'*Tool-Base',
	#timestamp : ' 8/31/2017 05:26:18'
}
RGBehaviorDefinition>>browse [

	^ Smalltalk tools browser openOnClass: self realClass
]
