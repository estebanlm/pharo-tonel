Extension {
	#name : #MethodDictionary
}

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
MethodDictionary>>metaLinkOptions [
	^{
	#scanFor: -> #( + optionCompileOnLinkInstallation).
	#at:put: -> #( + optionCompileOnLinkInstallation).
	#metaLinkOptions -> #( + optionCompileOnLinkInstallation)
	}
]
