Extension {
	#name : #Array
}

{
	#category : #'*Hermes',
	#timestamp : ' 8/31/2017 07:16:17'
}
Array>>asExportedLiteral [
	^ HEArray for:self.
]
