"

"
Class {
	#name : #RecursionStopperTest,
	#superclass : #TestCase,
	#instVars : [
		'fork',
		'value'
	],
	#category : #Kernel-Tests-Processes,
	#timestamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:30'
}
RecursionStopperTest>>mixedMethod [

	RecursionStopper during: [ 
		self assert: value equals: 0.
		value := value + 1.
		RecursionStopper during: [ 
			value := value + 1.
		].
		self assert: value equals: 1.
		self mixedMethod.
		self assert: value equals: 1.		
	].
	
	RecursionStopper during: [ 
		self assert: value equals: 1.
		^ 2
	].

	self assert: value equals: 1.
	^ value 
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:30'
}
RecursionStopperTest>>recursion [
	
	RecursionStopper during: [ self recursion ].
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:30'
}
RecursionStopperTest>>setUp [

	value := 0
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:30'
}
RecursionStopperTest>>tearDown [

	fork ifNotNil: [ fork terminate. fork := nil ].
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:30'
}
RecursionStopperTest>>testMixedMethod [

	| result |

	self should: [ result := self mixedMethod ] notTakeMoreThanMilliseconds: 3.
	
	self assert: result equals: 2
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:30'
}
RecursionStopperTest>>testNoRecursion [

	RecursionStopper during: [ value := value + 1 ].

	self assert: value equals: 1
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:30'
}
RecursionStopperTest>>testThreadSafe [

	self should: [ self threadSafe ] notTakeMoreThanMilliseconds: 10.
	
	self assert: fork isNil.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:30'
}
RecursionStopperTest>>testWithRecursion [

	self should: [ self recursion ] notTakeMoreThanMilliseconds: 3.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:30'
}
RecursionStopperTest>>threadSafe [

	| sema |
	
	RecursionStopper during: [ 
		self assert: fork isNil.
		sema := Semaphore new.
		
		fork := [ self threadSafe. sema signal ] fork.	
		
		sema wait.
		self assert: fork isTerminated.
			
		fork := nil.
		
	].	

]
