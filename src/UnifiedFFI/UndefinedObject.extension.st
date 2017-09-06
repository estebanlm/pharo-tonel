Extension {
	#name : #UndefinedObject
}

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
UndefinedObject>>packToArity: aNumber [
	"pointer to NULL is NULL too"
	^ self
]
