"
I represent an error produced during materialization when the serialized signature doesn't match the materializer's signature (accessible via FLMaterializer>>signature). A signature is a byte prefix that should prefix a well-serialized stream.
"
Class {
	#name : #FLBadSignature,
	#superclass : #FLMaterializationError,
	#category : #Fuel-Errors,
	#timestamp : 'MarianoMartinezPeck 10/23/2011 14:32'
}

{
	#category : #signaling,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLBadSignature class>>signalCurrentSignature: currentSignature streamSignature: streamSignature [

	^ self signal: 'Unexpected stream signature ', streamSignature asString, ' where it should be ', currentSignature asString, '.'
]
