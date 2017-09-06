"
A generic (abstract) integer type.
"
Class {
	#name : #FFIIntegerType,
	#superclass : #FFIExternalType,
	#category : #UnifiedFFI-Types,
	#timestamp : 'EstebanLorenzano 9/2/2015 17:38'
}

{
	#category : #'stack parameter classification',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIIntegerType>>stackValueParameterClass [
	^ #integer
]
