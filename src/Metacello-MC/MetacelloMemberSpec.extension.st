Extension {
	#name : #MetacelloMemberSpec
}

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMemberSpec>>addToMetacelloPackages: aMetacelloPackagesSpec [

	aMetacelloPackagesSpec addMember: self
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMemberSpec>>addToMetacelloRepositories: aMetacelloRepositoriesSpec [

	aMetacelloRepositoriesSpec addMember: self
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMemberSpec>>mergeIntoMetacelloPackages: aMetacelloPackagesSpec [

	aMetacelloPackagesSpec addMember: self
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMemberSpec>>mergeIntoMetacelloRepositories: aMetacelloRepositoriesSpec [

	aMetacelloRepositoriesSpec addMember: self
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMemberSpec>>removeFromMetacelloPackages: aMetacelloPackagesSpec [

	aMetacelloPackagesSpec addMember: self
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMemberSpec>>removeFromMetacelloRepositories: aMetacelloRepositoriesSpec [

	aMetacelloRepositoriesSpec addMember: self
]
