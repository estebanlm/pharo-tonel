Extension {
	#name : #Context
}

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
Context>>hasTemporaryVariableNamed: aName [
	^(self tempNames includes: aName)
]

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
Context>>temporaryVariableNamed: aName [
	(self hasTemporaryVariableNamed: aName)
		ifFalse: [ ^ nil ].
	^TemporaryVariable name: aName context: self

]

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
Context>>temporaryVariables [
	^self tempNames collect: [ :name | TemporaryVariable new name: name ]

]
