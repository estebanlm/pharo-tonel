Extension {
	#name : #CompiledMethod
}

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
CompiledMethod>>hasTemporaryVariableNamed: aName [
	^(self tempNames includes: aName)
	
]

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
CompiledMethod>>removeSavedTemp: aTemp [
	self savedTemps ifNotNil: [ :saved | 
			saved remove: aTemp.
			saved ifEmpty: [ self removeProperty: #savedTemps ] ]
]

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
CompiledMethod>>saveTemp: aTemp [
	self savedTemps ifNil: [ self propertyAt: #savedTemps put: Set new].
	self savedTemps add: aTemp.
]

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
CompiledMethod>>savedTemps [
	^self propertyAt: #savedTemps ifAbsent: nil
]

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
CompiledMethod>>temporaryVariableNamed: aName [
	(self hasTemporaryVariableNamed: aName) ifFalse: [ ^nil ].
	^TemporaryVariable 
		name: aName 
		method: self 


]

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
CompiledMethod>>temporaryVariables [
	^self tempNames collect: [ :name | TemporaryVariable new name: name ]

]
