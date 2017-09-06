Extension {
	#name : #GlobalVariable
}

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
GlobalVariable>>astNodes [
	^self usingMethods flatCollect: [ :method | 
		method variableNodes select: [: each| each binding variable == self ]]
]
