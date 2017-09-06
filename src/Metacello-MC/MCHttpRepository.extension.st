Extension {
	#name : #MCHttpRepository
}

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
MCHttpRepository>>asRepositorySpecFor: aMetacelloMCProject [

	^(aMetacelloMCProject repositorySpec)
		description:  self description;
	 	type: 'http';
		yourself
]
