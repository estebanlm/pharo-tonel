Extension {
	#name : #RGMetaclassDefinition
}

{
	#category : #'*Manifest-Core',
	#timestamp : ' 8/31/2017 05:26:30'
}
RGMetaclassDefinition>>arrayStringForManifest [
	| array |
	array := Array new: 2.
	array at: 1 put: self class asString asSymbol.
	array
		at: 2
		put:
			{(name asSymbol).
			(self theNonMetaClass asString asSymbol)}.
	^ array
]

{
	#category : #'*Manifest-Core',
	#timestamp : ' 8/31/2017 05:26:30'
}
RGMetaclassDefinition class>>manifestReadOn: aArray [

	^ (self named:( aArray at:1))
		baseClass: (RGClassDefinition named: (aArray at:2))
]
