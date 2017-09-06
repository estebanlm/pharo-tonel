"
A mock for a singleton
"
Class {
	#name : #FLSingletonMock,
	#superclass : #Object,
	#instVars : [
		'reference'
	],
	#classVars : [
		'Instance'
	],
	#category : #FuelTests-Mocks,
	#timestamp : 'TorstenBergmann 2/3/2014 23:28'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSingletonMock class>>instance [
	^ Instance ifNil: [ Instance := self basicNew ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSingletonMock class>>new [
	self error: 'I''m a singleton!'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSingletonMock class>>reset [
	Instance := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSingletonMock>>reference [
	^ reference
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSingletonMock>>reference: anObject [
	^ reference := anObject
]
