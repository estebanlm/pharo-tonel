"
i have settings for QA recording functions
"
Class {
	#name : #ReSettings,
	#superclass : #Object,
	#instVars : [
		'inspectorPlugin',
		'spotterPlugin'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #Renraku-Utility
}

{ #category : #cleanup }
ReSettings class >> cleanUp [
	
	
	uniqueInstance := nil
]

{ #category : #settings-accessing }
ReSettings class >> inspectorPluggin [
	
	^ self uniqueInstance inspectorPluggin
]

{ #category : #settings-accessing }
ReSettings class >> inspectorPluggin: aBoolean [ 
	
	self uniqueInstance inspectorPluggin: aBoolean
]

{ #category : #settings-definition }
ReSettings class >> inspectorPlugginSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #inspectorPluggin)
		order: 5; 
		target: self;
		label: 'Inspector Plugin';
		description: 'Enable GTInspector plugin which shows a tab with number of critiques and allows to inspect them.';
		parent: #renraku.
]

{ #category : #settings-definition }
ReSettings class >> reGroupSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder group: #renraku)
		order: 100;
		label: 'Renraku';
		description: 'Renraku is the engine for quality rules (and external object properties in general) used by QualityAssistant';
		parent: #qualityAssistant.
]

{ #category : #settings-definition }
ReSettings class >> resetButtonSettingsOn: aBuilder [
	<systemsettings>
		
	(aBuilder group: #'resetRules')
		order: 10;
		target: self;
		label: 'Rule cache';
		parent: #renraku;
		description: 'Renraku (the engine behind quality rules) caches the rule objects for performance boost. Here you can reset the cache, this may be useful if you''ve implemented a new rule and want to include it.';
		dialog: [
			SimpleButtonMorph new
				target: ReRuleManager;
				label: 'Reset Renraku rule cache';
				actionSelector: #resetWithInform;
				themeChanged;
				yourself ].
]

{ #category : #settings-accessing }
ReSettings class >> showErrors [
	self flag: 'switch to exception strategy completely'.
	"Utilize the ReExceptionStrategy to either skip the exception,
	pass it on, or create a list of exceptions as a reparete
	'category' with all the exceptions that happened."
	
	^ ReExceptionStrategy current = RePassExceptionStrategy
]

{ #category : #settings-accessing }
ReSettings class >> showErrors: anObject [
	self uniqueInstance showErrors: anObject
]

{ #category : #settings-definition }
ReSettings class >> showErrorsSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #showErrors)
		target: self;
		order: 5;
		label: 'Show errors (dev. only!)';
		description: 'Signal errors that happen during critique-checking (and related). This should be used by developers.';
		parent: #renraku.
]

{ #category : #properties }
ReSettings class >> spotterExtMethods [
	^ GTSpotter spotterExtendingMethods select: [ :m |
		m compiledMethod package = #Renraku asPackage ]
]

{ #category : #settings-accessing }
ReSettings class >> spotterPlugin [
	
	^ self uniqueInstance spotterPlugin
]

{ #category : #settings-accessing }
ReSettings class >> spotterPlugin: aBoolean [
	
	^ self uniqueInstance spotterPlugin: aBoolean
]

{ #category : #settings-definition }
ReSettings class >> spotterPluginSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #spotterPlugin)
		order: 5;
		target: self;
		label: 'Spotter Plugin';
		description: 'Enable GTSpotter plugin which shows a group with critiques and allows to preview them.';
		default: false;
		parent: #renraku.
]

{ #category : #accessing }
ReSettings class >> uniqueInstance [
	
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #initialization }
ReSettings >> initialize [
	super initialize.
	
	inspectorPlugin := false.
	spotterPlugin := false
]

{ #category : #accessing }
ReSettings >> inspectorPluggin [
	

	^ inspectorPlugin
]

{ #category : #accessing }
ReSettings >> inspectorPluggin: aBool [ 
	
	inspectorPlugin := aBool
]

{ #category : #accessing }
ReSettings >> spotterPlugin [
	
	^ spotterPlugin

]

{ #category : #accessing }
ReSettings >> spotterPlugin: aBool [ 
	
	spotterPlugin := aBool

]
