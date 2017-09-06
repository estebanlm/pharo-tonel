"
SUnit tests for ClassFactoryForTestCase 
"
Class {
	#name : #ClassFactoryForTestCaseTest,
	#superclass : #TestCase,
	#instVars : [
		'factory'
	],
	#category : #SUnit-Tests-Core,
	#timestamp : 'TorstenBergmann 2/12/2014 23:17'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCaseTest class>>defaultTimeLimit [
	^10 seconds
]

{
	#category : #history,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCaseTest class>>lastStoredRun [
	^ ((Dictionary new) add: (#passed->((Set new) add: #testDefaultCategoryCleanUp; add: #testPackageCleanUp; add: #testSingleClassCreation; add: #testClassCreationInDifferentCategories; add: #testClassFastCreationInDifferentCategories; add: #testMultipleClassCreation; add: #testSingleClassFastCreation; yourself)); add: (#timeStamp->'22 November 2008 10:11:35 pm'); add: (#failures->((Set new))); add: (#errors->((Set new))); yourself)
]

{
	#category : #setUp-tearDown,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCaseTest>>setUp [
	super setUp.
	factory := ClassFactoryForTestCase new
]

{
	#category : #setUp-tearDown,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCaseTest>>tearDown [
	super tearDown.
	factory cleanUp
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCaseTest>>testClassCreationInDifferentCategories [
	| firstThreeClasses lastTwoClasses |
	3 timesRepeat: [
		factory newSubclassOf: Object instanceVariableNames: '' classVariableNames: '' category: #One].
	firstThreeClasses := factory createdClasses copy.
	2 timesRepeat: [
		factory newSubclassOf: Object instanceVariableNames: '' classVariableNames: '' category: #Two].
	lastTwoClasses := factory createdClasses copyWithoutAll: firstThreeClasses.
	self assert: (firstThreeClasses allSatisfy: [:class| class category = (factory packageName, '-', #One) asSymbol]).
	self assert: (lastTwoClasses allSatisfy: [:class| class category = (factory packageName, '-', #Two) asSymbol]).
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCaseTest>>testClassFastCreationInDifferentCategories [
	| firstThreeClasses lastTwoClasses |
	3 timesRepeat: [
		factory newClassInCategory: #One].
	firstThreeClasses := factory createdClasses copy.
	2 timesRepeat: [
		factory newClassInCategory: #Two].
	lastTwoClasses := factory createdClasses copyWithoutAll: firstThreeClasses.
	self assert: (firstThreeClasses allSatisfy: [:class| class category = (factory packageName, '-', #One) asSymbol]).
	self assert: (lastTwoClasses allSatisfy: [:class| class category = (factory packageName, '-', #Two) asSymbol]).
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCaseTest>>testDefaultCategoryCleanUp [
	| createdClassNames allClasses allTraits |
	
	3 timesRepeat: [
		factory newClass.
		factory newTrait].
	
	createdClassNames := factory createdClassNames.
	
	factory cleanUp.	
	
	self assert: (factory createdClasses allSatisfy: [:class| class isObsolete]). 
	self assert: (factory createdTraits allSatisfy: [:trait| trait isObsolete]). 
	
	allClasses := SystemNavigation new allClasses.
	allTraits := Smalltalk globals allTraits.
	
	self assert: (factory createdClasses noneSatisfy: [:class| allClasses includes: class]).
	self assert: (factory createdTraits noneSatisfy: [:trait| allTraits includes: trait]).
	self deny: (SystemOrganization categories includes: factory defaultCategory). 
	self class environment at: #ChangeSet ifPresent: [:changeSet |
		self deny: (changeSet current changedClassNames includesAnyOf: createdClassNames) ].

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCaseTest>>testDuplicateClassWithNewName [
	| createdClass |
	
	"Skip this tests if no compiler is available. Do not use #skip because it breaks an announcements tests"
	
	Smalltalk compilerClass ifNotNil: [ 	
		createdClass := factory duplicateClass: TestCase withNewName: #MyTestClass.
		self assert: (factory createdClasses allSatisfy: [:class| self class environment includesKey: class name ]).
		factory cleanUp.
		self assert: (factory createdClasses allSatisfy: [:class| class isObsolete]).
		self deny: (ChangeSet current changedClassNames includes: createdClass).]
	

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCaseTest>>testMultipleClassCreation [
	5 timesRepeat: [
		factory newClass].
	self assert: (SystemNavigation new allClasses includesAll: factory createdClasses).
	self assert: factory createdClassNames asSet size = 5.
	self assert: (SystemOrganization listAtCategoryNamed: factory defaultCategory) asSet = factory createdClassNames asSet
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCaseTest>>testPackageCleanUp [
	| createdClassNames allClasses |
	3 timesRepeat: [
		factory newClassInCategory: #One].
	2 timesRepeat: [
		factory newClassInCategory: #Two].
	createdClassNames := factory createdClassNames.
	factory cleanUp.	
	self assert: (factory createdClasses allSatisfy: [:class| class isObsolete]). 
	allClasses := SystemNavigation new allClasses.
	self assert: (factory createdClasses noneSatisfy: [:class| allClasses includes: class]).
	self assert: (SystemOrganization categoriesMatching: factory packageName, '*') isEmpty. 
	self class environment at: #ChangeSet ifPresent: [:changeSet |
		self deny: (changeSet current changedClassNames includesAnyOf: createdClassNames) ].

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCaseTest>>testSingleClassCreation [
	|class elementsInCategoryForTest |
	class := factory 
		newSubclassOf: Object 
		instanceVariableNames: 'a b c' 
		classVariableNames: 'X Y'.
	self assert: (SystemNavigation new allClasses includes: class).
	elementsInCategoryForTest := SystemOrganization listAtCategoryNamed: factory defaultCategory. 
	self assert: elementsInCategoryForTest = {class name}.
	self assert: class instVarNames = #(a b c).
	self assert: class classPool keys asSet = #(X Y) asSet
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCaseTest>>testSingleClassFastCreation [
	|class elementsInCategoryForTest |
	class := factory newClass.
	self assert: (SystemNavigation new allClasses includes: class).
	elementsInCategoryForTest := SystemOrganization listAtCategoryNamed: factory defaultCategory. 
	self assert: elementsInCategoryForTest = {class name}.
	self assert: class instVarNames isEmpty.
	self assert: class classPool isEmpty
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCaseTest>>testSingleTraitCreation [
	| trait |
	trait := factory newTrait.
	self assert: (Smalltalk globals allTraits includes: trait).
	self assert: trait traitUsers size = 0.
	self assert: trait traits size = 0
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCaseTest>>testTraitCreationInDifferentCategories [
	| firstThreeTraits lastTwoTraits |
	3 timesRepeat: [
		factory newTraitInCategory: #One].
	firstThreeTraits := factory createdTraits copy.
	2 timesRepeat: [
		factory newTraitInCategory: #Two].
	lastTwoTraits := factory createdTraits copyWithoutAll: firstThreeTraits.
	self assert: (firstThreeTraits allSatisfy: [:trait| trait category = (factory packageName, '-', #One) asSymbol]).
	self assert: (lastTwoTraits allSatisfy: [:trait| trait category = (factory packageName, '-', #Two) asSymbol]).
]
