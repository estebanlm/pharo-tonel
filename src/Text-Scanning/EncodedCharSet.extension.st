Extension {
	#name : #EncodedCharSet
}

{
	#category : #'*Text-Scanning',
	#timestamp : ' 8/31/2017 05:26:17'
}
EncodedCharSet class>>scanMultibyteCharactersFrom: startIndex to: stopIndex in: aWideString with: aCharacterScanner rightX: rightX font: aFont [
	"the default for scanning multibyte characters- other more specific encodings may do something else"
	^aFont scanMultibyteCharactersFrom: startIndex to: stopIndex in: aWideString with: aCharacterScanner rightX: rightX
]
