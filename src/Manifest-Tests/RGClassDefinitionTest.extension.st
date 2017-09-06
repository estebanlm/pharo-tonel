Extension {
	#name : #RGClassDefinitionTest
}

{
	#category : #'*Manifest-Tests',
	#timestamp : ' 8/31/2017 05:26:43'
}
RGClassDefinitionTest>>testArrayStringForManifest [
	| class |
	class := self class.

 	self
		assert: class asRingDefinition arrayStringForManifest
		equals: { #RGClassDefinition . { class name asSymbol } }
]

{
	#category : #'*Manifest-Tests',
	#timestamp : ' 8/31/2017 05:26:43'
}
RGClassDefinitionTest>>testManifestReadOn [
	| class |
	class := self class.

 	self
		assert: (RGClassDefinition manifestReadOn: { class name asSymbol })
		equals: class asRingDefinition 
]
