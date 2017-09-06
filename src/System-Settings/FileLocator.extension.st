Extension {
	#name : #FileLocator
}

{
	#category : #'*System-Settings',
	#timestamp : ' 8/31/2017 05:26:16'
}
FileLocator>>acceptSettings: aVisitor [
	^ aVisitor visitFileLocator: self
]
