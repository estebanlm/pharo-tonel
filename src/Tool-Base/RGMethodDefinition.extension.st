Extension {
	#name : #RGMethodDefinition
}

{
	#category : #'*Tool-Base',
	#timestamp : ' 8/31/2017 05:26:18'
}
RGMethodDefinition>>browse [

	^ Smalltalk tools browser
		openOnClass: self realClass 
		selector: (self isDefined ifTrue: [ self selector ] ifFalse: [ nil ])
]
