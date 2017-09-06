"

"
Class {
	#name : #GlobalIdentifierWithDefaultConfiguration,
	#superclass : #GlobalIdentifierTest,
	#instVars : [
		'oldPreferences'
	],
	#category : #System-Identification-Tests,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierWithDefaultConfiguration>>oldPreferencesFileName [
	^ identifier persistenceStrategy previous fileName
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierWithDefaultConfiguration>>setUpPersistenceStrategyAndChecker [
	preferences := FileLocator workingDirectory / self folderName / 'pharoX' / self actualPreferencesFileName.
	preferences ensureDelete.
	oldPreferences := FileLocator workingDirectory / self folderName / 'pharoX' / self oldPreferencesFileName.
	oldPreferences ensureDelete.
	identifier persistenceStrategy preferences: preferences.
	identifier persistenceStrategy previous preferences: oldPreferences.
	identifier persistenceStrategy checker: (self newChecker answer: [ FileLocator workingDirectory exists ]; yourself).
	identifier persistenceStrategy previous checker: (self newChecker answer: [ FileLocator workingDirectory exists ]; yourself).
	
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierWithDefaultConfiguration>>tearDown [
	oldPreferences ensureDelete.
	super tearDown
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierWithDefaultConfiguration>>testEnsure [
	| stored |
	super testEnsure.
	self assert: oldPreferences exists description: 'The old preferences should be stored now.'.
	stored := identifier persistenceStrategy previous load.
	self assert: stored equals: identifier persistedInformation.
]
