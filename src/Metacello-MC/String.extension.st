Extension {
	#name : #String
}

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
String>>addToMetacelloRepositories: aMetacelloRepositoriesSpec [

	| spec |
	spec := 
		(aMetacelloRepositoriesSpec project repositorySpec)
			description: self;
			yourself.
	aMetacelloRepositoriesSpec addMember: 
		(aMetacelloRepositoriesSpec addMember 
			name: spec name;
			spec: spec;
			yourself)
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
String>>fetchRequiredForMetacelloMCVersion: aMetacelloMCVersion [

	^aMetacelloMCVersion doFetchRequiredFromArray: (Array with: self).
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
String>>loadRequiredForMetacelloMCVersion: aMetacelloMCVersion [

	^aMetacelloMCVersion doLoadRequiredFromArray: (Array with: self).
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
String>>mergeIntoMetacelloRepositories: aMetacelloRepositoriesSpec [

	| spec |
	spec := 
		(aMetacelloRepositoriesSpec project repositorySpec)
			description: self;
			yourself.
	aMetacelloRepositoriesSpec addMember: 
		(aMetacelloRepositoriesSpec mergeMember 
			name: spec name;
			spec: spec;
			yourself)
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
String>>packageFileSpecFor: aMetacelloPackagesSpec [

	^(aMetacelloPackagesSpec project packageSpec)
			file: self;
			yourself
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
String>>recordRequiredForMetacelloMCVersion: aMetacelloMCVersion [

	^aMetacelloMCVersion doRecordRequiredFromArray: (Array with: self).
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
String>>removeFromMetacelloRepositories: aMetacelloRepositoriesSpec [

	aMetacelloRepositoriesSpec addMember: 
		(aMetacelloRepositoriesSpec removeMember 
			name: self;
			yourself)
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
String>>resolvePackageSpecsNamedForMetacelloMCVersion: aMetacelloMCVersion visited: visited ifAbsent: aBlock [
    ^ aMetacelloMCVersion
        allPackagesForSpecs: {(aMetacelloMCVersion packageNamed: self ifAbsent: aBlock)}
        visited: visited
]
