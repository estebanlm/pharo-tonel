Extension {
	#name : #RPackageOrganizer
}

{
	#category : #'*Nautilus',
	#timestamp : ' 8/31/2017 05:26:22'
}
RPackageOrganizer>>createPackageNamed: aString [

	| instance |
	(packages includesKey: aString asSymbol) ifTrue: [ 
			self openAlreadyExistingError.
			^ nil ].
	
	instance := self packageClass named: aString.
	self registerPackage: instance.
	^ instance
]

{
	#category : #'*Nautilus',
	#timestamp : ' 8/31/2017 05:26:22'
}
RPackageOrganizer>>openAlreadyExistingError [

	StandardWindow new alert: 'A package with this name already exists' title: 'Already exists'
]
