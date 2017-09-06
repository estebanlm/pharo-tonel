"
I provide a simple way to test the equality properties of any object.
"
Class {
	#name : #EqualityTester,
	#superclass : #PrototypeTester,
	#category : #SUnit-Core-Utilities,
	#timestamp : 'mjr 8/20/2003 13:04'
}

{
	#category : #operation,
	#timestamp : ' 8/31/2017 05:26:08'
}
EqualityTester>>resultFor: runs  [
	"Test that equality is the same over runs and answer the result"
	1
		to: runs
		do: [:i | self prototype = self prototype
				ifFalse: [^ false]]. 
	^ true
]
