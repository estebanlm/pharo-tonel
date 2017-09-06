Extension {
	#name : #Set
}

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
Set>>metaLinkOptions [
	^{
	#parseOptions: -> #( + optionCompileOnLinkInstallation).
	#metaLinkOptions -> #( + optionCompileOnLinkInstallation)
	}
]
