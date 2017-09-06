"
I'm a simple test ressource for test purposes
"
Class {
	#name : #SimpleTestResourceCircular1,
	#superclass : #SimpleTestResource,
	#category : #SUnit-Tests-Core,
	#timestamp : 'TorstenBergmann 2/12/2014 23:14'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SimpleTestResourceCircular1 class>>resources [
	"Circular prereq:  C wants C1 which wants C."
	
	^Array with: SimpleTestResourceCircular
]
