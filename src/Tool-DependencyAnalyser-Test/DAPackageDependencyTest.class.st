"

"
Class {
	#name : #DAPackageDependencyTest,
	#superclass : #TestCase,
	#instVars : [
		'aPackageDependency',
		'anInternalPackageDependency',
		'packageA',
		'packageB'
	],
	#category : #Tool-DependencyAnalyser-Test,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:38'
}
DAPackageDependencyTest>>inheritanceDependency: aClass [
	^ (DAInheritanceDependency from: packageA to: packageB)
		theClass: aClass;
		superclass: nil;
		yourself
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:38'
}
DAPackageDependencyTest>>referenceDependency: aClass [
	^ (DAReferenceDependency from: packageA to: packageB)
		theClass: aClass;
		selector: nil;
		reference: nil;
		method: nil;
		yourself
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:38'
}
DAPackageDependencyTest>>setUp [
	| source target |
	source := DAPackage on: (RPackageSet named:'Kernel').
	target := DAPackage on: (RPackageSet named:'Collections-Abstract').
	aPackageDependency := DAPackageDependency from:source to:target.
	anInternalPackageDependency := DAPackageDependency from:source to:source.
	packageA := DAPackage on: (RPackageSet named:'A').
	packageB := DAPackage on: (RPackageSet named:'B').
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:38'
}
DAPackageDependencyTest>>testContainsOnlyExtensionDependency [
	| aCompositeDependency |
	aCompositeDependency := DACompositeDependency
		from: (packageA)
		to: (packageB).
	aCompositeDependency
		add:
			(DAInheritanceDependency from: (packageA) to: (packageB));
		add:
			(DAInheritanceDependency from: (packageA) to: (packageB)).
	self deny: (aCompositeDependency containsOnlyExtensionDependency).
	aCompositeDependency dependencies removeAll.
		aCompositeDependency
		add:
			(DAExtensionDependency from: (packageA) to: (packageB));
		add:
			(DAExtensionDependency from: (packageA) to: (packageB)).
	self assert: (aCompositeDependency containsOnlyExtensionDependency).
		
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:38'
}
DAPackageDependencyTest>>testDependenciesFrom [
	| aCompositeDependency |
	aCompositeDependency := DACompositeDependency from: packageA to: packageB.
		aCompositeDependency
		add: (self referenceDependency: String);
		add: (self referenceDependency: Object);
		add: (self referenceDependency: String);
		add: (self inheritanceDependency: Stack).
	self assert: ((aCompositeDependency referenceDependenciesFrom: String) size = 2).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:38'
}
DAPackageDependencyTest>>testDependenciesSize [
	| aCompositeDependency |
	aCompositeDependency := DACompositeDependency from: packageA to: packageB.
	aCompositeDependency
		add: (DAInheritanceDependency from: packageA to: packageB);
		add: (DAInheritanceDependency from: packageA to: packageB).
	self assert: aCompositeDependency extensionDependenciesSize = 0.
	aCompositeDependency add: (DAExtensionDependency from: packageA to: packageB).
	self assert: aCompositeDependency extensionDependenciesSize = 1
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:38'
}
DAPackageDependencyTest>>testDependenciesWithoutExtensionDependency [
	| aCompositeDependency |
	aCompositeDependency := DACompositeDependency
		from: (packageA)
		to: (packageB).
	aCompositeDependency
		add:
			(DAInheritanceDependency from: (packageA) to: (packageB));
		add:
			(DAInheritanceDependency from: (packageA) to: (packageB));
		add:
			(DAExtensionDependency from: (packageA) to: (packageB)).
	self assert: (aCompositeDependency dependenciesWithoutExtensionDependency size = 2).
		
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:38'
}
DAPackageDependencyTest>>testEquals [
	self assert: (aPackageDependency = aPackageDependency)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:38'
}
DAPackageDependencyTest>>testExtensionDependencies [
	| aCompositeDependency |
	aCompositeDependency := DACompositeDependency
		from: (packageA)
		to: (packageB).
	aCompositeDependency
		add:
			(DAExtensionDependency from: (packageA) to: (packageB));
		add:
			(DAInheritanceDependency from: (packageA) to: (packageB)).
	self assert: (aCompositeDependency extensionDependencies allSatisfy: [ :each | each isExtensionDependency ]).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:38'
}
DAPackageDependencyTest>>testIsExternal [
	self assert: (aPackageDependency isExternal)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:38'
}
DAPackageDependencyTest>>testIsInternal [
	self assert: (anInternalPackageDependency isInternal)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:38'
}
DAPackageDependencyTest>>testReferenceDependencies [
	| aCompositeDependency |
	aCompositeDependency := DACompositeDependency from: packageA to: packageB.
	aCompositeDependency
		add: (self referenceDependency: String);
		add: (self referenceDependency: Object);
		add: (DAInheritanceDependency from: packageA to: packageB).
		
	self assert: (aCompositeDependency referenceDependencies size = 2).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:38'
}
DAPackageDependencyTest>>testReferenceDependenciesFrom [
	| aCompositeDependency |
	aCompositeDependency := DACompositeDependency from: packageA to: packageB.
		aCompositeDependency
		add: (self referenceDependency: String);
		add: (self referenceDependency: Object);
		add: (self referenceDependency: String).
		
	self assert: ((aCompositeDependency referenceDependenciesFrom: String) size = 2).
]
