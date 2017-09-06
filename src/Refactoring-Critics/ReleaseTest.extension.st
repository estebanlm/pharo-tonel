Extension {
	#name : #ReleaseTest
}

{
	#category : #'*Refactoring-Critics',
	#timestamp : ' 8/31/2017 05:26:27'
}
ReleaseTest>>testExplicitRequirementMethodsShouldBeImplementedInTheirUsers [
	"If a class is using a trait with an explicit requirement method, this class should implement the method"
	| result |
	result := RBExplicitRequirementMethodsRule new run.
	self assert: result isEmpty.
]

{
	#category : #'*Refactoring-Critics',
	#timestamp : ' 8/31/2017 05:26:27'
}
ReleaseTest>>testLocalMethodsOfTheClassShouldNotBeRepeatedInItsTraits [
	"If a class is using a trait with an explicit requirement method, this class should implement the method"
	
	self assertValidLintRule: RBLocalMethodsOfAClassNotInItsTraitComposition new
]
