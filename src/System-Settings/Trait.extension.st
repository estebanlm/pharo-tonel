Extension {
	#name : #Trait
}

{
	#category : #'*System-Settings',
	#timestamp : ' 8/31/2017 05:26:16'
}
Trait>>acceptSettings: aVisitor  [
	^ aVisitor visitClass: self
]
