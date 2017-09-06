Extension {
	#name : #RPackage
}

{
	#category : #'*Refactoring-Environment',
	#timestamp : ' 8/31/2017 05:26:25'
}
RPackage>>asEnvironment [
	^ RBPackageEnvironment package: self
]
