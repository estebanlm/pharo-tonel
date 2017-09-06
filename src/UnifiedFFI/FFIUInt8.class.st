"
I'm an unsigned byte.
"
Class {
	#name : #FFIUInt8,
	#superclass : #FFIIntegerType,
	#category : #UnifiedFFI-Types,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIUInt8 class>>externalType  [
	^ ExternalType unsignedByte
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIUInt8 class>>externalTypeAlignment [
	^ 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIUInt8 class>>externalTypeSize [
	^ 1
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIUInt8>>basicHandle: aHandle at: index [
	^ aHandle unsignedByteAt: index
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIUInt8>>basicHandle: aHandle at: index put: value [
	^ aHandle unsignedByteAt: index put: value
]
