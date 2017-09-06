"
I wrap a method in order to detect whether it has been called or not. Then I can be used to calculate test coverage for SUnit.
"
Class {
	#name : #TestCoverage,
	#superclass : #ProtoObject,
	#instVars : [
		'hasRun',
		'reference',
		'method'
	],
	#category : #SUnit-UI,
	#timestamp : 'LaurentLaffont 4/15/2011 20:19'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:20'
}
TestCoverage class>>on: aMethodReference [
	^ self new initializeOn: aMethodReference
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
TestCoverage>>doesNotUnderstand: aMessage [
	^ method perform: aMessage selector withArguments: aMessage arguments
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:20'
}
TestCoverage>>hasRun [
	^ hasRun
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:20'
}
TestCoverage>>initializeOn: aMethodReference [
	hasRun := false.
	reference := aMethodReference.
	method := reference compiledMethod
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:20'
}
TestCoverage>>install [
	reference actualClass methodDict
		at: reference selector
		put: self
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
TestCoverage>>mark [
	hasRun := true
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
TestCoverage>>reference [
	^ reference
]

{
	#category : #evaluation,
	#timestamp : ' 8/31/2017 05:26:20'
}
TestCoverage>>run: aSelector with: anArray in: aReceiver [
	self mark; uninstall.
	^ aReceiver withArgs: anArray executeMethod: method
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:20'
}
TestCoverage>>uninstall [
	reference actualClass methodDict
		at: reference selector
		put: method
]
