"
A trait for test purposes
"
Trait {
	#name : #TDictionaryComparingTest,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Collections-Tests-Unordered,
	#timestamp : 'TorstenBergmann 2/20/2014 15:33'
}

{
	#category : #'test - comparing',
	#timestamp : ' 8/31/2017 05:26:28'
}
TDictionaryComparingTest>>testEquality [
	| nonEmptyDict2 |
	nonEmptyDict2 := self nonEmpty class new.
	self nonEmpty keysAndValuesDo:  [ :key :value | nonEmptyDict2 at: key put: value  ].
	
	self assert: (self nonEmptyDict = nonEmptyDict2)
]
