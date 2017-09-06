Extension {
	#name : #AbstractFileReference
}

{
	#category : #'*System-Settings',
	#timestamp : ' 8/31/2017 05:26:16'
}
AbstractFileReference>>acceptSettings: aVisitor [
	^ aVisitor visitAbstractFileReference: self
]
