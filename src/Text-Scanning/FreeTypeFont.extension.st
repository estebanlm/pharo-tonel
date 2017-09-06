Extension {
	#name : #FreeTypeFont
}

{
	#category : #'*Text-Scanning',
	#timestamp : ' 8/31/2017 05:26:17'
}
FreeTypeFont>>scanByteCharactersFrom: startIndex to: stopIndex in: aByteString with: aCharacterScanner rightX: rightX [
	"scan a single byte character string"
	^aCharacterScanner scanKernableByteCharactersFrom: startIndex to: stopIndex in: aByteString rightX: rightX
]

{
	#category : #'*Text-Scanning',
	#timestamp : ' 8/31/2017 05:26:17'
}
FreeTypeFont>>scanMultibyteCharactersFrom: startIndex to: stopIndex in: aWideString with: aCharacterScanner rightX: rightX [
	"scan a multibyte character string"
	^aCharacterScanner scanKernableMultibyteCharactersFrom: startIndex to: stopIndex in: aWideString rightX: rightX 
]
