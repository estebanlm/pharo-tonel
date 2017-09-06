"
I am a simple holder of a prototype object and hand out copies when requested.
My subclasses should define resultFor: a
"
Class {
	#name : #PrototypeTester,
	#superclass : #Object,
	#instVars : [
		'prototype'
	],
	#category : #SUnit-Core-Utilities,
	#timestamp : 'StephaneDucasse 12/28/2014 11:26'
}

{
	#category : #default,
	#timestamp : ' 8/31/2017 05:26:08'
}
PrototypeTester class>>defaultRuns [
	"Returns the default number of times to test"
	^ 50
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:08'
}
PrototypeTester class>>with: aPrototype [
	^ self new prototype:aPrototype
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
PrototypeTester>>prototype [
	"Get a prototype"
	^ prototype copy 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
PrototypeTester>>prototype: aPrototype  [
	"Set my prototype"
	prototype := aPrototype copy 
]

{
	#category : #operation,
	#timestamp : ' 8/31/2017 05:26:08'
}
PrototypeTester>>result [
	"Perform the test the default number of times"
	^ self resultFor: self class defaultRuns 
]

{
	#category : #operation,
	#timestamp : ' 8/31/2017 05:26:08'
}
PrototypeTester>>resultFor: runs  [
	"Test that equality is the same over runs and answer the result"
	
	self subclassResponsibility
]
