Extension {
	#name : #BlockClosure
}

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
BlockClosure>>hasTemporaryVariableNamed: aName [
	^(self tempNames includes: aName)
]

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
BlockClosure>>temporaryVariableNamed: aName [
	(self hasTemporaryVariableNamed: aName) ifFalse: [ ^nil ].
	^TemporaryVariable 
		name: aName 
		block: self 

]

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
BlockClosure>>temporaryVariables [
	^self tempNames collect: [ :name | TemporaryVariable new name: name ]

]
