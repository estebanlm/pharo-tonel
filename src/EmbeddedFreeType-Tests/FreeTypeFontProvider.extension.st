Extension {
	#name : #FreeTypeFontProvider
}

{
	#category : #'*EmbeddedFreeType-Tests',
	#timestamp : ' 8/31/2017 05:26:42'
}
FreeTypeFontProvider>>includesInstaller: anEmbeddedFreeTypeFontInstaller  [
	^ fontInstallers identityIncludes: anEmbeddedFreeTypeFontInstaller
]
