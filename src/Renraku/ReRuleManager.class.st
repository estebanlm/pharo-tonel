"
I should be used as singleton which provides sets of rules for checking classes and methods.

Use:

ReRuleManager uniqueInstance classRules ""to get rules for checking classes""
ReRuleManager uniqueInstance methodRules ""to get rules for checking methods""
"
Class {
	#name : #ReRuleManager,
	#superclass : #Object,
	#instVars : [
		'rules'
	],
	#classInstVars : [
		'uniqueInstance',
		'managers',
		'default'
	],
	#category : #Renraku-Utility,
	#timestamp : 'YuriyTymchuk 11/20/2015 16:41'
}

{
	#category : #utility,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRuleManager class>>availableRuleGroups [
	^ (self visibleRuleClasses
		collect: [ :r | r new group ]
		as: Set)
			asArray sorted
]

{
	#category : #'event subscriptions',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRuleManager class>>classAddedOrRemoved: aClassAddedAnnouncement  [
	| class |
	class := aClassAddedAnnouncement classAffected.

	((class inheritsFrom: RBLintRule) or: [ 
	  class inheritsFrom: ReAbstractRule ]) 
		ifTrue: [ self reset ] 
]

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRuleManager class>>cleanUp [

	self reset
]

{
	#category : #'event subscriptions',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRuleManager class>>critiqueBanned: aReCritiqueBanned [
	| baner |
	baner := aReCritiqueBanned entityBanLevel.
	
	baner class = RPackage
		ifTrue: [ self removeManagerFor: baner ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRuleManager class>>default [
	^ default ifNil: [ default := self newWithRules: self defaultRules ]
]

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRuleManager class>>defaultRules [
	^ self visibleRuleClasses
			reject: [ :ruleClass |
				"lint rules suck again…"
				((ruleClass inheritsFrom: ReAbstractRule) and: [ ruleClass enabled not ]) or: [ 
				self excludedRuleNames includes: ruleClass name ] ] 
			thenCollect: #new
]

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRuleManager class>>excludedRuleNames [

	^ #(RBImplementedNotSentRule)
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRuleManager class>>initialize [
	self allInstances do: [ :inst |
		self flag: 'remove in future. this is just to stop
		            the announcements from choaking old instances'.
		SystemAnnouncer uniqueInstance unsubscribe: inst ].

	self reset.
	self subscribe.
]

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRuleManager class>>managerFor: aCodeEntity  [
	^ self managers
		at: aCodeEntity package
		ifAbsentPut: [ self newManagerForPackage: aCodeEntity package ]
]

{
	#category : #acccessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRuleManager class>>managers [
	^ managers ifNil: [ managers := WeakKeyDictionary new ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRuleManager class>>newManagerForPackage: aRPackage  [
	| builder manifest defaultRules rules |
	aRPackage ifNil: [ ^ self default ].
	builder := TheManifestBuilder new.
	manifest := builder manifestOf: aRPackage.
	manifest ifNil: [ ^ self default ].
	
	defaultRules := self defaultRules.
	"remove rules banned for the package"
	rules := defaultRules reject: [ :rule |
		builder bansRule: rule for: aRPackage ].
	(rules size = defaultRules size and: [ 
	 manifest forcedRules isEmpty ])
		ifTrue: [ ^ self default ].
	"add rules forced for the packages"
	manifest forcedRules do: [ :ruleClass |
		rules addIfNotPresent:
			(self class environment at: ruleClass) new ].
	^ self newWithRules: rules
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRuleManager class>>newWithRules: aCollection  [
	^ self basicNew
		initializeRules: aCollection;
		yourself
]

{
	#category : #'event subscriptions',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRuleManager class>>removeManagerFor: anRPackage [

	self managers
		removeKey: anRPackage 
		ifAbsent: [  ]
	
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRuleManager class>>reset [
	<script>
	managers := nil.
	default := nil.
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRuleManager class>>resetWithInform [

	self reset.
	self inform: 'Cache of the Renraku rule manager has been reset'
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRuleManager class>>ruleToggleGroupID [

	^ #ruleToggle
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRuleManager class>>ruleToggleSettingsOn: aBuilder  [
	<systemsettings>
	(aBuilder group: self ruleToggleGroupID)
		order: 1;
		label: 'Toggle rules to run';
		description: 'Select which rules do you want to see in the live feedback';
		parent: #qualityAssistant;
		with: [ 
			(self visibleRuleClasses sorted: [ :a :b | a name < b name ])
				select: [ :rule | rule inheritsFrom: ReAbstractRule ] "because lint rules don't have #enabled"
				thenDo: [ :rule | 
					| inst |
					inst := rule new.
					(aBuilder setting: rule enabledSettingID)
					selector: #enabled;
					target: rule;
					label: inst name;
					description: inst rationale ] ]
]

{
	#category : #'event subscriptions',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRuleManager class>>subscribe [
	<systemEventRegistration>
	self unsubscribe.
	
	SystemAnnouncer uniqueInstance weak
		when: ClassAdded   send: #classAddedOrRemoved: to: self;
		when: ClassRemoved send: #classAddedOrRemoved: to: self.
		
	ReSystemAnnouncer uniqueInstance weak
		when: ReCritiqueBanned
		send: #critiqueBanned:
		to: self
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRuleManager class>>uniqueInstance [
	"Not a singleton anymore"
	^ self default
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRuleManager class>>unload [

	self reset
]

{
	#category : #'event subscriptions',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRuleManager class>>unsubscribe [

	SystemAnnouncer uniqueInstance unsubscribe: self.
	ReSystemAnnouncer uniqueInstance unsubscribe: self
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRuleManager class>>visibleLintRuleClasses [

	^ RBLintRule withAllSubclasses select: #isVisible
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRuleManager class>>visibleRuleClasses [

	^ (ReAbstractRule withAllSubclasses select: #isVisible)
	"remove this in the future ->", self visibleLintRuleClasses
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRuleManager>>allRules [

	^ rules
]

{
	#category : #'announcement handling',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRuleManager>>classAdded: aClassAddedAnnouncement  [

	(aClassAddedAnnouncement classAdded isKindOf: RBLintRule) 
		ifTrue: [ self reset ] 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRuleManager>>classRules [

	^ self allRules select: [ :rule | rule class checksClass ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRuleManager>>initializeRules: aCollection [

	rules := aCollection copy
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRuleManager>>methodRules [

	^ self allRules select: [ :rule | rule class checksMethod ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRuleManager>>nodeRules [
	
	^ self allRules select: [ :rule | rule class checksNode ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReRuleManager>>packageRules [

	^ self allRules select: [ :rule | rule class checksPackage ]
]
