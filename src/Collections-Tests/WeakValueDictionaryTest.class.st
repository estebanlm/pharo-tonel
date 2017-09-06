"
SUnit tests for weak value dictionaries
"
Class {
	#name : #WeakValueDictionaryTest,
	#superclass : #DictionaryTest,
	#category : #Collections-Tests-Weak,
	#timestamp : 'TorstenBergmann 2/20/2014 15:27'
}

{
	#category : #'building suites',
	#timestamp : ' 8/31/2017 05:26:28'
}
WeakValueDictionaryTest class>>shouldInheritSelectors [

^true
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
WeakValueDictionaryTest>>classToBeTested [

^ WeakValueDictionary
]
