"
I'm an unsigned int type (32 bits)
"
Class {
	#name : #FFIUInt32,
	#superclass : #FFIIntegerType,
	#category : #UnifiedFFI-Types,
	#timestamp : 'EstebanLorenzano 9/2/2015 17:45'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIUInt32 class>>externalType  [
	^ ExternalType ulong
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIUInt32 class>>externalTypeAlignment [
	^ 4
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIUInt32 class>>externalTypeSize [
	^ 4
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIUInt32>>basicHandle: aHandle at: index [
	^ aHandle unsignedLongAt: index
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIUInt32>>basicHandle: aHandle at: index put: value [
	^ aHandle unsignedLongAt: index put: value
]
