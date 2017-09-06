Extension {
	#name : #TraitDescription
}

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
TraitDescription>>assignmentNodes [
	^self methods flatCollect: [ :each | each assignmentNodes ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
TraitDescription>>blockNodes [
	^self methods flatCollect: [ :each | each blockNodes ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
TraitDescription>>instanceVariableReadNodes [
	^self methods flatCollect: [ :each | each instanceVariableReadNodes ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
TraitDescription>>instanceVariableWriteNodes [
	^self methods flatCollect: [ :each | each instanceVariableWriteNodes ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
TraitDescription>>sendNodes [
	^self methods flatCollect: [ :each | each sendNodes ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
TraitDescription>>variableNodes [
	^self methods flatCollect: [ :each | each variableNodes ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
TraitDescription>>variableReadNodes [
	^self methods flatCollect: [ :each | each variableReadNodes ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
TraitDescription>>variableWriteNodes [
	^self methods flatCollect: [ :each | each variableWriteNodes ]
]
