Extension {
	#name : #Association
}

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Association>>stonOn: stonWriter [
	self class == STON associationClass
		ifTrue: [ stonWriter writeAssociation: self ]
		ifFalse: [ super stonOn: stonWriter ]
	
]
