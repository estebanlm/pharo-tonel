Extension {
	#name : #FFIExternalReference
}

{
	#category : #'*UnifiedFFI-Legacy',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalReference>>handle [
	^ self getHandle
]

{
	#category : #'*UnifiedFFI-Legacy',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalReference>>handle: anObject [
	self setHandle: anObject
]
