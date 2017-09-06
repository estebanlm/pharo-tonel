"
A test mock for a class with recursive substitution
"
Class {
	#name : #FLClassWithRecursiveSubstitution,
	#superclass : #Object,
	#instVars : [
		'index'
	],
	#category : #FuelTests-Mocks,
	#timestamp : 'TorstenBergmann 2/3/2014 23:21'
}

{
	#category : #serialization,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLClassWithRecursiveSubstitution>>fuelAccept: aGeneralMapper [

	^ index < 10
		ifTrue: [
			aGeneralMapper 
				visitSubstitution: self 
				by: (self copy index: self index + 1)
				onRecursionDo: [ super fuelAccept: aGeneralMapper ] ]
		ifFalse: [
			super fuelAccept: aGeneralMapper ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLClassWithRecursiveSubstitution>>index [
	^ index
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLClassWithRecursiveSubstitution>>index: anObject [
	index := anObject 
]
