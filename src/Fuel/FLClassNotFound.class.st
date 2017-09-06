"
I represent an error produced during materialization when a serialized class or trait name doesn't exist.
"
Class {
	#name : #FLClassNotFound,
	#superclass : #FLMaterializationError,
	#category : #Fuel-Errors,
	#timestamp : 'MarianoMartinezPeck 10/23/2011 14:34'
}

{
	#category : #signaling,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLClassNotFound class>>signalWithName: className [
	^ self signal: 'Class named ', className printString, ' not found.'
]
