Extension {
	#name : #RGMethodDefinitionTest
}

{
	#category : #'*Manifest-Tests',
	#timestamp : ' 8/31/2017 05:26:43'
}
RGMethodDefinitionTest>>testArrayStringForManifest [
	| method |
	method := thisContext method.

 	self
		assert: method asRingDefinition arrayStringForManifest
		equals: { #RGMethodDefinition . { self class name asSymbol . method selector . #false } }
]

{
	#category : #'*Manifest-Tests',
	#timestamp : ' 8/31/2017 05:26:43'
}
RGMethodDefinitionTest>>testManifestReadOn [
	| method |
	method := thisContext method.

 	self
		assert: (RGMethodDefinition manifestReadOn: {
			self class name asSymbol .
			method selector .
			#false })
		equals: method asRingDefinition
]

{
	#category : #'*Manifest-Tests',
	#timestamp : ' 8/31/2017 05:26:43'
}
RGMethodDefinitionTest>>testReadFrom [
	"self debug: #testReadFrom"
	
	
	| st rg |
	rg := (Point>>#x) asRingDefinition.
	st := String streamContents: [:s |
		
		rg storeOn: s.
		s contents].
	self assert: (Object readFrom: st) = rg 
]

{
	#category : #'*Manifest-Tests',
	#timestamp : ' 8/31/2017 05:26:43'
}
RGMethodDefinitionTest>>testStoreOn [
	"self debug: #testStoreOn"
	
	
	| st |
	st := String streamContents: [:s |
		
		(Point>>#x) asRingDefinition storeOn: s.
		s contents].
	self assert: st = '(RGMethodDefinition className: ''Point'' selector: #x isMetaSide: false)'
]
