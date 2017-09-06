Extension {
	#name : #LargeInteger
}

{
	#category : #'*Hermes',
	#timestamp : ' 8/31/2017 07:16:17'
}
LargeInteger>>asExportedLiteral [
	^ HELargeInteger for: self
]
