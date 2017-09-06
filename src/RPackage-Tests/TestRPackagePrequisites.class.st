"
SUnit tests for RPackage prerequisites
"
Class {
	#name : #TestRPackagePrequisites,
	#superclass : #TestCase,
	#category : #RPackage-Tests,
	#timestamp : 'TorstenBergmann 2/12/2014 23:01'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:33'
}
TestRPackagePrequisites>>testNoPackagesOverride [
"Class side packages should not be overridden"
	self assert: (Object allSubclasses select: [: each | (each class compiledMethodAt: #packages ifAbsent: [nil]) isNotNil]) isEmpty.

]
