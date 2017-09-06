"
I represent an error happened during materialization.
"
Class {
	#name : #FLMaterializationError,
	#superclass : #FLError,
	#category : #Fuel-Errors,
	#timestamp : '<historical>'
}

{
	#category : #exceptioninstantiator,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMaterializationError class>>signal: signalerText [

	^ super signal: 'Materialization error. ', signalerText
	
]
