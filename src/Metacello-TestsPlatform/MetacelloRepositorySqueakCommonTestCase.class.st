"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Implementation Points
"
Class {
	#name : #MetacelloRepositorySqueakCommonTestCase,
	#superclass : #TestCase,
	#category : #Metacello-TestsPlatform
}

{ #category : #baselines }
MetacelloRepositorySqueakCommonTestCase >> baseline10: spec [
    <version: '1.0-baseline'>
    spec
        for: #'common'
        do: [ 
            spec
                package: 'Example-Core'
                with: [ 
                    spec
                        includes: 'Example-AddOn';
                        file: 'Example-Core-anon.1';
                        repository: '/opt/mcexamples' ] ]

]

{ #category : #baselines }
MetacelloRepositorySqueakCommonTestCase >> baseline13: spec [
    <version: '1.3-baseline'>
    spec
        for: #'squeakCommon'
        do: [ 
            spec
                package: 'Example-Core'
                with: [ 
                    spec
                        includes: 'Example-AddOn';
                        file: 'Example-Core-anon.1';
                        repository: 'ftp://ftp.example.com/examples' ] ]
]

{ #category : #baselines }
MetacelloRepositorySqueakCommonTestCase >> baseline14: spec [
    <version: '1.4-baseline'>
    spec
        for: #'common'
        do: [ 
            spec
                package: 'Example-Core'
                with: [ 
                    spec
                        includes: 'Example-AddOn';
                        file: 'Example-Core-anon.1';
                        repository: 'http://example.com/examples' ] ]
]

{ #category : #baselines }
MetacelloRepositorySqueakCommonTestCase >> baseline15: spec [
    <version: '1.5-baseline'>
    spec
        for: #'common'
        do: [ 
            spec
                package: 'Example-Core'
                with: [ 
                    spec
                        includes: 'Example-AddOn';
                        file: 'Example-Core-anon.1';
                        repository: 'dictionary://Metacello_Platform_Test_GlobalDictionary' ] ]
]

{ #category : #baselines }
MetacelloRepositorySqueakCommonTestCase >> baseline16: spec [
  <version: '1.6-baseline'>
  spec
    for: #'common'
    do: [ 
      spec
        package: 'Example-Core'
        with: [ 
          spec
            includes: 'Example-AddOn';
            file: 'Example-Core-anon.1';
            repository:
                'filetree://' , MCFileTreeFileUtils current default fullName , '/temp/repo' ] ]


]

{ #category : #accessing }
MetacelloRepositorySqueakCommonTestCase >> project [
     "force new version as workaround for https://code.google.com/p/smalltalk-hub/issues/detail?id=21"

	| constructor project |
	"Construct Metacello project"
	constructor := MetacelloVersionConstructor on: self.
	project := constructor project.
	project loader: MetacelloNullRecordingMCSpecLoader new.
	^project
]

{ #category : #running }
MetacelloRepositorySqueakCommonTestCase >> setUp [
    super setUp.
    Smalltalk
        at: #'Metacello_Platform_Test_GlobalDictionary'
        put:
            (MCDictionaryRepository new
                description: 'dictionary://Metacello_Platform_Test_GlobalDictionary';
                yourself)
]

{ #category : #running }
MetacelloRepositorySqueakCommonTestCase >> tearDown [
    super tearDown.
    Smalltalk removeKey: #'Metacello_Platform_Test_GlobalDictionary' ifAbsent: [  ]
]

{ #category : #tests }
MetacelloRepositorySqueakCommonTestCase >> testAsRepositorySpecFor [
    | project testBlock |
    project := self project.
    testBlock := [ :pkg :expectedType1 :expectedType2 | 
	    | repoSpec1 repo repoSpec2 |
	    repoSpec1 := pkg repositorySpecs first.
	    self assert: repoSpec1 type = expectedType1.
	    repo := repoSpec1 createRepository.
	    repoSpec2 := repo asRepositorySpecFor: project.
	    self assert: repoSpec2 type = expectedType2.
	    expectedType1 = expectedType2
	        ifTrue: [ self assert: repoSpec1 description asFileReference = repoSpec2 description asFileReference ]
	        ifFalse: [ 
	            "special case for standard directory type that defaults to MCServerDirectoryRepository"
	            self
	                assert:
	                    (repoSpec1 description copyFrom: 'server://' size + 1 to: repoSpec1 description size) = repoSpec2 description ] ].
    testBlock
        value: ((project version: '1.0-baseline') packageNamed: 'Example-Core')
        value: 'directory'
        value: 'directory'.
    testBlock value: ((project version: '1.3-baseline') packageNamed: 'Example-Core') value: 'ftp' value: 'ftp'.
    testBlock value: ((project version: '1.4-baseline') packageNamed: 'Example-Core') value: 'http' value: 'http'.
    testBlock
        value: ((project version: '1.5-baseline') packageNamed: 'Example-Core')
        value: 'dictionary'
        value: 'dictionary'

]

{ #category : #tests }
MetacelloRepositorySqueakCommonTestCase >> testDictionaryRepository [
    | project pkg repoSpec repo |
    project := self project.
    pkg := (project version: '1.5-baseline') packageNamed: 'Example-Core'.
    repoSpec := pkg repositorySpecs first.
    self assert: repoSpec type = 'dictionary'.
    repo := repoSpec createRepository.
    self assert: repo class == MCDictionaryRepository.
    self assert: repo dictionary == (Smalltalk at: #'Metacello_Platform_Test_GlobalDictionary') dictionary
]

{ #category : #tests }
MetacelloRepositorySqueakCommonTestCase >> testDirectoryRepository [
    | project pkg repoSpec repo |
    project := self project.
    pkg := (project version: '1.0-baseline') packageNamed: 'Example-Core'.
    repoSpec := pkg repositorySpecs first.
    self assert: repoSpec type = 'directory'.
    repo := repoSpec createRepository.
    self assert: repo class == MCDirectoryRepository.
    self assert: repo description asFileReference = '/opt/mcexamples' asFileReference
]

{ #category : #tests }
MetacelloRepositorySqueakCommonTestCase >> testFileTreeRepository [
  "must create repository against an existing directory"

  | project pkg repoSpec repo fileUtils workingDir tempDir repoDir |
  fileUtils := MCFileTreeFileUtils current.
  workingDir := fileUtils default.
  tempDir := fileUtils directoryFromPath: 'temp' relativeTo: workingDir.
  [ 
  fileUtils ensureDirectoryExists: tempDir.
  repoDir := fileUtils directoryFromPath: 'repo' relativeTo: tempDir.
  fileUtils ensureDirectoryExists: repoDir.
  project := self project.
  pkg := (project version: '1.6-baseline') packageNamed: 'Example-Core'.
  repoSpec := pkg repositorySpecs first.
  self assert: repoSpec type = 'filetree'.
  repo := repoSpec createRepository.
  self
    assert: repo class == (Smalltalk at: #'MCFileTreeRepository' ifAbsent: [  ]).
  Transcript cr; show: 'testFileTreeRepository: ', (fileUtils directoryFromPath: 'temp/repo' relativeTo: fileUtils default) fullName.
  self
    assert:
      repo description  = ('filetree://' , (fileUtils directoryFromPath: 'temp/repo' relativeTo: fileUtils default) fullName )]
    ensure: [ 
      (fileUtils directoryExists: tempDir)
        ifTrue: [ fileUtils deleteAll: tempDir ] ]


]

{ #category : #tests }
MetacelloRepositorySqueakCommonTestCase >> testFtpRepository [
    | project pkg repoSpec repo |
    project := self project.
    pkg := (project version: '1.3-baseline') packageNamed: 'Example-Core'.
    repoSpec := pkg repositorySpecs first.
    self assert: repoSpec type = 'ftp'.
    repo := repoSpec createRepository.
    self assert: repo class == MCFtpRepository.
    self assert: repo host = 'ftp.example.com'.
    self assert: repo directory = 'examples'
]

{ #category : #tests }
MetacelloRepositorySqueakCommonTestCase >> testHttpRepository [
    | project pkg repoSpec repo |
    project := self project.
    pkg := (project version: '1.4-baseline') packageNamed: 'Example-Core'.
    repoSpec := pkg repositorySpecs first.
    self assert: repoSpec type = 'http'.
    repo := repoSpec createRepository.
    self assert: repo class == MCHttpRepository.
    self assert: repo description = 'http://example.com/examples'
]
