"
A trait for test purposes
"
Trait {
	#name : #TDictionaryKeysValuesAssociationsAccess,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Collections-Tests-Unordered,
	#timestamp : 'TorstenBergmann 2/20/2014 15:34'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryKeysValuesAssociationsAccess>>nonEmpty [

self explicitRequirement.
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryKeysValuesAssociationsAccess>>test0FixtureDictionaryKeysValuesAssociationsAccess [
	self nonEmpty.
	self deny: self nonEmpty isEmpty
]

{
	#category : #'tests - Dictionary keys values associations access',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryKeysValuesAssociationsAccess>>testAssociations [

	| collection result  |
	collection := self nonEmpty .
	result := collection associations.
	
	self assert: result size = collection size.
	result do: [:assoc | self assert: (assoc value) = (collection at: assoc key) ].
	"keys do: [ :key | self assert: ( result at: key ) = ( collection at: key )] ."
	
]

{
	#category : #'tests - Dictionary keys values associations access',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryKeysValuesAssociationsAccess>>testKeys [
	| collection result |
	collection := self nonEmpty.
	result := collection keys.
	result do: [ :key | collection at: key ].
	self assert: result size = collection size.
	self should: [ result detect: [ :each | (result occurrencesOf: each) > 1 ] ] raise: Error
]

{
	#category : #'tests - Dictionary keys values associations access',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryKeysValuesAssociationsAccess>>testKeysSortedSafely [
	| collection result |
	collection := self nonEmpty.
	result := collection keysSortedSafely.
	result do: [ :key | collection at: key ].
	self assert: result size = collection size.
	self should: [ result detect: [ :each | (result occurrencesOf: each) > 1 ] ] raise: Error.
	self assert: result asArray isSorted
]

{
	#category : #'tests - Dictionary keys values associations access',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryKeysValuesAssociationsAccess>>testValues [
	
	| collection result |
	collection := self nonEmpty .
	result := collection values.
	
	self assert: result size = collection size.
	result do: [:each | self assert: (collection occurrencesOf:each ) = (result occurrencesOf: each) ].
	
]
