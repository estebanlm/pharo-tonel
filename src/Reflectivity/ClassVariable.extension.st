Extension {
	#name : #ClassVariable
}

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
ClassVariable>>astNodes [
	^self definingClass variableNodes select: [ :each | each binding variable == self ]
]
