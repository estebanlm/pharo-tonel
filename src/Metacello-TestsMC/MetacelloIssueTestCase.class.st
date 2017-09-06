"

"
Class {
	#name : #MetacelloIssueTestCase,
	#superclass : #TestCase,
	#instVars : [
		'gofer',
		'initialWorkingCopyList'
	],
	#category : #Metacello-TestsMC,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloIssueTestCase>>configurationRepository [
	"MetacelloConfigurationResource reset"

	^ MetacelloConfigurationResource current monticelloRepository
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloIssueTestCase>>hasPackage: aString [
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
MetacelloIssueTestCase>>monticelloRepository [
	"MetacelloMonticelloResource reset"
	^ MetacelloMonticelloResource current monticelloRepository
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloIssueTestCase>>project [

	^self projectWith: #()
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloIssueTestCase>>projectClass [
    ^ Smalltalk at: self projectName asSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloIssueTestCase>>projectName [
    ^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloIssueTestCase>>projectWith: projectAttributes [
    | project |
    "Construct Metacello project"
    project := MetacelloMCProject new.
    project projectAttributes: projectAttributes.
    MetacelloVersionConstructor on: self projectClass new project: project.
    project loader: MetacelloNullRecordingMCSpecLoader new.
    project loader evalDoits: false.
    ^ project
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloIssueTestCase>>runCase [
	| original |
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
MetacelloIssueTestCase>>setUp [
  | repo |
  super setUp.
  MetacelloPlatform current clearPackageCache.
  repo := self monticelloRepository.
  gofer := Gofer new.
  gofer disablePackageCache.
  gofer repository: repo.
  Smalltalk at: #'Metacello_Gofer_Test_Repository' put: repo.
  repo := self configurationRepository.
  gofer repository: repo.
  Smalltalk at: #'Metacello_Configuration_Test_Repository' put: repo.
  initialWorkingCopyList := MCWorkingCopy allManagers
    collect: [ :each | each packageName ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloIssueTestCase>>tearDown [
  | aGofer finalWorkingCopyList diff |
  super tearDown.
  aGofer := Gofer new.
  self tearDownPackageNames
    do: [ :pName | 
      (self hasPackage: pName)
        ifTrue: [ aGofer package: pName ] ].
  aGofer references notEmpty
    ifTrue: [ aGofer metacelloUnload ].
  MCRepositoryGroup default
    removeIdenticalRepository:
        (Smalltalk at: #'Metacello_Gofer_Test_Repository' ifAbsent: [  ]);
    removeIdenticalRepository:
        (Smalltalk at: #'Metacello_Configuration_Test_Repository' ifAbsent: [  ]);
    yourself.
  Smalltalk removeKey: #'Metacello_Gofer_Test_Repository' ifAbsent: [  ].
  Smalltalk removeKey: #'Metacello_Configuration_Test_Repository' ifAbsent: [  ].
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
MetacelloIssueTestCase>>tearDownPackageNames [
    ^ {(self projectName)}
]
