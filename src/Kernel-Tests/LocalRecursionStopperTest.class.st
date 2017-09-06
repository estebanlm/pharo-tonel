"

"
Class {
	#name : #LocalRecursionStopperTest,
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
LocalRecursionStopperTest>>complexRecursion [
	
	LocalRecursionStopper during: [ self complexRecursionFirstCall ].
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:30'
}
LocalRecursionStopperTest>>complexRecursionFirstCall [

	LocalRecursionStopper during: [ self complexRecursionLastCall ]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:30'
}
LocalRecursionStopperTest>>complexRecursionLastCall [
	
	self complexRecursion
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:30'
}
LocalRecursionStopperTest>>mixedMethod [

	LocalRecursionStopper during: [ 
		self assert: value equals: 0.
		value := value + 1.
		LocalRecursionStopper during: [ 
			value := value + 1.
		].
		self assert: value equals: 1.
		self mixedMethod.
		self assert: value equals: 1.		
	].
	
	LocalRecursionStopper during: [ 
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
LocalRecursionStopperTest>>recursion [
	
	LocalRecursionStopper during: [ self recursion ].
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:30'
}
LocalRecursionStopperTest>>setUp [

	value := 0
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:30'
}
LocalRecursionStopperTest>>tearDown [

	fork ifNotNil: [ fork terminate. fork := nil ].
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:30'
}
LocalRecursionStopperTest>>testMixedMethod [

	| result |

	self should: [ result := self mixedMethod ] notTakeMoreThanMilliseconds: 3.
	
	self assert: result equals: 2
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
LocalRecursionStopperTest>>testNoRecursion [

	LocalRecursionStopper during: [ value := value + 1 ].

	self assert: value equals: 1
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
LocalRecursionStopperTest>>testWithComplexRecursion [

	self should: [ self complexRecursion ] notTakeMoreThanMilliseconds: 3.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
LocalRecursionStopperTest>>testWithRecursion [

	self should: [ self recursion ] notTakeMoreThanMilliseconds: 3.
]
