Extension {
	#name : #MCSqueaksourceRepository
}

{
	#category : #'*Komitter-Models',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCSqueaksourceRepository>>koRemote [

	^ KomitSqueakSourceRemote new
		remote: self;
		yourself
]
