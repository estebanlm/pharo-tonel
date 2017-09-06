Extension {
	#name : #AbstractFont
}

{
	#category : #'*Multilingual-OtherLanguages',
	#timestamp : ' 8/31/2017 05:26:15'
}
AbstractFont>>scanMultibyteJapaneseCharactersFrom: startIndex to: stopIndex in: aWideString with: aCharacterScanner rightX: rightX [
	"scan a multibyte Japanese character string"
	^aCharacterScanner scanJapaneseCharactersFrom: startIndex to: stopIndex in: aWideString rightX: rightX 

]
