"
I represent an error produced during materialization when a serialized method in a class or trait name doesn't exist (at Smalltalk globals).
"
Class {
	#name : #FLMethodNotFound,
	#superclass : #FLMaterializationError,
	#category : #Fuel-Errors,
	#timestamp : 'MartinDias 12/16/2011 01:17'
}

{
	#category : #signaling,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMethodNotFound class>>signalWith: aGlobalName and: aSelector [
	^ self signal: 'Method ', aGlobalName, '>>#', aSelector, ' not found.'
]
