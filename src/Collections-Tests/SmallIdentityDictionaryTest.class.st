"
SUnit tests for small identity dictionaries
"
Class {
	#name : #SmallIdentityDictionaryTest,
	#superclass : #SmallDictionaryTest,
	#category : #Collections-Tests-Unordered,
	#timestamp : 'TorstenBergmann 2/20/2014 15:22'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
SmallIdentityDictionaryTest>>canBeUnhealthy [
	^ false
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
SmallIdentityDictionaryTest>>classToBeTested  [

^ SmallIdentityDictionary
]
