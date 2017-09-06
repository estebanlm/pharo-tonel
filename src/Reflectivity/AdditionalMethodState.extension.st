Extension {
	#name : #AdditionalMethodState
}

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
AdditionalMethodState>>metaLinkOptions [
	^{
	#selector -> #( + optionCompileOnLinkInstallation).
	#isMethodProperties -> #( + optionCompileOnLinkInstallation).
	#metaLinkOptions -> #( + optionCompileOnLinkInstallation)
	}
]
