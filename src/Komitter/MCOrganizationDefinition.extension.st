Extension {
	#name : #MCOrganizationDefinition
}

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCOrganizationDefinition>>addOperation: aMCModification on: aKOClass  [
	
	^ aKOClass addOrganizationDefinition: aMCModification
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCOrganizationDefinition>>koClass [
	self className ifNil: [ ^ nil ] ifNotNil: [ :cname | ^ KomitClass trackedClass: cname ]
]
