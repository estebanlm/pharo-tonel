"
SUnit tests for true/True class
"
Class {
	#name : #TrueTest,
	#superclass : #ClassTestCase,
	#category : #Kernel-Tests-Objects,
	#timestamp : 'TorstenBergmann 2/5/2014 08:49'
}

{
	#category : #'tests logical operations',
	#timestamp : ' 8/31/2017 05:26:30'
}
TrueTest>>testAND [

	self assert: (true & true).
	self deny: (true & false).
]

{
	#category : #'tests controlling',
	#timestamp : ' 8/31/2017 05:26:30'
}
TrueTest>>testAnd [
	
	self assert: ((true and: ['alternativeBlock']) = 'alternativeBlock'). 
]

{
	#category : #'tests converting',
	#timestamp : ' 8/31/2017 05:26:30'
}
TrueTest>>testAsBit [

       self assert: (true asBit = 1).
]

{
	#category : #'tests controlling',
	#timestamp : ' 8/31/2017 05:26:30'
}
TrueTest>>testIfFalse [
	
	self assert: ((true ifFalse: ['alternativeBlock']) isNil). 
]

{
	#category : #'tests controlling',
	#timestamp : ' 8/31/2017 05:26:30'
}
TrueTest>>testIfFalseIfTrue [

	self assert: (true ifFalse: ['falseAlternativeBlock'] 
                      ifTrue: ['trueAlternativeBlock']) = 'trueAlternativeBlock'. 
]

{
	#category : #'tests controlling',
	#timestamp : ' 8/31/2017 05:26:30'
}
TrueTest>>testIfTrue [

	self assert: ((true ifTrue: ['alternativeBlock']) = 'alternativeBlock'). 
]

{
	#category : #'tests controlling',
	#timestamp : ' 8/31/2017 05:26:30'
}
TrueTest>>testIfTrueIfFalse [

	self assert: (true ifTrue: ['trueAlternativeBlock'] 
                      ifFalse: ['falseAlternativeBlock']) = 'trueAlternativeBlock'. 
]

{
	#category : #'tests instance creation',
	#timestamp : ' 8/31/2017 05:26:30'
}
TrueTest>>testNew [

	self should: [True new] raise: self defaultTestError 
]

{
	#category : #'tests logical operations',
	#timestamp : ' 8/31/2017 05:26:30'
}
TrueTest>>testNot [

	self deny: (true not).
]

{
	#category : #'tests logical operations',
	#timestamp : ' 8/31/2017 05:26:30'
}
TrueTest>>testOR [

	self assert: (true | true).
	self assert: (true | false).
]

{
	#category : #'tests controlling',
	#timestamp : ' 8/31/2017 05:26:30'
}
TrueTest>>testOr [

	self assert: (true or: [ 'alternativeBlock' ])
]

{
	#category : #'tests printing',
	#timestamp : ' 8/31/2017 05:26:30'
}
TrueTest>>testPrintOn [

	self assert: (String streamContents: [:stream | true printOn: stream]) = 'true'. 
]

{
	#category : #'tests logical operations',
	#timestamp : ' 8/31/2017 05:26:30'
}
TrueTest>>testXor [
	self assert: (true xor: true) = false.
	self assert: (true xor: false) = true.
	self assert: (true xor: [true]) = false.
	self assert: (true xor: [false]) = true.
]
