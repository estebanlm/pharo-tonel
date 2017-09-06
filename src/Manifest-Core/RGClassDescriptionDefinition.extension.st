Extension {
	#name : #RGClassDescriptionDefinition
}

{
	#category : #'*Manifest-Core',
	#timestamp : ' 8/31/2017 05:26:30'
}
RGClassDescriptionDefinition>>arrayStringForManifest [
	| array |
	array := Array new: 2.
	array at: 1 put: self class asString asSymbol.
	array at: 2 put: {(name asSymbol)}.
	^ array
]

{
	#category : #'*manifest-core',
	#timestamp : ' 8/31/2017 05:26:30'
}
RGClassDescriptionDefinition class>>manifestReadOn: aArray [

	^ self named:( aArray first)
]
