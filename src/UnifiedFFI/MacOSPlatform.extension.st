Extension {
	#name : #MacOSPlatform
}

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
MacOSPlatform>>ffiModuleName: aLibrary  [
	^ aLibrary macModuleName
]
