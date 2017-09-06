"

"
Class {
	#name : #MetacelloScriptingStdTstHarness,
	#superclass : #TestCase,
	#instVars : [
		'registry',
		'monticelloRepository',
		'configurationRepository',
		'initialWorkingCopyList'
	],
	#category : #Metacello-TestsMC,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloScriptingStdTstHarness>>defaultTimeout [
	"I don't want no stkinkin' timeouts"
	^60000
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloScriptingStdTstHarness>>doSilently [
    ^ true
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloScriptingStdTstHarness>>hasPackage: aString [
	| package |
	package := MCWorkingCopy allManagers
		detect: [ :each | each packageName = aString ]
		ifNone: [ nil ].
	^ package notNil
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloScriptingStdTstHarness>>runCase [
    | original |
    self doSilently
        ifFalse: [ ^ super runCase ].
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
MetacelloScriptingStdTstHarness>>setUp [
  super setUp.
  MetacelloPlatform current clearPackageCache.
  registry := MetacelloProjectRegistration registry.
  self setUpRepositories.
  self setUpRepositoryContents.
  MetacelloProjectRegistration resetRegistry.
  initialWorkingCopyList := MCWorkingCopy allManagers
    collect: [ :each | each packageName ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloScriptingStdTstHarness>>setUpRepositories [

]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloScriptingStdTstHarness>>setUpRepositoryContents [

]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloScriptingStdTstHarness>>tearDown [
  | finalWorkingCopyList diff |
  super tearDown.
  self tearDownPackages.
  self tearDownRepositories.
  MetacelloProjectRegistration registry: registry.
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
MetacelloScriptingStdTstHarness>>tearDownPackageList [
    ^ #()
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloScriptingStdTstHarness>>tearDownPackages [
    | aGofer |
    aGofer := Gofer new.
    self tearDownPackageList
        do: [ :packageName | 
            (self hasPackage: packageName)
                ifTrue: [ aGofer package: packageName ] ].
    aGofer references notEmpty
        ifTrue: [ aGofer metacelloUnload ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloScriptingStdTstHarness>>tearDownRepositories [

]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloScriptingStdTstHarness>>unloadPackage: packageName [
  | aGofer |
  aGofer := Gofer new.
  (self hasPackage: packageName)
    ifTrue: [ aGofer package: packageName ].
  aGofer references notEmpty
    ifTrue: [ aGofer unload ]
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloScriptingStdTstHarness>>validate: expectedConfigurationClassName expConfigVersion: expectedConfigurationVersion expConfigRepo: expectedConfigurationRepository expBaselineClassName: expectedBaselineClassName expBaselineVersion: expectedBaselineVersion expBaselineRepo: expectedBaselineRepository [
  MetacelloProjectRegistration registry configurationRegistry
    at: expectedConfigurationClassName
    ifPresent: [ :existing | 
      | spec x |
      spec := existing configurationProjectSpec.
      self
        assert: (x := spec version versionString) = expectedConfigurationVersion.
      self
        assert:
          (spec repositoryDescriptions includes: expectedConfigurationRepository) ]
    ifAbsent: [ self assert: expectedConfigurationVersion == nil ].
  MetacelloProjectRegistration registry baselineRegistry
    at: expectedBaselineClassName
    ifPresent: [ :existing | 
      | spec |
      spec := existing baselineProjectSpec.
      self assert: spec versionString = expectedBaselineVersion.
      self
        assert:
          (spec repositoryDescriptions includes: expectedBaselineRepository) ]
    ifAbsent: [ self assert: expectedBaselineVersion == nil ]
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloScriptingStdTstHarness>>validateProjects: specArrays [
  specArrays
    do: [ :array | 
      self
        validate: (array at: 1)
        expConfigVersion: (array at: 2)
        expConfigRepo: (array at: 3)
        expBaselineClassName: (array at: 4)
        expBaselineVersion: (array at: 5)
        expBaselineRepo: (array at: 6) ]
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloScriptingStdTstHarness>>verify: packageName loadedFrom: repositoryDescription [
    | externalCoreWorkingCopy |
    externalCoreWorkingCopy := MCWorkingCopy allManagers detect: [ :wc | wc packageName = packageName ].
    self
        assert:
            (externalCoreWorkingCopy repositoryGroup repositories
                includes: (MetacelloMCProject new repositorySpec description: repositoryDescription) createRepository)
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloScriptingStdTstHarness>>verify: packageName version: fileName [
    | externalCoreWorkingCopy x |
    externalCoreWorkingCopy := MCWorkingCopy allManagers detect: [ :wc | wc packageName = packageName ].
    self assert: (x := externalCoreWorkingCopy ancestors first name) = fileName
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloScriptingStdTstHarness>>verifyPackageNotLoaded: packageName [
    self assert: (MCWorkingCopy allManagers detect: [ :wc | wc packageName = packageName ] ifNone: [  ]) == nil
]
