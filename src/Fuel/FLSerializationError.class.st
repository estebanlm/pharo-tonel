"
I represent an error happened during serialization.
"
Class {
	#name : #FLSerializationError,
	#superclass : #FLError,
	#category : #Fuel-Errors,
	#timestamp : '<historical>'
}

{
	#category : #exceptioninstantiator,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLSerializationError class>>signal: signalerText [

	^ super signal: 'Serialization error. ', signalerText
	
]
