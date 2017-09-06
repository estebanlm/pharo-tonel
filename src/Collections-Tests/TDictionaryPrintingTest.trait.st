"
A trait for test purposes
"
Trait {
	#name : #TDictionaryPrintingTest,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Collections-Tests-Unordered,
	#timestamp : 'TorstenBergmann 2/20/2014 15:34'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryPrintingTest>>emptyDict [
	self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryPrintingTest>>newEmptyDict [
	self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryPrintingTest>>nonEmptyDict [
	self explicitRequirement
]

{
	#category : #'test - printing',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryPrintingTest>>testPrintElementsOn [
	| str |
	str := String new writeStream.
	self nonEmptyDict printElementsOn: str.
	self assert: (str contents = '(#a->1 #b->30 #c->1 #d->-2 )')
]

{
	#category : #'test - printing',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryPrintingTest>>testStoreOn [
	| str |
	str := String new writeStream.
	self nonEmptyDict storeOn: str.
	self assert: str contents = '((Dictionary new) add: (#b->30); add: (#c->1); add: (#d->-2); add: (#a->1); yourself)'
]
