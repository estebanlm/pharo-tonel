"
SUnit tests for SmalllintManifestChecker
"
Class {
	#name : #SmalllintManifestCheckerTest,
	#superclass : #TestCase,
	#instVars : [
		'checker'
	],
	#category : #Manifest-Tests,
	#timestamp : 'TorstenBergmann 2/19/2014 08:34'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:43'
}
SmalllintManifestCheckerTest class>>DoIt [
	^ MCWorkingCopy
		managersForClass: MFClassA
		do: [:p | ^ p first] 
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:43'
}
SmalllintManifestCheckerTest>>cleaningResources [
	Smalltalk globals
		at: #ManifestManifestResourcesTests
		ifPresent: [ :cl | 
			cl
				removeFromChanges;
				removeFromSystemUnlogged ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:43'
}
SmalllintManifestCheckerTest>>package  [
	MCWorkingCopy managersForClass: MFClassA  do: [:p | ^ p packageSet packages first].
	" should be equivalent to RPackageOrganizer default packageNamed: #'Manifest-Resources-Tests' "
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:43'
}
SmalllintManifestCheckerTest>>setUp [
	| bm |
	self cleaningResources.
	bm := TheManifestBuilder of: MFClassA.
	bm installFalsePositiveOf: RBCodeCruftLeftInMethodsRule uniqueIdentifierName version: 1.
	bm addFalsePositive: MFClassB >> #method3 of: RBCodeCruftLeftInMethodsRule uniqueIdentifierName version: 1.
	bm installToDoOf: GRTemporaryNeitherReadNorWrittenRule uniqueIdentifierName version: 1.
	bm
		addAllToDo:
			{(MFClassB >> #method3).
			(MFClassA >> #method)}
		of: GRTemporaryNeitherReadNorWrittenRule uniqueIdentifierName
		version: 1.
	checker := ReSmalllintChecker new
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:43'
}
SmalllintManifestCheckerTest>>tearDown [
	
	self cleaningResources.
	ASTCache reset
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
SmalllintManifestCheckerTest>>testCriticsOf [

	| rule critiques |
	rule := ReRuleManager visibleRuleClasses collect: #new.
	checker 
		rule: rule;
		environment: self package asEnvironment;
		run. 
	
	critiques := checker criticsOf: GRTemporaryNeitherReadNorWrittenRule new.
	
	self assert: critiques size  = 3.
	self assert: (critiques anySatisfy: [ :each |
		each sourceAnchor entity = (MFClassB>>#method3)]).
	self assert: (critiques anySatisfy: [ :each |
		each sourceAnchor entity = (MFClassA>>#method)]).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
SmalllintManifestCheckerTest>>testIsFalsePositive  [

	| rule |
	rule  := ReRuleManager visibleRuleClasses collect: #new.
	checker
		rule: rule;
		environment: self package asEnvironment;
		run.  
		
	self assert: (checker isFalsePositive:  (MFClassB>>#method3) forRuleId: (RBCodeCruftLeftInMethodsRule uniqueIdentifierName) versionId:  1).
	self deny: (checker isFalsePositive:  (MFClassA>>#method) forRuleId: (RBCodeCruftLeftInMethodsRule uniqueIdentifierName) versionId:  1).


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
SmalllintManifestCheckerTest>>testIsToDo [

	| rule |
	rule  := ReRuleManager visibleRuleClasses collect: #new.
	checker
		rule: rule;
		environment: self package asEnvironment;
		run.
	
	self assert: (checker isToDo:  (MFClassB>>#method3) forRuleId: (GRTemporaryNeitherReadNorWrittenRule uniqueIdentifierName) versionId:  1).
	self deny: (checker isToDo:  (MFClassB>>#method2) forRuleId: (GRTemporaryNeitherReadNorWrittenRule uniqueIdentifierName) versionId:  1).


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
SmalllintManifestCheckerTest>>testToDoOf [

	| rule |
	rule := ReRuleManager visibleRuleClasses collect: #new.
	checker
		rule: rule;
		environment: self package asEnvironment;
		run.
		
	self assert: (( checker toDoOf: GRTemporaryNeitherReadNorWrittenRule new) anySatisfy: [:each|
		each sourceAnchor entity = (MFClassB>>#method3)]).
	self deny: (( checker toDoOf: GRTemporaryNeitherReadNorWrittenRule new) anySatisfy: [:each|
		each  sourceAnchor entity = (MFClassB>>#method2)]).
]
