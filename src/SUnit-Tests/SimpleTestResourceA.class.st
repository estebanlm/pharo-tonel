"
I'm a simple test ressource for test purposes
"
Class {
	#name : #SimpleTestResourceA,
	#superclass : #SimpleTestResource,
	#category : #SUnit-Tests-Core,
	#timestamp : 'TorstenBergmann 2/12/2014 23:13'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SimpleTestResourceA class>>resources [
	^Array with: SimpleTestResourceA1 with: SimpleTestResourceA2
]
