"

"
Class {
	#name : #NECStringSortingTest,
	#superclass : #TestCase,
	#category : #NECompletion-Tests,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECStringSortingTest>>testCaseSensitiveMap [
	| map colon o |
	map := String classPool at: #CaseSensitiveOrder.
	colon := map at: $: asciiValue + 1.
	o := map at: $O asciiValue + 1.
	self assert: colon > o
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECStringSortingTest>>testCompare [
	self assert: ('at:' compare: 'atOne' caseSensitive: false)
			== 1
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECStringSortingTest>>testCompareWithCase [
	self assert: ('at:' compare: 'atOne' caseSensitive: true)
			== 3
]
