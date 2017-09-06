"

"
Class {
	#name : #WeakIdentityValueDictionaryTests,
	#superclass : #WeakValueDictionaryTest,
	#category : #Collections-Tests-Weak,
	#timestamp : ''
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
WeakIdentityValueDictionaryTests>>canBeUnhealthy [
	^ false
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
WeakIdentityValueDictionaryTests>>classToBeTested [

	^WeakIdentityValueDictionary 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
WeakIdentityValueDictionaryTests>>testIdentity [
	| dict key |
	dict := self classToBeTested new.
	key := 'key'.
	dict at: key put: 2.5.
	 
	
	self assert: (dict includesKey: key).
	self deny: (dict includesKey: key copy).
]
