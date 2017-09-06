"
To select rules.
"
Class {
	#name : #SelectRuleBrowser,
	#superclass : #SelectBrowser,
	#instVars : [
		'environment',
		'removeTestCase',
		'selectedRules'
	],
	#category : #Tool-CriticBrowser,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectRuleBrowser class>>items [

	| rules rulesByGroup integrationRules |
	rules := (ReRuleManager visibleRuleClasses collect: #new) sorted: [ :a :b |
		a name < b name ].
	integrationRules := rules select: [ :r |
		PharoCriticRules pharoHardLintRules includes: r class ].
	rulesByGroup := ((rules groupedBy: #group) associations collect: [ :as |
		CriticBrowserRulesGroup named: as key rules: as value ]).
	rulesByGroup sort: [ :a :b | a name < b name ].
	^ rulesByGroup copyWithFirst: (
		CriticBrowserRulesGroup
			named: 'Pharo integration rules'
			rules: integrationRules)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectRuleBrowser class>>openWithEnvironment: anEnvironment removeTestCase: aBoolean [

	self new
		items: self items;
		environment: anEnvironment;
		removeTestCase: aBoolean;
		openWithSpec;
		updateTree
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectRuleBrowser class>>title [
	^ 'Select rules'
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectRuleBrowser>>addAllItems [
	
	toSelectModel roots do: [ :group | selectedRules addAll: group rules].
	self updateTree.  	  
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectRuleBrowser>>addItems [
	toSelectModel selectedItem
		ifNotNil:
			[ :item |
			item content isComposite
				ifFalse: [ selectedRules add: item content ]
				ifTrue: [ selectedRules addAll: item content rules ] ].
	self updateTree
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectRuleBrowser>>defaultRulesRootName [
	^ 'Selected Rules'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectRuleBrowser>>environment: aEnv [
	environment := aEnv
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectRuleBrowser>>initialize [
	| wrappingBlock selectedRulesChildrenBlock rulesToSelectChildrenBlock |
	super initialize.
	toSelectModel := self instantiate: TreeModel.
	selectedModel := self instantiate: TreeModel.
	selectedRules := Set new.
	selectedRulesChildrenBlock := [ :rule | 
		rule isComposite
			ifTrue: [ rule rules
				select: [ :r | (self isSelected: r) or: [ r isComposite ] ] ]
			ifFalse: [ #() ] ].
	rulesToSelectChildrenBlock := [ :rule | 
		rule isComposite
			ifTrue: [ rule rules
				select: [ :r | 	(self isSelected: r) not or: [ r isComposite ] ] ]
			ifFalse: [ #() ] ].
	toSelectModel childrenBlock: rulesToSelectChildrenBlock.
	selectedModel childrenBlock: selectedRulesChildrenBlock.
	wrappingBlock := [ :rule | rule name ].
	toSelectModel displayBlock: wrappingBlock.
	selectedModel displayBlock: wrappingBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectRuleBrowser>>isSelected: aRule [
	"Check the rule identifier to not run twice the same rule"
	^ selectedRules anySatisfy: [ :rule | rule class uniqueIdentifierName = aRule class uniqueIdentifierName ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectRuleBrowser>>items: aCollection [
	
	toSelectModel roots: aCollection.
	selectedModel roots: aCollection

]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectRuleBrowser>>nextAction [

	self delete..
	
	CriticWorkingConfiguration current
		rule: selectedRules;
		environment: environment;
		removeTestCase: removeTestCase.
	CriticBrowser openOnWorkingConfiguration: CriticWorkingConfiguration current
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectRuleBrowser>>removeAllItems [
	
	selectedModel roots do: [ :item |  
		selectedRules removeAllFoundIn: item value ].
	self updateTree 	  
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectRuleBrowser>>removeItems [
	
	selectedModel selectedItem
		ifNotNil: [ :item | selectedRules removeAllFoundIn: item content leaves ].
	self updateTree  	  
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectRuleBrowser>>removeTestCase: aBoolean [
	removeTestCase := aBoolean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectRuleBrowser>>updateTree [

	toSelectModel updateTree.
	selectedModel updateTree.  	  
]
