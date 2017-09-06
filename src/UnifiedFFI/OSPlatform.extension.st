Extension {
	#name : #OSPlatform
}

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
OSPlatform>>ffiCallingConvention [
	^ #cdecl
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
OSPlatform>>ffiFloat64Alignment [
	"By default is 4, windows and maybe others can use other"
	^ Smalltalk wordSize
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
OSPlatform>>ffiInt64Alignment [
	"By default is 4, windows and maybe others can use other"
	^ Smalltalk wordSize
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
OSPlatform>>ffiLongAlignment [
	"By default is 4, windows and maybe others can use other"
	^ Smalltalk wordSize
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
OSPlatform>>ffiModuleName: aLibrary  [
	^ self subclassResponsibility
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
OSPlatform>>ffiPointerAlignment [
	"By default is 4, windows and maybe others can use other"
	^ Smalltalk wordSize
]
