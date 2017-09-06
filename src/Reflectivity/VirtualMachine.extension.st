Extension {
	#name : #VirtualMachine
}

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
VirtualMachine>>metaLinkOptions [
	^{
	#isSpur -> #( + optionCompileOnLinkInstallation).
	#metaLinkOptions -> #( + optionCompileOnLinkInstallation)
	}
]
