"

"
Class {
	#name : #MBCommandTests,
	#superclass : #MBAbstractTest,
	#instVars : [
		'gofer',
		'authorName',
		'tearDownPackages'
	],
	#category : #Versionner-Tests-Core-Commands,
	#timestamp : ''
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommandTests>>configurationName [

	^#'ConfigurationOfMetacello_Command_Tests'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommandTests>>hasPackage: aString [
	| package |
	package := MCWorkingCopy allManagers
		detect: [ :each | each packageName = aString ]
		ifNone: [ nil ].
	^ package notNil
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommandTests>>repositoryName [

	^#'Metacello_Dev_Cycle_Repository'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommandTests>>runCase [
	| original |
	original := MetacelloPlatform current bypassGoferLoadUpdateCategories.
	^ [ 	MetacelloPlatform current bypassGoferLoadUpdateCategories: true.
		[ super runCase ]
			ensure: [ MetacelloPlatform current bypassGoferLoadUpdateCategories: original ] ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommandTests>>setUp [

	| repo |
	super setUp.
	gofer := Gofer new.
	gofer disablePackageCache.
	repo := MBMonticelloPackagesResource current monticelloRepository.
	gofer repository: repo.
	Smalltalk at: #'MB_Foo_Test_Repository' put: repo.

	repo := MCDictionaryRepository new.
	repo description: 'dictionary://', self repositoryName asString.
	Smalltalk at: self repositoryName put: repo.

	authorName := MetacelloPlatform current authorName.
	MetacelloPlatform current authorName: 'TesterBob'.

]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommandTests>>tearDown [
	gofer := Gofer new.
	self tearDownPackages do: [:pkgName | (self hasPackage: pkgName) ifTrue: [ gofer package: pkgName ]].
	gofer references notEmpty ifTrue: [ gofer unload ].

	Smalltalk removeKey: self repositoryName ifAbsent: [  ].
	Smalltalk removeKey: #'MB_Foo_Test_Repository' ifAbsent: [].
	
	Smalltalk at: self configurationName ifPresent: [:cls | cls removeFromSystem ].

	MetacelloPlatform current authorName: authorName.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCommandTests>>tearDownPackages [

	tearDownPackages ifNil: [ tearDownPackages := OrderedCollection new ].
	^tearDownPackages
]
