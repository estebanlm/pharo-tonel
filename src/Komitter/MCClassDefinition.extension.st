Extension {
	#name : #MCClassDefinition
}

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCClassDefinition>>addOperation: aMCRemoval on: aKOClass [

	aKOClass addClassDefinition: aMCRemoval
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCClassDefinition>>koClass [
	self className ifNil: [ ^ nil ] ifNotNil: [ :cname | ^ KomitClass trackedClass: cname ]
]
