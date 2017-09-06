Extension {
	#name : #ClassTestCase
}

{
	#category : #'*Refactoring-Critics',
	#timestamp : ' 8/31/2017 05:26:27'
}
ClassTestCase>>testMethodsOfTheClassShouldNotBeRepeatedInItsSuperclasses [
		
	self assertValidLintRule: RBEquivalentSuperclassMethodsRule new
]

{
	#category : #'*Refactoring-Critics',
	#timestamp : ' 8/31/2017 05:26:27'
}
ClassTestCase>>testTraitExplicitRequirementMethodsMustBeImplementedInTheClassOrInASuperclass [

	self assertValidLintRule: RBExplicitRequirementMethodsRule new
]
