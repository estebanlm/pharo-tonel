"
I'm a stub to load Lucida Grande font in system. 
As is, it works just for macs, but the idea is to use it for showing shortcut symbols... which has sense just un mac :)
"
Class {
	#name : #LucidaGrandeRegular,
	#superclass : #EmbeddedFreeTypeFontFontDescription,
	#category : #EmbeddedFreeType,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
LucidaGrandeRegular class>>canBeInstalled  [
	"This font can be installed just in Macs *and* if font exists"
	^ OSPlatform current isMacOS and: [ self fontReference exists ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
LucidaGrandeRegular class>>fontContents [
	^ self fontReference 
		readStreamDo: [ :stream | stream binary; contents ]
	
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
LucidaGrandeRegular class>>fontDirectory [
	"Lucida Grande comes in mac system, at that directory. 
	 Not happy with the hardcoding, but it should not change"
	^ '/System/Library/Fonts' asFileReference
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
LucidaGrandeRegular class>>fontReference  [
	^ self fontDirectory / self originalFileName
	
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:11'
}
LucidaGrandeRegular class>>initialize  [
	self canBeInstalled 
		ifTrue: [ EmbeddedFreeTypeFontInstaller registerFont: self ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
LucidaGrandeRegular class>>originalFileName [
	^ 'LucidaGrande.ttc'
]
