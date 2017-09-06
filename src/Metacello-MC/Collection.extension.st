Extension {
	#name : #Collection
}

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
Collection>>addToMetacelloRepositories: aMetacelloRepositoriesSpec [

	self do: [:each | each addToMetacelloRepositories: aMetacelloRepositoriesSpec ]
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
Collection>>fetchRequiredForMetacelloMCVersion: aMetacelloMCVersion [

	^aMetacelloMCVersion doFetchRequiredFromArray: self.
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
Collection>>loadRequiredForMetacelloMCVersion: aMetacelloMCVersion [

	^aMetacelloMCVersion doLoadRequiredFromArray: self.
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
Collection>>mergeIntoMetacelloRepositories: aMetacelloRepositoriesSpec [

	self do: [:each | each mergeIntoMetacelloRepositories: aMetacelloRepositoriesSpec ]
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
Collection>>recordRequiredForMetacelloMCVersion: aMetacelloMCVersion [

	^aMetacelloMCVersion doRecordRequiredFromArray: self.
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
Collection>>removeFromMetacelloRepositories: aMetacelloRepositoriesSpec [

	self do: [:each | each removeFromMetacelloRepositories: aMetacelloRepositoriesSpec ]
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
Collection>>resolvePackageSpecsNamedForMetacelloMCVersion: aMetacelloMCVersion visited: visited ifAbsent: aBlock [
    ^ aMetacelloMCVersion
        allPackagesForSpecs: (self collect: [ :ea | aMetacelloMCVersion packageNamed: ea ifAbsent: aBlock ])
        visited: visited
]
