"
I'm an signed short type.
"
Class {
	#name : #FFIInt16,
	#superclass : #FFIUInt16,
	#category : #UnifiedFFI-Types,
	#timestamp : 'EstebanLorenzano 9/2/2015 17:40'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIInt16 class>>externalType  [
	^ ExternalType short
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIInt16>>basicHandle: aHandle at: index [
	^ aHandle signedShortAt: index
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIInt16>>basicHandle: aHandle at: index put: value  [
	^ aHandle signedShortAt: index put: value
]
