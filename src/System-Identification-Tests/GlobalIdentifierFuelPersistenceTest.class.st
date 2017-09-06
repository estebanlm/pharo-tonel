"
A GlobalIdentifierFuelPersistenceTest is a test class for testing the behavior of GlobalIdentifierFuelPersistence
"
Class {
	#name : #GlobalIdentifierFuelPersistenceTest,
	#superclass : #GlobalIdentifierPersistenceTest,
	#category : #System-Identification-Tests,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierFuelPersistenceTest>>persistenceClass [
	^ GlobalIdentifierFuelPersistence
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierFuelPersistenceTest>>setUpPreferencesAndChecker [
	preferences := FileLocator workingDirectory / self folderName / 'pharoX' / 'preferences.fuel'.
	preferences ensureDelete.
	checker := GlobalIdentifierPersistenceMockChecker new answer: [ FileLocator workingDirectory exists ].

]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierFuelPersistenceTest>>tearDown [
	(FileLocator workingDirectory / self folderName) 
		ensureDeleteAllChildren; 
		ensureDelete.
]
