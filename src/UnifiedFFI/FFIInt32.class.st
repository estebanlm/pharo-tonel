"
I'm a signed int type (32 bits)
"
Class {
	#name : #FFIInt32,
	#superclass : #FFIUInt32,
	#category : #UnifiedFFI-Types,
	#timestamp : 'EstebanLorenzano 9/2/2015 17:45'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIInt32 class>>externalType  [
	^ ExternalType long
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIInt32>>basicHandle: aHandle at: index [
	^ aHandle signedLongAt: index
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIInt32>>basicHandle: aHandle at: index put: value [
	^ aHandle signedLongAt: index put: value
]
