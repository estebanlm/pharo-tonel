"
Common SUnit tests for MBInfo
"
Class {
	#name : #MBInfoTest,
	#superclass : #MBAbstractTest,
	#category : #Versionner-Tests-Core-Model,
	#timestamp : 'TorstenBergmann 2/20/2014 14:13'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInfoTest>>testIsDirty [
	"info is not dirty per default"
	self deny: MBInfo new isDirty
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInfoTest>>testName [
	| info |
	info := MBInfo new.
	self assert: (info name isNil).

	info name: 'foobar'.
	self assert: (info name = 'foobar').
	self assert: (info printString = 'foobar').


]
