Extension {
	#name : #ByteArray
}

{
	#category : #'*Hermes',
	#timestamp : ' 8/31/2017 07:16:17'
}
ByteArray>>asExportedLiteral [
	^ HEByteArray for:self.
]
