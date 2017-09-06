Extension {
	#name : #ClassDescription
}

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
ClassDescription>>assignmentNodes [
	^self methods flatCollect: [ :each | each assignmentNodes ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
ClassDescription>>blockNodes [
	^self methods flatCollect: [ :each | each blockNodes ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
ClassDescription>>instanceVariableReadNodes [
	^self methods flatCollect: [ :each | each instanceVariableReadNodes ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
ClassDescription>>instanceVariableWriteNodes [
	^self methods flatCollect: [ :each | each instanceVariableWriteNodes ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
ClassDescription>>sendNodes [
	^self methods flatCollect: [ :each | each sendNodes ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
ClassDescription>>variableNodes [
	^self methods flatCollect: [ :each | each variableNodes ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
ClassDescription>>variableReadNodes [
	^self methods flatCollect: [ :each | each variableReadNodes ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
ClassDescription>>variableWriteNodes [
	^self methods flatCollect: [ :each | each variableWriteNodes ]
]
