"
I am an object that doesn't always report #= correctly.  Used for testing the EqualityTester.
"
Class {
	#name : #BadEqualer,
	#superclass : #Object,
	#category : #SUnit-Core-Utilities,
	#timestamp : 'mjr 8/20/2003 13:28'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:08'
}
BadEqualer>>= other  [
	self class = other class
		ifFalse: [^ false].
	^ 100 atRandom < 30 
]
