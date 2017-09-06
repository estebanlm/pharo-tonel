"

"
Class {
	#name : #GlobalIdentifierWithSton,
	#superclass : #GlobalIdentifierTest,
	#category : #System-Identification-Tests,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierWithSton>>actualPreferencesFileName [
	^ 'preferences.ston'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierWithSton>>setUpPersistenceStrategyAndChecker [
	preferences := FileLocator workingDirectory / self folderName / 'pharoX' / self actualPreferencesFileName.
	preferences ensureDelete.
	identifier persistenceStrategy: GlobalIdentifierPersistence ston.
	identifier persistenceStrategy preferences: preferences.
	identifier persistenceStrategy checker: (self newChecker answer: [ FileLocator workingDirectory exists ]; yourself).

]
