Extension {
	#name : #WideSymbol
}

{
	#category : #'*Text-Scanning',
	#timestamp : ' 8/31/2017 05:26:17'
}
WideSymbol>>scanCharactersFrom: startIndex to: stopIndex with: aCharacterScanner rightX: rightX  font: aFont [
	"NB: strongly consider getting almost all these parameters from the scanner"
	"Since I'm a wide char string, I know that we have to scan multi-byte characters and handle encodings etc"
	| charSet |
	startIndex > stopIndex
		ifTrue: [^aCharacterScanner handleEndOfRunAt: stopIndex].
	charSet := self encodedCharSetAt: startIndex.
	^charSet scanMultibyteCharactersFrom: startIndex to: stopIndex in: self with: aCharacterScanner rightX: rightX font: aFont	
]
