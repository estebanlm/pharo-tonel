"
SUnit tests for small dictionaries
"
Class {
	#name : #SmallDictionaryTest,
	#superclass : #DictionaryTest,
	#category : #Collections-Tests-Unordered,
	#timestamp : 'TorstenBergmann 2/20/2014 15:22'
}

{
	#category : #'building suites',
	#timestamp : ' 8/31/2017 05:26:28'
}
SmallDictionaryTest class>>shouldInheritSelectors [

^true
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
SmallDictionaryTest>>classToBeTested [

	^ SmallDictionary
]

{
	#category : #'test - printing',
	#timestamp : ' 8/31/2017 05:26:28'
}
SmallDictionaryTest>>testStoreOn [
	"self debug: #testStoreOn"
	
	self assert: self nonEmptyDict storeString = ('((', self nonEmptyDict class printString , ' new) add: (#a->1); add: (#b->30); add: (#c->1); add: (#d->-2); yourself)')
]
