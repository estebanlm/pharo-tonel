"

"
Class {
	#name : #GlobalIdentifierWithFuel,
	#superclass : #GlobalIdentifierTest,
	#category : #System-Identification-Tests,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierWithFuel>>actualPreferencesFileName [
	^ 'preferences.fuel'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierWithFuel>>setUpPersistenceStrategyAndChecker [
	preferences := FileLocator workingDirectory / self folderName / 'pharoX' / self actualPreferencesFileName.
	preferences ensureDelete.
	identifier persistenceStrategy: GlobalIdentifierPersistence fuel.
	identifier persistenceStrategy preferences: preferences.
	identifier persistenceStrategy checker: (self newChecker answer: [ FileLocator workingDirectory exists ]; yourself).

]
