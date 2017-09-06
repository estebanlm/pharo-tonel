Extension {
	#name : #HashedCollection
}

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
HashedCollection>>metaLinkOptions [
	^{
	#findElementOrNil: -> #( + optionCompileOnLinkInstallation).
	#metaLinkOptions -> #( + optionCompileOnLinkInstallation)
	}
]
