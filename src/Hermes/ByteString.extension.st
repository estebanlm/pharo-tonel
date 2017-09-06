Extension {
	#name : #ByteString
}

{
	#category : #'*Hermes',
	#timestamp : ' 8/31/2017 07:16:17'
}
ByteString>>asExportedLiteral [
	^ HEByteString for:self.
]
