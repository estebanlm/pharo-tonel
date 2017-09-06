Extension {
	#name : #ByteString
}

{
	#category : #'*Text-Scanning',
	#timestamp : ' 8/31/2017 05:26:17'
}
ByteString>>scanCharactersFrom: startIndex to: stopIndex with: aCharacterScanner rightX: rightX  font: aFont [
	"NB: strongly consider getting almost all these parameters from the scanner"
	"Since I'm a byte char string, I know that we have to scan single-byte characters and don't have to handle encodings etc"
	startIndex > stopIndex
		ifTrue: [^aCharacterScanner handleEndOfRunAt: stopIndex].
	^aFont scanByteCharactersFrom: startIndex to: stopIndex in: self with: aCharacterScanner rightX: rightX
]
