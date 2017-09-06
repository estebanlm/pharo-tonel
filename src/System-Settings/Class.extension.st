Extension {
	#name : #Class
}

{
	#category : #'*System-Settings',
	#timestamp : ' 8/31/2017 05:26:16'
}
Class>>acceptSettings: aVisitor  [
	^ aVisitor visitClass: self
]
