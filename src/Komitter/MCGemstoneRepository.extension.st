Extension {
	#name : #MCGemstoneRepository
}

{
	#category : #'*Komitter-Models',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCGemstoneRepository>>koRemote [

	^ KomitGemstoneRemote new
		remote: self;
		yourself
]
