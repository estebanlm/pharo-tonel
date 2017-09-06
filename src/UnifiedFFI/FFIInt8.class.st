"
I'm an signed byte.
"
Class {
	#name : #FFIInt8,
	#superclass : #FFIUInt8,
	#category : #UnifiedFFI-Types,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIInt8 class>>externalType  [
	^ ExternalType signedByte
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIInt8>>basicHandle: aHandle at: index [
	^ aHandle signedByteAt: index
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIInt8>>basicHandle: aHandle at: index put: value [
	^ aHandle signedByteAt: index put: value
]
