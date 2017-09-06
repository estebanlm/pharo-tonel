"
I'm an unsigned short type.
"
Class {
	#name : #FFIUInt16,
	#superclass : #FFIIntegerType,
	#category : #UnifiedFFI-Types,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIUInt16 class>>externalType  [
	^ ExternalType ushort	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIUInt16 class>>externalTypeAlignment [
	^ 2
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIUInt16 class>>externalTypeSize [
	^ 2
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIUInt16>>basicHandle: aHandle at: index [
	^ aHandle unsignedShortAt: index
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIUInt16>>basicHandle: aHandle at: index put: value [
	^ aHandle unsignedShortAt: index put: value
]
