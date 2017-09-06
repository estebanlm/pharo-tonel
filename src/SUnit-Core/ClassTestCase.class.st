"
This class is intended for unit tests of individual classes and their metaclasses.

It provides methods to determine the coverage of the unit tests.

Subclasses are expected to re-implement #classesToBeTested and #selectorsToBeIgnored.

They should also implement to confirm that all methods have been tested.

#testCoverage

	super testCoverage.


"
Class {
	#name : #ClassTestCase,
	#superclass : #TestCase,
	#category : #SUnit-Core-Utilities,
	#timestamp : 'brp 7/26/2003 16:57'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassTestCase class>>isAbstract [
	"Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"

	^self name = #ClassTestCase
			
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassTestCase class>>mustTestCoverage [

	^ false
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassTestCase>>categoriesForClass: aClass [

 ^ aClass organization allMethodSelectors collect: 
			[:each |  aClass organization categoryOfElement: each].

]

{
	#category : #coverage,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassTestCase>>classToBeTested [
	
	self subclassResponsibility
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassTestCase>>differentMethodsWithSameSelectorBetween: firstClass and: secondClass [
	| repeatedSelectors differentMethodsWithSameSelector |
	
	repeatedSelectors := firstClass localSelectors intersection: secondClass localSelectors.
	
	differentMethodsWithSameSelector := repeatedSelectors select: [ :selector | | m1 m2| 
										 m1 := firstClass>>selector. 
										 m2 := secondClass>>selector.
										 m1 sourceCode ~= m2 sourceCode].
									
	^differentMethodsWithSameSelector.
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassTestCase>>repeatedMethodsThatDoNotAccessInstanceVariablesBetween: firstClass and: secondClass [
	| repeatedSelectors repeatedMethodsThatDoNotAccessInstanceVariables |
	
	repeatedSelectors := firstClass localSelectors intersection: secondClass localSelectors.
	
	repeatedMethodsThatDoNotAccessInstanceVariables := repeatedSelectors select: [ :selector | | m1 m2| 
										 m1 := firstClass>>selector. 
										 m2 := secondClass>>selector.
										((m1 sourceCode = m2 sourceCode) and: [ m1 hasInstVarRef not ]) and: [ m2 hasInstVarRef not ]].
									
	^repeatedMethodsThatDoNotAccessInstanceVariables.
]

{
	#category : #coverage,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassTestCase>>selectorsNotTested [

	^ self selectorsToBeTested difference: self selectorsTested.

]

{
	#category : #coverage,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassTestCase>>selectorsTested [
	| literals |
	literals := Set new.
	self class
		selectorsAndMethodsDo: [ :s :m | (s beginsWith: 'test')
			ifTrue: [ literals addAll: (m messages)] ].
	^ literals asArray sort
]

{
	#category : #coverage,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassTestCase>>selectorsToBeIgnored [
	^ #(#DoIt #DoItIn:)
]

{
	#category : #coverage,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassTestCase>>selectorsToBeTested [

	^ ( { self classToBeTested. self classToBeTested class } flatCollect: [:c | c selectors]) 
			difference: self selectorsToBeIgnored
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassTestCase>>targetClass [
	[ ^ self classToBeTested ]
		on: Error
		do: [ 
			| className |
			className := self class name asString copyFrom: 1 to: self class name size - 4.
			^ Smalltalk globals at: className asString asSymbol ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassTestCase>>testClassComment [
	self assert: self targetClass organization hasComment.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassTestCase>>testCoverage [

	| untested | 
	self class mustTestCoverage ifTrue:
		[ untested := self selectorsNotTested.
		self assert: untested isEmpty 
		description: untested size asString, ' selectors are not covered' ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassTestCase>>testNew [
	self targetClass new
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassTestCase>>testUnCategorizedMethods [
	| uncategorizedMethods  |
	uncategorizedMethods := self targetClass selectorsInProtocol: Protocol unclassified.
	self 
		assert: uncategorizedMethods isEmpty
		description: uncategorizedMethods asString	
]
