Extension {
	#name : #LogicalFontManager
}

{
	#category : #'*FontInfrastructure-Tests',
	#timestamp : ' 8/31/2017 05:26:42'
}
LogicalFontManager>>identityIncludesFontProvider: aFreeTypeFontProvider  [
	^ fontProviders identityIncludes: aFreeTypeFontProvider
]
