"
I represent an error which may happen while tracing in the graph an object that is forbidden of being serialized.
"
Class {
	#name : #FLNotSerializable,
	#superclass : #FLSerializationError,
	#category : #Fuel-Errors,
	#timestamp : '<historical>'
}

{
	#category : #signaling,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLNotSerializable class>>signalWith: anObject [

 	self signal: 'Found a forbidden object in the graph: ', anObject printString.
]
