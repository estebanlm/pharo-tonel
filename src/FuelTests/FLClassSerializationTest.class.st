"
I have the common behavior for testing class serialization.
"
Class {
	#name : #FLClassSerializationTest,
	#superclass : #FLSerializationTest,
	#category : #FuelTests,
	#timestamp : '<historical>'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLClassSerializationTest>>during: aBlock rename: aClass as: anotherClass [

	[ Smalltalk at: aClass name put: anotherClass.
	^aBlock value ] ensure: [ 
	Smalltalk at: aClass name put: aClass ].
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLClassSerializationTest>>newClassOrTrait [
	"Returns a class for testing"

	^ self newClassWithInstanceVariableNames: ''
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLClassSerializationTest>>newClassOrTraitWithSuperClass: superclass [
	"Returns a class for testing"

	^ self newClassWithInstanceVariableNames: '' superclass: superclass
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLClassSerializationTest>>newClassWithInstanceVariableNames: instanceVariableNames [
	"Returns a class for testing, with the specified instance variables."

	^ self newClassWithInstanceVariableNames: instanceVariableNames superclass: Object
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLClassSerializationTest>>newClassWithInstanceVariableNames: instanceVariableNames superclass: aSuperclass [
	"Returns a class for testing, with the specified instance variables."

	^ self 
		newSubclassOf: aSuperclass
		instanceVariableNames: instanceVariableNames
		classVariableNames: ''
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLClassSerializationTest>>newInstanceFrom: aClass [

	^ aClass new
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLClassSerializationTest>>newSecondaryTrait [
	"Returns a trait for testing"

	^ self newTraitSuffixed: 'Secondary'
]
