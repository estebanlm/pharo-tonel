Extension {
	#name : #TheManifestBuilder
}

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
TheManifestBuilder>>banRule: aRule for: anEntity [
	| name number |
	  name := aRule class name.
	number := aRule class identifierMinorVersionNumber.

	(self hasFalsePositiveOf: name version: number) ifFalse: [ 
		self installFalsePositiveOf: name version: number ].
	
	self
		addFalsePositive: anEntity
		of: name
		version: number
]

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
TheManifestBuilder>>bansRule: aRule for: anEntity [
	| name number |
	  name := aRule class name.
	number := aRule class identifierMinorVersionNumber.
	
	^ self
		containsFalsePositive: anEntity onRule: name version: number
]
