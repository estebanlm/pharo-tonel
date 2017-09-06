"
TestLocalVariable is a test class using in ProcessSpecificTest.
"
Class {
	#name : #TestLocalVariable,
	#superclass : #ProcessLocalVariable,
	#category : #Kernel-Tests-Processes,
	#timestamp : 'mvl 3/13/2007 13:52'
}

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:30'
}
TestLocalVariable>>default [
	"My default value for a new process is 0."
	
	^0
]
