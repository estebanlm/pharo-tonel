"
Float type. 
Represented as double in C side.
"
Class {
	#name : #FFIFloat64,
	#superclass : #FFIFloatType,
	#category : #UnifiedFFI-Types,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFloat64 class>>externalType  [
	^ ExternalType double
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFloat64 class>>externalTypeAlignment [
	^ OSPlatform current ffiFloat64Alignment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFloat64 class>>externalTypeSize [
	^ 8
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFloat64>>basicHandle: aHandle at: index [
	^ aHandle doubleAt: index
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFloat64>>basicHandle: aHandle at: index put: value [
	^ aHandle doubleAt: index put: value
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIFloat64>>emitPointerArityRoll: aBuilder context: aContext [
	self loader 
		emitPointerArityPack: aBuilder 
		context: aContext 
		arity: self pointerArity
		selector: #packAsDoubleToArity:
]
