"
I represent an error produced during materialization when a serialized global name doesn't exist (at Smalltalk globals).
"
Class {
	#name : #FLGlobalNotFound,
	#superclass : #FLMaterializationError,
	#category : #Fuel-Errors,
	#timestamp : 'MartinDias 12/16/2011 01:16'
}

{
	#category : #signaling,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLGlobalNotFound class>>signalWithName: aName [
	^ self signal: 'Global named ', aName printString, ' not found.'
]
