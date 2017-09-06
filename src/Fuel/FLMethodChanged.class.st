"
I represent an error produced during materialization when is detected a change in the bytecodes of a method serialized as global. 

This error was born when testing the materialization of a BlockClosure defined in a method that changed. The test produced a VM crash.
"
Class {
	#name : #FLMethodChanged,
	#superclass : #FLMaterializationError,
	#category : #Fuel-Errors,
	#timestamp : '<historical>'
}

{
	#category : #signaling,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMethodChanged class>>signalWith: aGlobalName and: aSelector [
	^ self signal: 'Method ', aGlobalName, '>>#', aSelector, ' changed its bytecodes.'
]
