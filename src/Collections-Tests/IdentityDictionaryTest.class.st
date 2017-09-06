"
SUnit tests for identity dictionaries
"
Class {
	#name : #IdentityDictionaryTest,
	#superclass : #DictionaryTest,
	#category : #Collections-Tests-Unordered,
	#timestamp : 'TorstenBergmann 2/20/2014 15:20'
}

{
	#category : #'building suites',
	#timestamp : ' 8/31/2017 05:26:28'
}
IdentityDictionaryTest class>>shouldInheritSelectors [

^true
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
IdentityDictionaryTest>>canBeUnhealthy [
	^ false
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
IdentityDictionaryTest>>classToBeTested [

	^ IdentityDictionary
]

{
	#category : #'tests - identity',
	#timestamp : ' 8/31/2017 05:26:28'
}
IdentityDictionaryTest>>testIdentity [
	| dict key |
	dict := self classToBeTested new.
	key := 'key'.
	dict at: key put: 2.5.
	 
	
	self assert: (dict includesKey: key).
	self deny: (dict includesKey: key copy).
	
"	dict at: 1 put: 'djdh'.
	dict at: 'sksl' put: 1.0.
	self deny: (dict includesKey: 1.0) .
	self assert: (dict includes: 1)"

]
