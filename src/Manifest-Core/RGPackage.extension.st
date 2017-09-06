Extension {
	#name : #RGPackage
}

{
	#category : #'*Manifest-Core',
	#timestamp : ' 8/31/2017 05:26:30'
}
RGPackage>>arrayStringForManifest [
	| array |
	array := Array new: 2.
	array at: 1 put: self class asString asSymbol.
	array at: 2 put: {(name asSymbol)}.
	^ array
]

{
	#category : #'*Manifest-Core',
	#timestamp : ' 8/31/2017 05:26:30'
}
RGPackage class>>manifestReadOn: aArray [

	^ self named:( aArray first)
]
