Extension {
	#name : #WinPlatform
}

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
WinPlatform>>ffiCallingConvention [
	^ #stdcall
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
WinPlatform>>ffiFloat64Alignment [
	"Windows structure double alignment is 8. 
	 Check here: https://msdn.microsoft.com/en-us/library/aa290049(v=vs.71).aspx"
	^ 8
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
WinPlatform>>ffiLongAlignment [
	"In Windows, sizeof(long) == 4 always."
	^ 4
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
WinPlatform>>ffiModuleName: aLibrary  [
	^ aLibrary win32ModuleName
]
