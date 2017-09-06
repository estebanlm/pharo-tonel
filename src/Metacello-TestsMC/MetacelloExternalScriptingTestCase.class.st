"

"
Class {
	#name : #MetacelloExternalScriptingTestCase,
	#superclass : #MetacelloBasicScriptingTestCase,
	#category : #Metacello-TestsMC,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloExternalScriptingTestCase>>setUpRepositoryContents [
    super setUpRepositoryContents.
    Smalltalk at: #'Metacello_Config_Test_Repository' put: configurationRepository
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloExternalScriptingTestCase>>tearDownRepositories [
  super tearDownRepositories.
  MCRepositoryGroup default
    removeIdenticalRepository:
      (Smalltalk at: #'Metacello_XXX_Test_Repository' ifAbsent: [  ]).
  Smalltalk removeKey: #'Metacello_Config_Test_Repository' ifAbsent: [  ].
  Smalltalk removeKey: #'Metacello_XXX_Test_Repository' ifAbsent: [  ]
]
