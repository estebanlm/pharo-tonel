"
I represent an error produced during materialization when the serialized version doesn't match the materializer's version (accessible via FLMaterializer>>version). A version is encoded in 16 bits and is enconded heading the serialized stream, after the signature.
"
Class {
	#name : #FLBadVersion,
	#superclass : #FLMaterializationError,
	#category : #Fuel-Errors,
	#timestamp : 'MarianoMartinezPeck 10/23/2011 14:33'
}

{
	#category : #signaling,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLBadVersion class>>signalCurrentVersion: currentVersion streamVersion: streamVersion [

	^ self signal: 'Unexpected stream version ', streamVersion asString, ' where it should be ', currentVersion asString, '.'

]
