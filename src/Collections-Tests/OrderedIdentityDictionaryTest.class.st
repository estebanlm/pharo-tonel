"

"
Class {
	#name : #OrderedIdentityDictionaryTest,
	#superclass : #OrderedDictionaryTest,
	#category : #Collections-Tests-Sequenceable,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
OrderedIdentityDictionaryTest>>dictionaryClass [
	^ OrderedIdentityDictionary
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
OrderedIdentityDictionaryTest>>isTestingIdentityDictionary [
	^ true
]
