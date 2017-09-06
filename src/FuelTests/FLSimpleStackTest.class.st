"

"
Class {
	#name : #FLSimpleStackTest,
	#superclass : #TestCase,
	#category : #FuelTests-Collections,
	#timestamp : ''
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSimpleStackTest>>testCapacity [

	| stack |
	stack := FLSimpleStack new: 3.
	self assert: 3 = stack capacity.
	
	stack := FLSimpleStack new: 5.
	self assert: 5 = stack capacity.
]

{
	#category : #tests-adding,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSimpleStackTest>>testGrow [

	| stack |
	stack := FLSimpleStack new: 1.
	self assert: 1 = stack capacity.
	stack push: #a.
	self assert: 1 < stack capacity.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSimpleStackTest>>testIsEmpty [

	| stack |
	stack := FLSimpleStack new.
	self assert: stack isEmpty.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSimpleStackTest>>testPop [

	| stack |
	stack := FLSimpleStack new.
	stack push: 1.
	stack pop.
	self assert: stack isEmpty.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSimpleStackTest>>testPush [

	| stack |
	stack := FLSimpleStack new.
	stack push: 1.
	self deny: stack isEmpty.
]
