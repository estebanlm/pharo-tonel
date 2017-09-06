Extension {
	#name : #TClassDescription
}

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
TClassDescription>>assignmentNodes [
	^self methods flatCollect: [ :each | each assignmentNodes ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
TClassDescription>>blockNodes [
	^self methods flatCollect: [ :each | each blockNodes ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
TClassDescription>>instanceVariableReadNodes [
	^self methods flatCollect: [ :each | each instanceVariableReadNodes ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
TClassDescription>>instanceVariableWriteNodes [
	^self methods flatCollect: [ :each | each instanceVariableWriteNodes ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
TClassDescription>>sendNodes [
	^self methods flatCollect: [ :each | each sendNodes ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
TClassDescription>>variableNodes [
	^self methods flatCollect: [ :each | each variableNodes ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
TClassDescription>>variableReadNodes [
	^self methods flatCollect: [ :each | each variableReadNodes ]
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
TClassDescription>>variableWriteNodes [
	^self methods flatCollect: [ :each | each variableWriteNodes ]
]
