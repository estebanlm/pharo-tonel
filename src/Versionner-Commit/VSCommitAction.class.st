"
I'm a commit action. 
I can be executed to perform certain operations (commit packages to their repositories, generate new configurations, etc)
"
Class {
	#name : #VSCommitAction,
	#superclass : #Object,
	#category : #Versionner-Commit,
	#timestamp : 'EstebanLorenzano 4/23/2015 15:48'
}

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitAction>>browseOn: aBrowser [
	self subclassResponsibility
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitAction>>commitPackage: packageName comment: comment [
	| remoteRepository version |

	remoteRepository := self remoteRepository.
	version := self workingCopy 
		newVersionWithMessage: comment 
		in: remoteRepository.
	self retryOnCredentialRequest: [ remoteRepository storeVersion: version ]
]

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitAction>>currentString [
	^ self subclassResponsibility
]

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitAction>>displayString [
	^ self subclassResponsibility

]

{
	#category : #executing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitAction>>executeOn: aUnit [
	self subclassResponsibility
]

{
	#category : #'*Versionner-Commit-UI',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitAction>>icon [
	^ self subclassResponsibility
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitAction>>isPackage [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitAction>>isProject [
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitAction>>nextVersion: aString	 [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitAction>>nextVersionOn: aUnit [
	^ nil
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitAction>>remoteRepository [
	| repositoryWithoutSlash |
	
	repositoryWithoutSlash  := self repository last = $/
		ifTrue: [ self repository allButLast ]
		ifFalse: [ self repository ].
	
	^ MCRepositoryGroup default repositories
		detect: [:each | 
			(each description = repositoryWithoutSlash) 
			or: [ each description = (repositoryWithoutSlash, '/') ] ]
		ifNone: [
			MCHttpRepository
				location: self repository
				user: ''
				password: '' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitAction>>removeOn: aUnit [
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitAction>>repository [
	^ self subclassResponsibility
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitAction>>retryOnCredentialRequest: aBlock [
	aBlock on: MCPermissionDenied do: [ :e | 
		| credentials remoteRepository | 
	
		remoteRepository := self remoteRepository.
		credentials := MCCredentialsRequest 
			signalUrl: remoteRepository location
			username: remoteRepository user
			password: remoteRepository password.
		credentials ifNotNil: [
			remoteRepository credentials: credentials.
			^ self retryOnCredentialRequest: aBlock ] ]
]

{
	#category : #validation,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitAction>>validate [

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSCommitAction>>workingCopy  [
	^ self subclassResponsibility
]
