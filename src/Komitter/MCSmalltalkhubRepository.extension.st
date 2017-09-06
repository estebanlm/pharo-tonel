Extension {
	#name : #MCSmalltalkhubRepository
}

{
	#category : #'*Komitter-Models',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCSmalltalkhubRepository>>koRemote [

	^ KomitSmalltalkhubRemote new
		remote: self;
		yourself
]
