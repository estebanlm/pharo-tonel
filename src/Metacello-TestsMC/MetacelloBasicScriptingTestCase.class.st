"

"
Class {
	#name : #MetacelloBasicScriptingTestCase,
	#superclass : #MetacelloScriptingTestCase,
	#category : #Metacello-TestsMC,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloBasicScriptingTestCase>>configurationRepositoryContents [
  ^ #('ConfigurationOfExternalX-dkh.1' 'ConfigurationOfExternalXX-dkh.1' 'ConfigurationOfExternalXXX-dkh.1' 'ConfigurationOfExternalIV-dkh.1' 'MarianosImage-dkh.1')
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloBasicScriptingTestCase>>externalRepositoryContents [
  ^ #('External-CoreX-dkh.1' 'BaselineOfExternalX-dkh.1' 'BaselineOfGithubRefXX-dkh.1' 'BaselineOfGithubRefIV-dkh.1' 'BaselineOfGithubRefV-dkh.1' 'BaselineOfGithubRefVI-dkh.1' 'BaselineOfGithubRefVII-dkh.1' 'BaselineOfGithubRefVIII-dkh.1' 'BaselineOfGithubRefIX-dkh.1' 'BaselineOfGithubRefXI-dkh.1' 'BaselineOfGithubRefXII-dkh.1' 'BaselineOfGithubRefXIII-dkh.1')
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloBasicScriptingTestCase>>setUpRepositoryContents [
  super setUpRepositoryContents.
  self
    setUpRepositoryContents: self configurationRepositoryContents
    sourceRepo: MetacelloScriptingResource current configurationRepository
    targetRepo: (MCFileTreeRepository new directory: configurationDirectory).
  self
    setUpRepositoryContents: self externalRepositoryContents
    sourceRepo: MetacelloScriptingResource current externalRepository
    targetRepo: (MCFileTreeRepository new directory: externalDirectory).
  self
    setUpRepositoryContents: #('Sample-CoreX-dkh.1')
    sourceRepo: MetacelloScriptingResource current sampleRepository
    targetRepo: (MCFileTreeRepository new directory: sampleDirectory)
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloBasicScriptingTestCase>>tearDownPackageList [
  ^ #('ConfigurationOfExternalX' 'ConfigurationOfExternalXX' 'ConfigurationOfExternal' 'ConfigurationOfExternalXXX' 'ConfigurationOfExternalIV' 'ConfigurationOfExternalIV' 'BaselineOfExternalX' 'BaselineOfGithubRefXX' 'BaselineOfGithubRefIV' 'BaselineOfGithubRefV' 'BaselineOfGithubRefVI' 'BaselineOfGithubRefVII' 'BaselineOfExternal' 'BaselineOfExternalX' 'External-CoreX' 'Sample-CoreX' 'ConfigurationOfMetacelloExample' 'GoferFoo' 'Sample-Core' 'Sample-Platform' 'Sample-Tests' 'External-Core' 'ExternalCore' 'External-Tests' 'BaselineOfGithubRefVIII' 'BaselineOfGithubRefIX' 'MarianosImage' 'BaselineOfGithubRefXI' 'BaselineOfGithubRefXII' 'BaselineOfGithubRefXIII')
]
