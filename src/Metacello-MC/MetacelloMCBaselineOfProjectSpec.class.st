"

"
Class {
	#name : #MetacelloMCBaselineOfProjectSpec,
	#superclass : #MetacelloMCProjectSpec,
	#category : #Metacello-MC-Specs,
	#timestamp : ''
}

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineOfProjectSpec>>asBaselineProjectSpec [
    ^ self
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineOfProjectSpec>>asProjectRegistration [
    ^ MetacelloProjectRegistration fromMCBaselineProjectSpec: self
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineOfProjectSpec>>canDowngradeTo: aProjectSpec [
    "cannot upgrade between baselines"

    ^ false
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineOfProjectSpec>>canUpgradeTo: aProjectSpec [
  "cannot upgrade between baselines unless repositories can be upgraded"

  (self repositories canUpgradeTo: aProjectSpec repositories)
    ifTrue: [ ^ true ].
  ^ false
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineOfProjectSpec>>configHasVersionString [
  ^ false
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineOfProjectSpec>>constructClassName [
    ^ 'BaselineOf' , self name
]

{
	#category : #mutability,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineOfProjectSpec>>copyForRegistration: aMetacelloProjectRegistration onWrite: aBlock [
  | copy |
  aMetacelloProjectRegistration
    baselineProjectSpecIfPresent: [ :spec | 
      copy := spec copy.
      aBlock value: copy.
      aMetacelloProjectRegistration baselineProjectSpec: copy ]
    ifAbsent: [ 
      aMetacelloProjectRegistration
        configurationProjectSpecIfPresent: [ :spec | 
          copy := spec copy.
          aBlock value: copy.
          aMetacelloProjectRegistration configurationProjectSpec: copy ]
        ifAbsent: [ aBlock value: nil ] ]
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineOfProjectSpec>>determineCurrentVersionForLoad [
    ^ self version
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineOfProjectSpec>>ensureConfigurationLoaded: vrsn ensured: ensured [
  "answer true if the configuration should be reloaded"

  "see Issue #181 for details ... basically we always want to consider loading the baseline from a project reference, especially if the two project specs are not the same..."

  "https://github.com/dalehenrich/metacello-work/issues/181"

  ^ true
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineOfProjectSpec>>ensureLoadUsing: aLoader [
  "see https://github.com/dalehenrich/metacello-work/issues/244 ... uncoditionally load
   baseline"

  [ super ensureLoadUsing: aLoader ]
    on: MetacelloIgnorePackageLoaded
    do: [ :ex | ex resume: ex packageSpec name = self name ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineOfProjectSpec>>hasClassName [
    ^ className ~~ nil and: [ className ~= self constructClassName ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineOfProjectSpec>>hasConflictWithConfigurationSpec: projectSpec [
  "baseline can be loaded on top of a configuration without a conflict"

  ^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineOfProjectSpec>>hasConflictWithProjectSpec: projectSpec [
	^ projectSpec hasConflictWithBaselineSpec: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineOfProjectSpec>>isBaselineOfProjectSpec [
	^ true
]

{
	#category : #importing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineOfProjectSpec>>mergeImportLoads: aLoadList [
    aLoadList
        ifNotNil: [ :otherLoads | self loads ifNil: [ loads := otherLoads ] ifNotNil: [ loads := loads , otherLoads ] ]
]

{
	#category : #merging,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineOfProjectSpec>>mergeRepositoriesSpec: anotherRepositories [
  "anotherRepositories wins ... there can ever only be one repository for the 
   baseline to load from"

  "https://github.com/dalehenrich/metacello-work/issues/251"

  self repositories: anotherRepositories
]

{
	#category : #merging,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineOfProjectSpec>>mergeSpec: anotherSpec [
    ^ super mergeSpec: anotherSpec asBaselineProjectSpec
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineOfProjectSpec>>projectLabel [
    ^ 'baseline'
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineOfProjectSpec>>repositoryBranchName [
  "extract a branch name from the repository ... if possible"

  "must parallel implementation of MetacelloMCBaselineProject>>setBaselineRepositoryDescription: we want the same repoSpec"

  | spec repo |
  self repositorySpecs do: [ :repoSpec | spec := repoSpec ].
  repo := spec createRepository.
  ^ repo repositoryBranchName
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineOfProjectSpec>>repositoryVersionString [
  "extract a version string from the repository ... if possible"

  "must parallel implementation of MetacelloMCBaselineProject>>setBaselineRepositoryDescription: we want the same repoSpec"

  | spec repo |
  self repositorySpecs do: [ :repoSpec | spec := repoSpec ].
  [ repo := spec createRepository ]
    on: Error
    do: [ :ex | ^ '' ].
  ^ repo repositoryVersionString
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineOfProjectSpec>>validateVersionString: issues withDefaultVersionString: ignored [
    self versionString
        ifNotNil: [ :vs | 
            | prj |
            prj := self project asBaselineProject.
            vs ~= prj singletonVersionName
                ifTrue: [ 
                    issues
                        add:
                            (MetacelloValidationError
                                configurationClass: self projectClass
                                reasonCode: #'invalidVersionString'
                                callSite:
                                    #'validateForScriptLoad:withDefaultVersionString:withDefaultRepositoryDecription:'
                                explanation:
                                    'version field is incorrect, should be: ' , prj singletonVersionName printString) ] ]
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineOfProjectSpec>>version [
    self projectClass == nil
        ifTrue: [ ^ nil ].
    ^ self projectClassProject version
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineOfProjectSpec>>version: anObject constructor: aVersionConstructor [
    self error: 'version: not allowed in a baseline project spec'
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineOfProjectSpec>>versionString [
    ^ versionString ifNil: [ self version ifNotNil: [:v | v versionString] ]
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCBaselineOfProjectSpec>>versionString: anObject constructor: aVersionConstructor [
    self error: 'versionString: not allowed in a baseline project spec'
]
