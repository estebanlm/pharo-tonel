Extension {
	#name : #AbsolutePath
}

{
	#category : #'*System-Settings',
	#timestamp : ' 8/31/2017 05:26:16'
}
AbsolutePath>>acceptSettings: aVisitor [
	^ aVisitor visitAbsolutePath: self
]
