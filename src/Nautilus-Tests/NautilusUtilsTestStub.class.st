"
This is just a stub class with a stub test, NautilusUtilsStubTest, so that NautilusUtilsTest can test method-to-test method mapping.
"
Class {
	#name : #NautilusUtilsTestStub,
	#superclass : #Object,
	#instVars : [
		'one',
		'two'
	],
	#category : #Nautilus-Tests,
	#timestamp : 'monty 8/22/2016 07:22'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:44'
}
NautilusUtilsTestStub class>>one: aFirstObject two: aSecondObject [
	^ self new
		one: aFirstObject
		two: aSecondObject
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:44'
}
NautilusUtilsTestStub class>>untestedOne: aFirstObject two: aSecondObject [
	^ self new
		one: aFirstObject;
		two: aSecondObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
NautilusUtilsTestStub>>one [
	^ one
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
NautilusUtilsTestStub>>one: anObject [
	one := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
NautilusUtilsTestStub>>one: aFirstObject two: aSecondObject [
	self
		one: aFirstObject;
		two: aSecondObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
NautilusUtilsTestStub>>oneTwo: anObject [
	self two: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
NautilusUtilsTestStub>>two [
	^ two
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
NautilusUtilsTestStub>>two: anObject [
	two := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
NautilusUtilsTestStub>>untestedOne [
	^ self one
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
NautilusUtilsTestStub>>untestedOne: anObject [
	self one: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
NautilusUtilsTestStub>>untestedOne: aFirstObject two: aSecondObject [
	self
		one: aFirstObject;
		two: aSecondObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
NautilusUtilsTestStub>>untestedOneTwo: anObject [
	self two: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
NautilusUtilsTestStub>>untestedTwo [
	^ self two
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
NautilusUtilsTestStub>>untestedTwo: anObject [
	self two: anObject
]
