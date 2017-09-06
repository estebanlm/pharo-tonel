"
A GlobalIdentifierPersistenceTest is a test class for testing the behavior of GlobalIdentifierPersistence
"
Class {
	#name : #GlobalIdentifierPersistenceTest,
	#superclass : #TestCase,
	#instVars : [
		'preferences',
		'persistence',
		'checker'
	],
	#category : #System-Identification-Tests,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierPersistenceTest class>>isAbstract [
	^ self name = GlobalIdentifierPersistenceTest name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierPersistenceTest>>folderName [
	^ 'pharoPreferencesTestFolder'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierPersistenceTest>>newFalseChecker [
	^ GlobalIdentifierPersistenceMockChecker new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierPersistenceTest>>persistenceClass [
	^ self subclassResponsibility
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierPersistenceTest>>setUp [
	super setUp.
	self setUpPreferencesAndChecker.
	persistence := self persistenceClass new preferences: preferences; yourself.
	persistence checker: checker.
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierPersistenceTest>>setUpPreferencesAndChecker [
	self subclassResponsibility
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierPersistenceTest>>tearDown [
	super tearDown.
	preferences ensureDelete.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierPersistenceTest>>testDefault [
	self deny: preferences exists description: 'The preference file should not exists by default.'.
	self deny: preferences parent exists description: 'The preference directory should not exists by default.'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierPersistenceTest>>testDelete [
	preferences parent ensureCreateDirectory.
	preferences ensureCreateFile.
	self assert: preferences exists.
	persistence delete.
	self deny: preferences exists.
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierPersistenceTest>>testEnsureDirectory [
	persistence ensureDirectory.
	self assert: preferences parent exists.
	self deny: preferences exists.
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierPersistenceTest>>testIsEnabled [
	self assert: persistence isEnabled.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierPersistenceTest>>testIsEnabled2 [
	persistence checker: self newFalseChecker.
	self deny: persistence isEnabled.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierPersistenceTest>>testLoad [
	"Load when nothing is stored."
	| values |
	values := Dictionary new.
	values at: #a put: 42.
	persistence load: values.
	self assert: values size equals: 1.
	self assert: (values at: #a) equals: 42.
	self assert: preferences exists.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierPersistenceTest>>testLoad2 [
	"Load stored values."
	| values loaded |
	values := Dictionary new.
	values at: #a put: 42.
	persistence save: values.
	loaded := Dictionary new.
	persistence load: loaded.
	self assert: loaded equals: values.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierPersistenceTest>>testLoad3 [
	"Load stored values."
	| values loaded |
	persistence checker: self newFalseChecker.
	values := Dictionary new.
	values at: #a put: 42.
	persistence save: values.
	loaded := Dictionary new.
	persistence load: loaded.
	self assert: loaded isEmpty.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierPersistenceTest>>testSave [
	| values |
	values := Dictionary new.
	values at: #a put: 42.
	persistence save: values.
	self assert: preferences exists.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:48'
}
GlobalIdentifierPersistenceTest>>testSave2 [
	| values |
	persistence checker: self newFalseChecker.
	values := Dictionary new.
	values at: #a put: 42.
	persistence save: values.
	self deny: preferences exists.
]
