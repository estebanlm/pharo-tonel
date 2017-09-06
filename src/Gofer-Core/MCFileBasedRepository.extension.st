Extension {
	#name : #MCFileBasedRepository
}

{
	#category : #'*gofer-core-accessing',
	#timestamp : ' 8/31/2017 07:16:48'
}
MCFileBasedRepository>>goferReferences [
	| versionNames |
	versionNames := [ self allVersionNames ]
		on: MCRepositoryError
		do: [ :error | ^ GoferRepositoryError signal: error messageText repository: self ].
	^ versionNames collect: [ :each | GoferResolvedReference name: each repository: self ]
]
