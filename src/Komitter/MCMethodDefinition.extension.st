Extension {
	#name : #MCMethodDefinition
}

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCMethodDefinition>>addOperation: aMCAddition on: aKOClass  [
	
	aKOClass addMethodDefinition: aMCAddition
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCMethodDefinition>>koClass [
	^ self className 
		ifNil: [ nil ] 
		ifNotNil: [ :cname |
			self isExtensionMethod 
				ifTrue: [ KomitClass trackedClass: cname forExtension: self  protocol ]
				ifFalse: [ KomitClass trackedClass: cname ] ]
]
