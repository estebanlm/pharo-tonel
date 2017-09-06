Extension {
	#name : #RGElementDefinition
}

{
	#category : #'*Tool-Base',
	#timestamp : ' 8/31/2017 05:26:18'
}
RGElementDefinition>>browse [

	^ Smalltalk tools browser openOnClass: self realClass
]
