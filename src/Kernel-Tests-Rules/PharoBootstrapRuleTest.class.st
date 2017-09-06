"

"
Class {
	#name : #PharoBootstrapRuleTest,
	#superclass : #TestCase,
	#instVars : [
		'checkerBackup'
	],
	#category : #Kernel-Tests-Rules,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:43'
}
PharoBootstrapRuleTest>>setUp [
	checkerBackup := PharoBootstrapRule
		classVarNamed: 'DependencyChecker'.
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:43'
}
PharoBootstrapRuleTest>>tearDown [
	PharoBootstrapRule
		classVarNamed: 'DependencyChecker' 
		put: checkerBackup.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
PharoBootstrapRuleTest>>testRuleDoesNotFailIfAppliedOnNonBootstrapPackage [
	| rule critiques |
	rule := PharoBootstrapRule new.
	rule class 
		classVarNamed: 'DependencyChecker'
		put: PharoBootstrapAnalyzerStubWithNoNewDependency.

	critiques := rule check: (RPackage named: #P1).

	self assert: critiques isEmpty
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
PharoBootstrapRuleTest>>testRuleDoesNotFailIfNoNewExternalDependency [
	| rule critiques |
	rule := PharoBootstrapRule new.
	rule class 
		classVarNamed: 'DependencyChecker'
		put: PharoBootstrapAnalyzerStubWithNoNewDependency.

	critiques := rule check: (RPackage named: #Kernel).

	self assert: critiques isEmpty
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
PharoBootstrapRuleTest>>testRuleFailsIfAnyNewExternalDependencyFound [
	| rule packageUnderTest critiques |
	rule := PharoBootstrapRule new.
	rule class 
		classVarNamed: 'DependencyChecker' 
		put: PharoBootstrapAnalyzerStubWithNewDependency.
	packageUnderTest := RPackage named: #Kernel.

	critiques := rule check: packageUnderTest.

	self assert: critiques size equals: 1.

	self
		assert: critiques anyOne sourceAnchor entity
		equals: packageUnderTest
]
