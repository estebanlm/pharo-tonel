"
Float type. 
Represented as float in C side.
"
Class {
	#name : #FFIFloat32,
	#superclass : #FFIFloatType,
	#category : #UnifiedFFI-Types,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFloat32 class>>externalType  [
	^ ExternalType float
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFloat32 class>>externalTypeAlignment [
	^ 4
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFloat32 class>>externalTypeSize [
	^ 4
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFloat32>>basicHandle: aHandle at: index [
	^ aHandle floatAt: index
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFloat32>>basicHandle: aHandle at: index put: value [
	^ aHandle floatAt: index put: value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFloat32>>callbackReturnOn: callbackContext for: aFloat [
	^ FFIArchitecture forCurrentArchitecture returnSingleFloatsAsDoubles
		ifTrue: [ callbackContext floatResult: aFloat ]
		ifFalse: [ callbackContext singleFloatResult: aFloat ]
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFloat32>>emitPointerArityRoll: aBuilder context: aContext [
	self loader 
		emitPointerArityPack: aBuilder 
		context: aContext 
		arity: self pointerArity
		selector: #packAsFloatToArity:
]
