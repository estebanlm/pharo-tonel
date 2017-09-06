Extension {
	#name : #TClass
}

{
	#category : #'*System-Settings',
	#timestamp : ' 8/31/2017 05:26:16'
}
TClass>>acceptSettings: aVisitor  [
	^ aVisitor visitClass: self
]
