Extension {
	#name : #String
}

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
String>>asExternalTypeOn: generator [
	^ generator resolveType: self
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
String class>>asExternalTypeOn: generator  [
	^ generator resolveType: #FFIExternalString
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
String>>asFFILibrary  [
	^ FFIUnknownLibrary name: self
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
String>>packToArity: arity [
	"WARNING: Here applies the same rules as in ByteArray>>#rollToArity:, check there!"
	arity = 1 ifTrue: [ ^ self ].
	self error: 'Use ExternalAddress instead!'
]
