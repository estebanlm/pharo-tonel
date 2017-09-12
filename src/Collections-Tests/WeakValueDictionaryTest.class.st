"
SUnit tests for weak value dictionaries
"
Class {
	#name : #WeakValueDictionaryTest,
	#superclass : #DictionaryTest,
	#category : #Collections-Tests-Weak
}

{ #category : #'building suites' }
WeakValueDictionaryTest class >> shouldInheritSelectors [

^true
]

{ #category : #requirements }
WeakValueDictionaryTest >> classToBeTested [

^ WeakValueDictionary
]
