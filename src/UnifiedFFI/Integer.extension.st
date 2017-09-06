Extension {
	#name : #Integer
}

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
Integer>>asExternalTypeOn: generator [
	^ FFIConst value: self type: (generator resolveExternalType: #int32)
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
Integer>>pointer  [
	^ (ByteArray new: FFIExternalType pointerSize)
		unsignedLongAt: 1 put: self;
		yourself
]
