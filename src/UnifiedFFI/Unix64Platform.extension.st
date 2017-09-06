Extension {
	#name : #Unix64Platform
}

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
Unix64Platform>>ffiModuleName: aLibrary  [
	^ aLibrary unix64ModuleName
]
