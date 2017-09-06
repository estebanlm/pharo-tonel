"

"
Class {
	#name : #MetacelloRepositorySpec,
	#superclass : #MetacelloSpec,
	#instVars : [
		'description',
		'username',
		'password',
		'type'
	],
	#category : #Metacello-MC-Specs,
	#timestamp : ''
}

{
	#category : #adding,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloRepositorySpec>>addToMetacelloRepositories: aMetacelloRepositoriesSpec [

	aMetacelloRepositoriesSpec addMember: 
		(aMetacelloRepositoriesSpec addMember 
			name: self name;
			spec: self;
			yourself)
]

{
	#category : #'mc support',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloRepositorySpec>>canUpgradeTo: aMetacelloRepositorySpec [
  self description = aMetacelloRepositorySpec description
    ifTrue: [ ^ true ].
  (#('github' 'gitorious' 'bitbucket') includes: self type)
    ifTrue: [ ^ self createRepository canUpgradeTo: aMetacelloRepositorySpec createRepository ].
  ^ false
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloRepositorySpec>>configMethodCascadeOn: aStream lastCascade: lastCascade [

	aStream nextPutAll: 'repository: ', self description printString.
	(self username isEmpty not or: [ self password isEmpty not ])
		ifTrue: [ aStream nextPutAll: ' username: ', self username printString, ' password: ', self password printString ].
	lastCascade ifFalse: [ aStream nextPut: $;; cr ].
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloRepositorySpec>>configMethodOn: aStream indent: indent [

	aStream 
		tab: indent; 
		nextPutAll: 'spec '.
	self configMethodCascadeOn: aStream lastCascade: true
]

{
	#category : #'mc support',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloRepositorySpec>>createRepository [
  | repo |
  repo := self project createRepository: self.
  ^ MCRepositoryGroup default repositories
    detect: [ :each | each = repo ]
    ifNone: [ 
      MCRepositoryGroup default addRepository: repo.
      repo ]
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloRepositorySpec>>description [

	^description
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloRepositorySpec>>description: aString [

	description := aString
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloRepositorySpec>>extractTypeFromDescription [

	^MetacelloPlatform current extractTypeFromDescription: self description
]

{
	#category : #'mc support',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloRepositorySpec>>hasNoLoadConflicts: aMetacelloRepositorySpec [
  self description = aMetacelloRepositorySpec description
    ifTrue: [ ^ true ].
  (#('github' 'gitorious' 'bitbucket') includes: self type)
    ifTrue: [ 
      ^ self createRepository
        hasNoLoadConflicts: aMetacelloRepositorySpec createRepository ].
  ^ false
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloRepositorySpec>>mergeIntoMetacelloRepositories: aMetacelloRepositoriesSpec [

	aMetacelloRepositoriesSpec addMember: 
		(aMetacelloRepositoriesSpec mergeMember 
			name: self name;
			spec: self;
			yourself)
]

{
	#category : #merging,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloRepositorySpec>>mergeMap [
    | map |
    map := super mergeMap.
    map at: #'description' put: description.
    map at: #'type' put: self type.
    map at: #'username' put: username.
    map at: #'password' put: password.
    ^ map
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloRepositorySpec>>name [

	^self description
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloRepositorySpec>>password [

	password == nil ifTrue: [ password := '' ].
	^password
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloRepositorySpec>>password: aString [

	password := aString
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloRepositorySpec>>removeFromMetacelloRepositories: aMetacelloRepositoriesSpec [

	aMetacelloRepositoriesSpec addMember: 
		(aMetacelloRepositoriesSpec removeMember 
			name: self name;
			spec: self;
			yourself)
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloRepositorySpec>>type [

	type == nil ifTrue: [ type := self extractTypeFromDescription ].
	^type
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloRepositorySpec>>type: aString [

	type := aString
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloRepositorySpec>>username [

	username == nil ifTrue: [ username := '' ].
	^username
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloRepositorySpec>>username: aString [

	username := aString
]
