"

"
Class {
	#name : #GlobalIdentifierStonPersistenceTest,
	#superclass : #GlobalIdentifierPersistenceTest,
	#category : #System-Identification-Tests,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierStonPersistenceTest>>persistenceClass [
	^ GlobalIdentifierStonPersistence
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierStonPersistenceTest>>setUpPreferencesAndChecker [
	| memory |
	memory := FileSystem memory.
	preferences := memory workingDirectory / self folderName / 'pharoX' / 'preferences.ston'.
	preferences ensureDelete.
	checker := GlobalIdentifierPersistenceMockChecker new answer: [ memory workingDirectory exists ].

]
