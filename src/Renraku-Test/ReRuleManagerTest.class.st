"

"
Class {
	#name : #ReRuleManagerTest,
	#superclass : #RenrakuBaseTestCase,
	#category : #Renraku-Test,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReRuleManagerTest>>testClassAdded [

	| rule rulesCount |
	
	ReRuleManager reset.
	
	rulesCount := ReRuleManager default nodeRules size.
	
	rule := ReNodeMatchRule 
		subclass: #ReRuleManagerTestingRule
		instanceVariableNames: ''
		classVariableNames: ''
		category: testPackage name.
		
	rule compile: 'name ^ ''test'''.

	self
		assert: ReRuleManager default nodeRules size - rulesCount
		equals: 1.

	self assert:
		(ReRuleManager default allRules anySatisfy: [ :r |
			r class == rule ]).
		
	rule removeFromSystem.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReRuleManagerTest>>testClassRemoved [

	| rule |
	
	rule := ReAbstractRule 
		subclass: #ReRuleManagerTestingRule
		instanceVariableNames: ''
		classVariableNames: ''
		category: testPackage name.
	rule class
		compile: 'checksMethod ^ true'.
		
	rule compile: 'name ^ ''test'''.

	ReRuleManager reset.

	self assert:
		(ReRuleManager default allRules anySatisfy: [ :r |
			r class == rule ]).
		
	rule removeFromSystem.
		
	self assert:
		(ReRuleManager default allRules noneSatisfy: [ :r |
			r class == rule ]).
]
