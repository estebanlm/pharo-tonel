Extension {
	#name : #ByteSymbol
}

{
	#category : #'*Hermes',
	#timestamp : ' 8/31/2017 07:16:17'
}
ByteSymbol>>asExportedLiteral [
	^ HESymbol for: self.
]
