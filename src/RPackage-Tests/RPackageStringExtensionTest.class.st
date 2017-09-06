"

"
Class {
	#name : #RPackageStringExtensionTest,
	#superclass : #TestCase,
	#category : #RPackage-Tests,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:33'
}
RPackageStringExtensionTest>>testAsPackage [
	self assert: self class package name asPackage notNil
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:33'
}
RPackageStringExtensionTest>>testAsPackageIfAbsent [
	self assert: ('___inexistent___package___' asPackageIfAbsent: [ true ])
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:33'
}
RPackageStringExtensionTest>>testAsPackageWithError [
	self 
		should: ['___inexistent___package___' asPackage]
		raise: NotFound
	
]
