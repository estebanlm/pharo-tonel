"
A trait for test purposes
"
Trait {
	#name : #TDictionaryCopyingTest,
	#traits : 'TCloneTest',
	#classTraits : 'TCloneTest classTrait',
	#category : #Collections-Tests-Unordered,
	#timestamp : 'TorstenBergmann 2/20/2014 15:33'
}

{
	#category : #helper,
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryCopyingTest>>empty [

	^ self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryCopyingTest>>emptyDict [
	self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryCopyingTest>>newEmptyDict [
	self explicitRequirement
]

{
	#category : #helper,
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryCopyingTest>>nonEmpty [

	^ self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryCopyingTest>>nonEmptyDict [
	self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryCopyingTest>>nonEmptyDifferentFromNonEmptyDict [
" return a dictionary for which all keys are not included in nonEmptyDict"
self explicitRequirement.
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryCopyingTest>>test0FixtureCloneTest [
	self nonEmpty.
	self deny: self nonEmpty isEmpty.
	self empty.
	self assert: self empty isEmpty
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryCopyingTest>>test0FixtureDictionaryCopyingTest [
	| duplicateKey |
	self nonEmptyDict.
	self deny: self nonEmptyDict isEmpty.
	self nonEmptyDifferentFromNonEmptyDict.
	self deny: self nonEmptyDifferentFromNonEmptyDict isEmpty.
	duplicateKey := true.
	self nonEmptyDict keys
		detect: [ :key | self nonEmptyDifferentFromNonEmptyDict includes: key ]
		ifNone: [ duplicateKey := false ].
	self assert: duplicateKey = false
]

{
	#category : #'tests - copy - clone',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryCopyingTest>>testCopyCreatesNewObject [
	"self debug: #testCopyCreatesNewObject"
	
	| copy | 
	copy := self nonEmpty copy.
	self deny: self nonEmpty == copy.
	
]

{
	#category : #'tests - copy - clone',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryCopyingTest>>testCopyEmpty [
	"self debug: #testCopyEmpty"
	
	| copy | 
	copy := self empty copy.
	self assert: copy isEmpty.
]

{
	#category : #'tests - copy - clone',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryCopyingTest>>testCopyNonEmpty [
	"self debug: #testCopyNonEmpty"
	
	| copy | 
	copy := self nonEmpty copy.
	self deny: copy isEmpty.
	self assert: copy size = self nonEmpty size.
	self nonEmpty do: 
		[:each | copy includes: each]
]

{
	#category : #'test - copying',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryCopyingTest>>testDictionaryConcatenationWithCommonKeys [

	| dictionary1 dictionary2 result |
	dictionary1 := self nonEmptyDict.
	dictionary2 := self nonEmptyDict.
	result := dictionary1 , dictionary2.
	self assert: result size = ( dictionary2 size).
	
	dictionary2 associationsDo: [ :assoc | self assert: (result at: assoc key) = assoc value ]
]

{
	#category : #'test - copying',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryCopyingTest>>testDictionaryConcatenationWithCommonKeysDifferentValues [

	| dictionary1 dictionary2 result value |
	
	dictionary1 := self nonEmptyDict.
	value := self nonEmptyDifferentFromNonEmptyDict   values anyOne.
	dictionary2 := dictionary1 copy.
	dictionary2 keys do: [ :key | dictionary2 at: key put: value ].
	
	
	result := dictionary1 , dictionary2.
	self assert: result size = ( dictionary2 size).
	
	dictionary2 associationsDo: [ :assoc | self assert: (result at: assoc key) = assoc value ]
]

{
	#category : #'test - copying',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryCopyingTest>>testDictionaryConcatenationWithoutCommonKeys [

	| dictionary1 dictionary2 result |
	dictionary1 := self nonEmptyDict.
	dictionary2 := self nonEmptyDifferentFromNonEmptyDict.
	result := dictionary1 , dictionary2.
	self assert: result size = (dictionary1 size + dictionary2 size).
	dictionary1 associationsDo: [ :assoc | self assert: (result at: assoc key) = assoc value ].
	dictionary2 associationsDo: [ :assoc | self assert: (result at: assoc key) = assoc value ]
]
