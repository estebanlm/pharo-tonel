"
I provide a simple way to test the hash properties of any object.  

I am given an object that should be tested and I treat it like a prototype.  I take a copy of it when I am given it so that it can't change whilst I am holding on to it.  I can then test that multiple copies of this object all hash to the same value.
"
Class {
	#name : #HashTester,
	#superclass : #PrototypeTester,
	#category : #SUnit-Core-Utilities,
	#timestamp : 'mjr 8/20/2003 12:48'
}

{
	#category : #operation,
	#timestamp : ' 8/31/2017 05:26:08'
}
HashTester>>resultFor: runs  [
	"Test that the hash is the same over runs and answer the result"
	| hash |
	hash := self prototype hash.
	1
		to: runs
		do: [:i | hash = self prototype hash
				ifFalse: [^ false]].
	^ true 
]
