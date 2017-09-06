"
Bool type.
Represented as single byte on C side.
"
Class {
	#name : #FFIBool,
	#superclass : #FFIExternalType,
	#category : #UnifiedFFI-Types,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIBool class>>externalType [
	^ ExternalType bool
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIBool class>>externalTypeAlignment [
	^ 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIBool class>>externalTypeSize [
	^ 1
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIBool>>basicHandle: aHandle at: index [
	^ aHandle booleanAt: index
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIBool>>basicHandle: aHandle at: index put: value [
	^ aHandle booleanAt: index put: value
]

{
	#category : #'stack parameter classification',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIBool>>stackValueParameterClass [
	^ #integer
]
