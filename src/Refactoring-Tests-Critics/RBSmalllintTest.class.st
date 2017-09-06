"

"
Class {
	#name : #RBSmalllintTest,
	#superclass : #TestCase,
	#category : #Refactoring-Tests-Critics,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest class>>packageNamesUnderTest [
	^ #('Refactoring-Critics')
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>assertEnvironment: superEnvironment hasAllClassesInEnvironment: subEnvironment [
	subEnvironment classesDo: [ :class |
		self assert: (superEnvironment includesClass: class) ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>assertEnvironment: superEnvironment hasAllSelectorsInEnvironment: subEnvironment [
	subEnvironment classesDo: [ :class | 
		(subEnvironment selectorsForClass: class) 
			do: [ :selector |
				self assert: (superEnvironment includesSelector: selector in: class) ] ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>assertIsValidRule: aRule [
	self
		assert: (aRule name isString and: [ aRule name notEmpty ])
		description: 'Missing rule name'.
	self
		assert: (aRule group isString and: [ aRule group notEmpty ])
		description: 'Missing group name'.
	self
		assert: (aRule rationale isString and: [ aRule rationale notEmpty ])
		description: 'Missing rationale'.
	self
		assert: (#(error warning information) includes: aRule severity)
		description: 'Invalid severity'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>assertResultOfRule: aLintRule hasSameClassesAsEnvironment: anEnvironment [
	| resultEnvironment |
	resultEnvironment := aLintRule result.
	self assertEnvironment: resultEnvironment hasAllClassesInEnvironment: anEnvironment.
	self assertEnvironment: anEnvironment hasAllClassesInEnvironment: resultEnvironment
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>assertResultOfRule: aLintRule hasSameSelectorsAsEnvironment: anEnvironment [
	| resultEnvironment |
	resultEnvironment := aLintRule result.
	self assertEnvironment: resultEnvironment hasAllSelectorsInEnvironment: anEnvironment.
	self assertEnvironment: anEnvironment hasAllSelectorsInEnvironment: resultEnvironment
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>classAndMetaClassRuleFor: aTestSelector [
	self classAndMetaClassRuleFor: aTestSelector plusClasses: #()
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>classAndMetaClassRuleFor: aTestSelector plusClasses: aCollectionOfTestedClasses [
	| rule expectedResultClasses expectedResultEnvironment |
	rule := self
		runRuleFor: aTestSelector
		onEnvironment: self classEnvironmentWithAllObjectClasses.
	expectedResultClasses :=
		(aCollectionOfTestedClasses copyWith: (self objectClassFor: aTestSelector)).
	expectedResultEnvironment :=
		self classEnvironmentWithAll: expectedResultClasses.
	expectedResultClasses do: [ :each |
		expectedResultEnvironment addClass: each theMetaClass ].
	self
		assertResultOfRule: rule
		hasSameClassesAsEnvironment: expectedResultEnvironment
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>classEnvironmentWith: aClass [
	^ self classEnvironmentWithAll: (Array with: aClass)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>classEnvironmentWithAll: aClassCollection [
	| classEnvironment |
	classEnvironment := RBClassEnvironment new.
	aClassCollection do: [ :each | classEnvironment addClass: each ].
	^ classEnvironment
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>classEnvironmentWithAllObjectClasses [
	^ self classEnvironmentWithAll: RBSmalllintTestSuperclassObject withAllSubclasses
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>classNamed: aSymbol [
	^ self class environment
		at: aSymbol
		ifAbsent: [ self error: aSymbol asString , ' class not found' ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>classRuleFor: aTestSelector [
	^ self classRuleFor: aTestSelector plusClasses: #()
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>classRuleFor: aTestSelector plusClasses: aCollectionOfTestedClasses [
	| rule expectedResultEnvironment |
	rule := self
		runRuleFor: aTestSelector
		onEnvironment: self classEnvironmentWithAllObjectClasses.
	expectedResultEnvironment :=
		self classEnvironmentWithAll:
			(aCollectionOfTestedClasses copyWith:
				(self objectClassFor: aTestSelector)).
	self
		assertResultOfRule: rule
		hasSameClassesAsEnvironment: expectedResultEnvironment
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>currentSelector [
	^ testSelector
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>objectClassFor: aTestSelector [
	^ self classNamed:
		('RBSmalllintTest',
		(aTestSelector asString allButFirst: 4 "'test' size"),
		'Object') asSymbol
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>objectClassSelectorFor: aTestSelector [
	^ (aTestSelector asString allButFirst: 4) "'test' size"
		uncapitalized asSymbol
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>ruleClassFor: aTestSelector [
	^ self classNamed:
		('RB',
		(aTestSelector asString allButFirst: 4), "'test' size"
		'Rule') asSymbol.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>ruleFor: aTestSelector [
	self ruleFor: aTestSelector plusSelectors: #()
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>ruleFor: aTestSelector plusSelectors: aCollectionOfTestedSelectors [
	| rule expectedResultEnvironment |
	rule := self
		runRuleFor: aTestSelector
		onEnvironment: (self classEnvironmentWith: RBSmalllintTestObject).
	expectedResultEnvironment := RBSelectorEnvironment new.
	(aCollectionOfTestedSelectors
		copyWith: (self objectClassSelectorFor: aTestSelector))
		do: [ :each | 
			expectedResultEnvironment addClass: RBSmalllintTestObject selector: each.
			self
				assert: (RBSmalllintTestObject includesSelector: each)
				description: 'Missing test method RBSmalllintTestObject>>' , each printString ].
	self
		assertResultOfRule: rule
		hasSameSelectorsAsEnvironment: expectedResultEnvironment
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>runRuleFor: aTestSelector onEnvironment: anEnvironment [
	| rule |
	rule := (self ruleClassFor: aTestSelector) new.
	self assertIsValidRule: rule.
	RBSmalllintChecker
		runRule: rule
		onEnvironment: anEnvironment.
	^ rule.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testAddRemoveDependents [
	self classRuleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testAsOrderedCollectionNotNeeded [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testAssignmentInBlock [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testAssignmentInIfTrue [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testAssignmentWithoutEffect [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testAtIfAbsent [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testBadMessage [
	self ruleFor: self currentSelector plusSelectors: #(badMessage collectionMessagesToExternalObject)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testBooleanPrecedence [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testClassNotReferenced [
	self classAndMetaClassRuleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testCodeCruftLeftInMethods [
	self ruleFor: self currentSelector plusSelectors: #(haltClassMentioned flagged transcriptMentioned debbuggingMessageSent)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testCollectSelectNotUsed [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testCollectionMessagesToExternalObject [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testCollectionProtocol [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testContains [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testDefinesEqualNotHash [
	self classRuleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testDetectContains [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testEmptyExceptionHandler [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testEndTrueFalse [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testEqualNotUsed [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testEqualsTrue [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testEquivalentSuperclassMethods [
	^ self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testExtraBlock [
	self 
		ruleFor: self currentSelector
		plusSelectors: #(#testMethod1 )
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testFileBlocks [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testFloatEqualityComparison [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testFullBlocks [
	"skip this test in squeak"

"	self blockRuleFor: self currentSelector
		plusSelectors: #(#caller1 #fullBlocks #detectContains #fileBlocks #moveDefinition #caller #assignmentInBlock #equalNotUsed #stringConcatenation #noMoveDefinition #referencesConditionFor: #returnInEnsure)"
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testGuardingClause [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testIfTrueReturns [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testJustSendsSuper [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testLiteralArrayCharacters [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testLiteralArrayContainsComma [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testLongMethods [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testMinMax [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testModifiesCollection [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testMultiplePeriodsTerminatingStatement [
	self
		ruleFor: self currentSelector
		plusSelectors: #(multiplePeriodsTerminatingAssignmentStatement)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testNoClassComment [
	self classAndMetaClassRuleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testPrecedence [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testRBMissingSubclassResponsibilityRule [
	| sup sub1 sub2 |
	sup := Object subclass: 'MySuperclass' instanceVariableNames: '' classVariableNames: '' poolDictionaries: '' category: self class category.
	sub1 := sup subclass: 'MySubclass1' instanceVariableNames: '' classVariableNames: '' poolDictionaries: '' category: self class category.
	sub2 := sup subclass: 'MySubclass2' instanceVariableNames: '' classVariableNames: '' poolDictionaries: '' category: self class category.
	
	sub1 compile: 'method ^ 3'.
	sub2 compile: 'method ^ 5'.
	
	self deny: (RBMissingSubclassResponsibilityRule new
		runOnEnvironment: (RBClassEnvironment class: sup);
		result) isEmpty.
	
	sup  compile: 'method ^ 2'.
		
	self assert: (RBMissingSubclassResponsibilityRule new
		runOnEnvironment: (RBClassEnvironment class: sup);
		result) isEmpty.
		
	sup  compile: 'method ^self subclassResponsibility'.
		
	self assert: (RBMissingSubclassResponsibilityRule new
		runOnEnvironment: (RBClassEnvironment class: sup);
		result) isEmpty.
		
	sub1 removeFromSystem.
	sub2 removeFromSystem.
	sup  removeFromSystem
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testRefersToClass [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testReturnInEnsure [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testReturnsBooleanAndOther [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testReturnsIfTrue [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testSearchingLiteral [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testSendsDifferentSuper [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testShouldntRaiseError [
	self
		ruleFor: self currentSelector
		plusSelectors: #(shouldntRaiseException)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testSizeCheck [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testStringConcatenation [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testTempVarOverridesInstVar [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testTempsReadBeforeWritten [
	self ruleFor: self currentSelector
		plusSelectors: #(#inlineTemporary #noMoveDefinition #tempsReadBeforeWritten #equalNotUsed #fileBlocks #referencesConditionFor:)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testThreeElementPoint [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testToDo [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testToDoCollect [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testToDoWithIncrement [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testUnaryAccessingMethodWithoutReturn [
	self
		ruleFor: self currentSelector
		plusSelectors:
			#(#unaryAccessingMessageStatementMethodWithoutReturn
				#unaryAccessingBranchingStatementMethodWithoutReturn)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testUnclassifiedMethods [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testUncommonMessageSend [
	self ruleFor: self currentSelector plusSelectors: {#uncommonMessageSend2}
]

{
	#category : #'test unique identifier',
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testUniqueIdentifierName [

	| idToRules |

	idToRules := Dictionary new.
	RBLintRule allSubclasses do: [ :ruleClass | 
		(idToRules at: ruleClass uniqueIdentifierName ifAbsentPut: [ Set new ]) add: ruleClass ].
	self assert: (idToRules noneSatisfy: [ :ruleClasses | ruleClasses size > 1 ]).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testUnoptimizedAndOr [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testUsesAdd [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testUsesTrue [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testWhileTrue [
	self ruleFor: self currentSelector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTest>>testYourselfNotUsed [
	self ruleFor: self currentSelector
]
