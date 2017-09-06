Extension {
	#name : #String
}

{
	#category : #'*RPackage-Core',
	#timestamp : ' 8/31/2017 07:16:47'
}
String>>asPackage [
	^ self asPackageIfAbsent: [ NotFound new messageText: 'There is no package named ', self; object: self; signal ] 
]

{
	#category : #'*RPackage-Core',
	#timestamp : ' 8/31/2017 07:16:47'
}
String>>asPackageIfAbsent: aBlock [
	^ RPackageOrganizer default packageNamed: self ifAbsent: aBlock
]
