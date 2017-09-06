Extension {
	#name : #RBAddClassChange
}

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAddClassChange>>nameToDisplay [

	^ self changeString
]

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAddClassChange>>textToDisplay [

	^ self definition
]
