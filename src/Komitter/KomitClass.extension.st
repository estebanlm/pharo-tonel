Extension {
	#name : #KomitClass
}

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClass>>addClassDefinition: aMCRemoval  [

	self definition: aMCRemoval
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClass>>addMethodDefinition: aMCAddition [

	self addOperation: aMCAddition
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClass>>addOrganizationDefinition: aMCModification  [
	
	self addOperation: aMCModification
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClass>>koDestinationText [

	^ self isDirty
		ifTrue: [ self definition koDestinationText ]
		ifFalse: [ '' ]
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClass>>koSourceText [

	^ self isDirty
		ifFalse: [ 'No changes' ]
		ifTrue: [ self definition koSourceText ]
]
