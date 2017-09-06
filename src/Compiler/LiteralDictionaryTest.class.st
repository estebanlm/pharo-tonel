"
SUnit tests for literal dictionaries
"
Class {
	#name : #LiteralDictionaryTest,
	#superclass : #DictionaryTest,
	#category : #Compiler-Tests,
	#timestamp : 'TorstenBergmann 2/20/2014 15:21'
}

{
	#category : #'building suites',
	#timestamp : ' 8/31/2017 07:16:32'
}
LiteralDictionaryTest class>>shouldInheritSelectors [

^true
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 07:16:32'
}
LiteralDictionaryTest>>classToBeTested [

^ LiteralDictionary
]

{
	#category : #'tests - literal specific behavior',
	#timestamp : ' 8/31/2017 07:16:32'
}
LiteralDictionaryTest>>testIncludesWithEqualElementFromDifferentClasses [

| dict |
dict := self classToBeTested new.

dict at: 1 put: 'element1'.
dict at: #key put: 1.0.

self deny: (dict includesKey: 1.0).
self assert: (dict includes: 1)
]

{
	#category : #problems,
	#timestamp : ' 8/31/2017 07:16:32'
}
LiteralDictionaryTest>>testUnCategorizedMethods [
"this test doesn't pass :"
	| categories slips  |
	categories := self categoriesForClass: self targetClass.
	slips := categories select: [:each | each = #'as yet unclassified'].
	self should: [slips isEmpty].	
]
