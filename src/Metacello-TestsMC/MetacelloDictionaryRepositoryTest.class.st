"

"
Class {
	#name : #MetacelloDictionaryRepositoryTest,
	#superclass : #GoferTest,
	#instVars : [
		'tempRepositories',
		'initialWorkingCopyList'
	],
	#category : #Metacello-TestsMC,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloDictionaryRepositoryTest>>alternateRepository [
	"MetacelloAlternateResource reset"

	^ MetacelloAlternateResource current monticelloRepository
	
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloDictionaryRepositoryTest>>configurationRepository [
	"MetacelloConfigurationResource reset"

	^ MetacelloConfigurationResource current monticelloRepository
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloDictionaryRepositoryTest>>defaultTimeout [
	"I don't want no stkinkin' timeouts"
	^60000
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloDictionaryRepositoryTest>>doSilently [

	^true
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloDictionaryRepositoryTest>>hasPackage: aString [
	| package |
	package := MCWorkingCopy allManagers
		detect: [ :each | each packageName = aString ]
		ifNone: [ nil ].
	^ package notNil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloDictionaryRepositoryTest>>loadType [

	^#linear
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloDictionaryRepositoryTest>>monticelloRepository [
	"MetacelloMonticelloResource reset"
	^ MetacelloMonticelloResource current monticelloRepository
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloDictionaryRepositoryTest>>project [

	| constructor project |
	"Construct Metacello project"
	constructor := MetacelloVersionConstructor on: self.
	project := constructor project.
	project loader: 
		((project loaderClass new)
			shouldDisablePackageCache: true;
			yourself).
	project loadType: self loadType.
	^project
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloDictionaryRepositoryTest>>projectWith: projectAttributes [

	| project |
	"Construct Metacello project"
	project := MetacelloMCProject new.
	project projectAttributes: projectAttributes.
	MetacelloVersionConstructor on: self project: project.
	project loader: 
		((project loaderClass new)
			shouldDisablePackageCache: true;
			yourself).
	project loadType: self loadType.
	^project

]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloDictionaryRepositoryTest>>runCase [
	| original |
	(self doSilently) ifFalse: [ ^super runCase ].
	original := MetacelloPlatform current bypassGoferLoadUpdateCategories.
	[ 
	MetacelloPlatform current bypassGoferLoadUpdateCategories: true.
	^ MetacelloPlatform current suspendSystemUpdateEventsDuring: [ super runCase ] ]
		ensure: [ MetacelloPlatform current bypassGoferLoadUpdateCategories: original ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloDictionaryRepositoryTest>>setUp [
  | repo |
  super setUp.
  MetacelloPlatform current clearPackageCache.
  MetacelloConfigurationResource projectAttributes: nil.
  repo := self monticelloRepository.
  self tempRepositories add: repo.
  gofer repository: repo.
  Smalltalk at: #'Metacello_Gofer_Test_Repository' put: repo.
  repo := self alternateRepository.
  self tempRepositories add: repo.
  Smalltalk at: #'Metacello_Configuration_Test_Alternate_Repository' put: repo.
  repo := self configurationRepository.
  self tempRepositories add: repo.
  Smalltalk at: #'Metacello_Configuration_Test_Repository' put: repo.
  initialWorkingCopyList := MCWorkingCopy allManagers
    collect: [ :each | each packageName ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloDictionaryRepositoryTest>>tearDown [
  | aGofer finalWorkingCopyList diff |
  super tearDown.
  aGofer := Gofer new.
  self tearDownPackages: aGofer.
  aGofer references notEmpty
    ifTrue: [ aGofer metacelloUnload ].
  Smalltalk removeKey: #'Metacello_Gofer_Test_Repository' ifAbsent: [  ].
  Smalltalk removeKey: #'Metacello_Configuration_Test_Repository' ifAbsent: [  ].
  Smalltalk
    removeKey: #'Metacello_Configuration_Test_Alternate_Repository'
    ifAbsent: [  ].
  self tempRepositories
    do: [ :repo | MCRepositoryGroup default removeIdenticalRepository: repo ].
  finalWorkingCopyList := MCWorkingCopy allManagers
    collect: [ :each | each packageName ].
  diff := finalWorkingCopyList difference: initialWorkingCopyList.
  diff
    do: [ :leak | 
      Transcript
        cr;
        show:
            'leaked package from ' , self printString , ' -> ' , leak printString ].
  self assert: diff isEmpty
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloDictionaryRepositoryTest>>tearDownPackages: aGoferInstance [

	(self hasPackage: 'GoferFoo')
		ifTrue: [ aGoferInstance package: 'GoferFoo' ].
	(self hasPackage: 'GoferBar')
		ifTrue: [ aGoferInstance package: 'GoferBar' ].
	(self hasPackage: 'GoferFaux')
		ifTrue: [ aGoferInstance package: 'GoferFaux' ].
	(self hasPackage: 'GoferBeau')
		ifTrue: [ aGoferInstance package: 'GoferBeau' ].
	(self hasPackage: 'MetacelloTestConfigurationOfFoo')
		ifTrue: [ aGoferInstance package: 'MetacelloTestConfigurationOfFoo' ].

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloDictionaryRepositoryTest>>tempRepositories [

	tempRepositories ifNil: [ tempRepositories := OrderedCollection new ].
	^tempRepositories
]
