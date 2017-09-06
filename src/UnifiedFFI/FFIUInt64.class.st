"
I'm an unsigned int type (64bits)
I map to a ulonglong type. 
"
Class {
	#name : #FFIUInt64,
	#superclass : #FFIIntegerType,
	#category : #UnifiedFFI-Types,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIUInt64 class>>externalType  [
	^ ExternalType unsignedLongLong
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIUInt64 class>>externalTypeAlignment [
	^ OSPlatform current ffiInt64Alignment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIUInt64 class>>externalTypeSize [
	^ 8
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIUInt64>>basicHandle: aHandle at: index [
	^ aHandle signedLongLongAt: index	

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIUInt64>>basicHandle: aHandle at: index put: value  [
	^ aHandle signedLongLongAt: index	put: value

]
