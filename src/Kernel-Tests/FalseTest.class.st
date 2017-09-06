"
SUnit tests for false/False class
"
Class {
	#name : #FalseTest,
	#superclass : #ClassTestCase,
	#category : #Kernel-Tests-Objects,
	#timestamp : 'TorstenBergmann 2/5/2014 08:50'
}

{
	#category : #'tests logical operations',
	#timestamp : ' 8/31/2017 05:26:30'
}
FalseTest>>testAND [

	self deny: (false & true).
	self deny: (false & false).
]

{
	#category : #'tests controlling',
	#timestamp : ' 8/31/2017 05:26:30'
}
FalseTest>>testAnd [

	self deny: (false and: ['alternativeBlock']).
]

{
	#category : #'tests converting',
	#timestamp : ' 8/31/2017 05:26:30'
}
FalseTest>>testAsBit [

       self assert: (false asBit = 0).
]

{
	#category : #'tests controlling',
	#timestamp : ' 8/31/2017 05:26:30'
}
FalseTest>>testIfFalse [
	
	self assert: ((false ifFalse: ['alternativeBlock']) = 'alternativeBlock'). 
]

{
	#category : #'tests controlling',
	#timestamp : ' 8/31/2017 05:26:30'
}
FalseTest>>testIfFalseIfTrue [

	self assert: (false ifFalse: ['falseAlternativeBlock'] 
                      ifTrue: ['trueAlternativeBlock']) = 'falseAlternativeBlock'. 
]

{
	#category : #'tests controlling',
	#timestamp : ' 8/31/2017 05:26:30'
}
FalseTest>>testIfTrue [
	self
		assert:
			(false
				ifTrue: [ 'alternativeBlock' ]) isNil
]

{
	#category : #'tests controlling',
	#timestamp : ' 8/31/2017 05:26:30'
}
FalseTest>>testIfTrueIfFalse [

	self assert: (false ifTrue: ['trueAlternativeBlock'] 
                      ifFalse: ['falseAlternativeBlock']) = 'falseAlternativeBlock'. 
]

{
	#category : #'tests instance creation',
	#timestamp : ' 8/31/2017 05:26:30'
}
FalseTest>>testNew [

	self should: [False new] raise: self defaultTestError 
]

{
	#category : #'tests logical operations',
	#timestamp : ' 8/31/2017 05:26:30'
}
FalseTest>>testNot [

	self assert: (false not).
]

{
	#category : #'tests logical operations',
	#timestamp : ' 8/31/2017 05:26:30'
}
FalseTest>>testOR [

	self assert: (false | true).
	self deny: (false | false).
]

{
	#category : #'tests controlling',
	#timestamp : ' 8/31/2017 05:26:30'
}
FalseTest>>testOr [

	self assert: (false or: ['alternativeBlock']) = 'alternativeBlock'.
]

{
	#category : #'tests printing',
	#timestamp : ' 8/31/2017 05:26:30'
}
FalseTest>>testPrintOn [

	self assert: (String streamContents: [:stream | false printOn: stream]) = 'false'. 
]

{
	#category : #'tests logical operations',
	#timestamp : ' 8/31/2017 05:26:30'
}
FalseTest>>testXor [
	self assert: (false xor: true) = true.
	self assert: (false xor: false) = false.
	self assert: (false xor: [true]) = true.
	self assert: (false xor: [false]) = false.
]
