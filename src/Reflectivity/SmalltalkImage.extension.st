Extension {
	#name : #SmalltalkImage
}

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
SmalltalkImage>>metaLinkOptions [
	^{
	#vm -> #( + optionCompileOnLinkInstallation).
	#metaLinkOptions -> #( + optionCompileOnLinkInstallation)
	}
]
