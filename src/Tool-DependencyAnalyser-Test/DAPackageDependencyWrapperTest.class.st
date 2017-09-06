"

"
Class {
	#name : #DAPackageDependencyWrapperTest,
	#superclass : #TestCase,
	#instVars : [
		'packageA',
		'aPDPackageDependencyWrapper'
	],
	#category : #Tool-DependencyAnalyser-Test,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:38'
}
DAPackageDependencyWrapperTest>>setUp [
	packageA := DAPackage on: (RPackageSet named:'A').
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:38'
}
DAPackageDependencyWrapperTest>>testInitializeFrom [
	aPDPackageDependencyWrapper := DAPackageDependencyWrapper newWith: packageA.
	self assert: (aPDPackageDependencyWrapper daPackage = packageA).
]
