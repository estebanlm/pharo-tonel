"

"
Class {
	#name : #RenrakuGlobalBanningTest,
	#superclass : #ReCodeBasedTestCase,
	#instVars : [
		'oldRulesSettings'
	],
	#category : #Renraku-Test,
	#timestamp : ''
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:45'
}
RenrakuGlobalBanningTest>>setUp [
	super setUp.
	oldRulesSettings := Dictionary new.

	ReAbstractRule withAllSubclassesDo: [ :rule |
		oldRulesSettings at: rule put: rule enabled ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:45'
}
RenrakuGlobalBanningTest>>tearDown [
	oldRulesSettings keysAndValuesDo: [ :rule :setting |
		rule enabled: setting ].
	super tearDown
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RenrakuGlobalBanningTest>>testForcedRuleOnClassWithGlobalBan [
	| criticToSkip |
		
	criticToSkip := testClass critiques detect: [ :critic |
		critic rule class = ScreamerRule ].
	
	ReImageRuleBaner ban: criticToSkip.
	
	testPackage packageManifest class compile:
		'forcedRules ^ #(',
		ScreamerRule name,
		')'.
		
	ReRuleManager reset.
	
	self assert: (testClass critiques anySatisfy: [ :critic |
		critic rule class = ScreamerRule ]).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RenrakuGlobalBanningTest>>testForcedRuleOnClassWithPackageBan [
	| criticToSkip |
		
	criticToSkip := testClass critiques detect: [ :critic |
		critic rule class = ScreamerRule ].
	
	testPackage ban: criticToSkip.
	
	testPackage packageManifest class compile:
		'forcedRules ^ #(',
		ScreamerRule name,
		')'.
		
	ReRuleManager reset.
	
	self assert: (testClass critiques anySatisfy: [ :critic |
		critic rule class = ScreamerRule ]).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RenrakuGlobalBanningTest>>testForcedRuleOnMethodWithGlobalBan [
	| criticToSkip |
		
	criticToSkip := testMethod critiques detect: [ :critic |
		critic rule class = ScreamerRule ].
	
	ReImageRuleBaner ban: criticToSkip.
	
	testPackage packageManifest class compile:
		'forcedRules ^ #(',
		ScreamerRule name,
		')'.
		
	ReRuleManager reset.
	
	self assert: (testMethod critiques anySatisfy: [ :critic |
		critic rule class = ScreamerRule ]).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RenrakuGlobalBanningTest>>testForcedRuleOnMethodWithPackageBan [
	| criticToSkip |
		
	criticToSkip := testMethod critiques detect: [ :critic |
		critic rule class = ScreamerRule ].
	
	testPackage ban: criticToSkip.
	
	testPackage packageManifest class compile:
		'forcedRules ^ #(',
		ScreamerRule name,
		')'.
		
	ReRuleManager reset.
	
	self assert: (testMethod critiques anySatisfy: [ :critic |
		critic rule class = ScreamerRule ]).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
RenrakuGlobalBanningTest>>testGlobalBan [
	| criticToSkip |
		
	criticToSkip := testClass critiques detect: [ :critic |
		critic rule class = ScreamerRule ].
	
	ReImageRuleBaner ban: criticToSkip.
	
	self assert: (testClass critiques noneSatisfy: [ :critic |
		critic rule class = ScreamerRule ]).
]
