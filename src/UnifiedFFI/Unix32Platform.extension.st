Extension {
	#name : #Unix32Platform
}

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
Unix32Platform>>ffiModuleName: aLibrary  [
	^ aLibrary unix32ModuleName
]
