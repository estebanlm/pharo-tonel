Extension {
	#name : #RelativePath
}

{
	#category : #'*System-Settings',
	#timestamp : ' 8/31/2017 05:26:16'
}
RelativePath>>acceptSettings: aVisitor [
	^ aVisitor visitRelativePath: self
]
