"

"
Class {
	#name : #MetacelloGenericProjectSpec,
	#superclass : #MetacelloProjectSpec,
	#instVars : [
		'projectPackage',
		'repositories'
	],
	#category : #Metacello-Core-Specs,
	#timestamp : ''
}

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloGenericProjectSpec>>compareEqual: aMetacelloProjectSpec [
    "'projectPackage repositories'"

    ^ (super compareEqual: aMetacelloProjectSpec)
        and: [ self repositories compareEqual: aMetacelloProjectSpec repositories ]
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloGenericProjectSpec>>determineCurrentVersionForLoad [
    self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloGenericProjectSpec>>getRepositories [
    "raw access to iv"

    ^ repositories
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloGenericProjectSpec>>hasNoLoadConflicts: aMetacelloProjectSpec [
  "'projectPackage repositories'"

  ^ (super hasNoLoadConflicts: aMetacelloProjectSpec)
    and: [ 
      (self repositories isEmpty or: [ aMetacelloProjectSpec repositories isEmpty ])
        or: [ self repositories hasNoLoadConflicts: aMetacelloProjectSpec repositories ] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloGenericProjectSpec>>hasRepository [
    ^ self repositorySpecs notEmpty
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloGenericProjectSpec>>load [
    (MetacelloLookupProjectSpecForLoad new
        projectSpec: self;
        yourself) signal performLoad
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloGenericProjectSpec>>loadVersion: aVersionOrNil [
    self subclassResponsibility
]

{
	#category : #merging,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloGenericProjectSpec>>mergeMap [
    | map |
    map := super mergeMap.
    map at: #'repositories' put: repositories.
    ^ map
]

{
	#category : #merging,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloGenericProjectSpec>>mergeRepositoriesSpec: anotherRepositories [
  self
    repositories:
      (self getRepositories == nil
        ifTrue: [ anotherRepositories ]
        ifFalse: [ self repositories mergeSpec: anotherRepositories ])
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloGenericProjectSpec>>mergeScriptRepository: anotherSpec [
    self repositories: anotherSpec repositories
]

{
	#category : #merging,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloGenericProjectSpec>>mergeSpec: anotherSpec [
  | newSpec map anotherRepositories |
  newSpec := super mergeSpec: anotherSpec.
  map := anotherSpec mergeMap.
  (anotherRepositories := map at: #'repositories') ~~ nil
    ifTrue: [ newSpec mergeRepositoriesSpec: anotherRepositories ].
  ^ newSpec
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloGenericProjectSpec>>metacelloRegistrationHash [
    "projectPackage (ignored) repositories"

    ^ super metacelloRegistrationHash bitXor: self repositories metacelloRegistrationHash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloGenericProjectSpec>>name: aString [
    super name: aString.
    self projectPackage: nil
]

{
	#category : #merging,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloGenericProjectSpec>>nonOverridable [
    ^ super nonOverridable , #(#'projectPackage' #'repositories')
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloGenericProjectSpec>>postCopy [
    super postCopy.
    repositories := repositories copy.
    projectPackage := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloGenericProjectSpec>>projectPackage [
    self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloGenericProjectSpec>>projectPackage: aProjectPackage [
    self shouldBeMutable.
    projectPackage := aProjectPackage
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloGenericProjectSpec>>projectPackage: aBlock constructor: aVersionConstructor [
    aVersionConstructor projectPackageForProject: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloGenericProjectSpec>>repositories [
    repositories ifNil: [ repositories := self project repositoriesSpec ].
    ^ repositories
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloGenericProjectSpec>>repositories: anObject [
    self shouldBeMutable.
    repositories := anObject.
    self projectPackage: nil
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloGenericProjectSpec>>repositories: aBlock constructor: aVersionConstructor [
    aVersionConstructor repositoriesForProject: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloGenericProjectSpec>>repository: aStringOrMetacelloRepositorySpec [
    self repositories repository: aStringOrMetacelloRepositorySpec.
    self projectPackage: nil
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloGenericProjectSpec>>repository: anObject constructor: aVersionConstructor [
    aVersionConstructor repositoryForProject: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloGenericProjectSpec>>repository: aString username: username password: password [
    self repositories repository: aString username: username password: password.
    self projectPackage: nil
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloGenericProjectSpec>>repository: aString username: username password: password constructor: aVersionConstructor [
    aVersionConstructor repositoryForProject: aString username: username password: password
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloGenericProjectSpec>>repositoryDescriptions [
    ^ self repositorySpecs collect: [ :repoSpec | repoSpec description ]
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloGenericProjectSpec>>repositorySpecs [
    repositories ifNil: [ ^ #() ].
    ^ self repositories map values
]
