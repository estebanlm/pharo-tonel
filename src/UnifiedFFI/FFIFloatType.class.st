"
A generic (abstract) float type.
"
Class {
	#name : #FFIFloatType,
	#superclass : #FFIExternalType,
	#category : #UnifiedFFI-Types,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFloatType>>callbackReturnOn: callbackContext for: aFloat [
	^ callbackContext floatResult: aFloat
]

{
	#category : #'stack parameter classification',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFloatType>>stackValueParameterClass [
	^ #float
]
