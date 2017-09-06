Extension {
	#name : #RPackage
}

{
	#category : #'*Tool-Base',
	#timestamp : ' 8/31/2017 05:26:18'
}
RPackage>>browse [
	^ Smalltalk tools browser openOnPackage: self
]
