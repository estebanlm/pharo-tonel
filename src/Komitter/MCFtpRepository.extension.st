Extension {
	#name : #MCFtpRepository
}

{
	#category : #'*Komitter-Models',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCFtpRepository>>isRemote [
	^ true
]

{
	#category : #'*Komitter-Models',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCFtpRepository>>koRemote [
	
	^ KomitFtpRemote new
		remote: self;
		yourself
]
