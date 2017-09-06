"
A trait for test purposes
"
Trait {
	#name : #TDictionaryKeyAccessTest,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Collections-Tests-Unordered,
	#timestamp : 'TorstenBergmann 2/20/2014 15:34'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryKeyAccessTest>>nonEmptyWithoutEqualsValues [
" return a dictionary that doesn't include equal values'"
^self explicitRequirement
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryKeyAccessTest>>test0FixtureDictionaryKeyAccess [
	| collection equals |
	self nonEmptyWithoutEqualsValues.
	self deny: self nonEmptyWithoutEqualsValues isEmpty.
	equals := true.
	collection := self nonEmptyWithoutEqualsValues values.
	collection detect: [ :each | (collection occurrencesOf: each) > 1 ] ifNone: [ equals := false ].
	self assert: equals = false.
	self valueNotIn.
	self deny: (self nonEmptyWithoutEqualsValues values includes: self valueNotIn)
]

{
	#category : #'tests - dictionary key access',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryKeyAccessTest>>testKeyAtIdentityValue [
	
	
	| dict value result |
	dict := self nonEmpty .
	value := dict values anyOne.
	
	result := dict keyAtIdentityValue: value.
	self assert: (dict at: result) = value.
		
	self should: [dict keyAtIdentityValue: self valueNotIn ] raise: Error
	
	
]

{
	#category : #'tests - dictionary key access',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryKeyAccessTest>>testKeyAtIdentityValueIfAbsent [
	"self run: #testKeyAtValue"
	"self debug: #testKeyAtValue"
	
	| dict value result |
	dict := self nonEmpty .
	value := dict values anyOne.
	
	result := dict keyAtIdentityValue: value ifAbsent: [nil].
	self assert: (dict at: result) = value.
		
	self assert: (dict keyAtIdentityValue: self valueNotIn ifAbsent: [nil] ) = nil. 
	
]

{
	#category : #'tests - dictionary key access',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryKeyAccessTest>>testKeyAtValue [
	"self run: #testKeyAtValue"
	"self debug: #testKeyAtValue"
	
	| dict value result |
	dict := self nonEmpty .
	value := dict values anyOne.
	
	result := dict keyAtValue: value.
	self assert: (dict at: result) = value.
		
	self should: [dict keyAtValue: self valueNotIn ] raise: Error
	
	
]

{
	#category : #'tests - dictionary key access',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryKeyAccessTest>>testKeyAtValueIfAbsent [
	"self run: #testKeyAtValue"
	"self debug: #testKeyAtValue"
	
	| dict value result |
	dict := self nonEmpty .
	value := dict values anyOne.
	
	result := dict keyAtValue: value ifAbsent: [nil].
	self assert: (dict at: result) = value.
		
	self assert: (dict keyAtValue: self valueNotIn ifAbsent: [nil] ) = nil. 
	
	
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryKeyAccessTest>>valueNotIn [
" return a value not included in nonEmptyWithoutEqualValues "
^self explicitRequirement
]
