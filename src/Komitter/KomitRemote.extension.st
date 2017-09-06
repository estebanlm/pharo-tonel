Extension {
	#name : #KomitRemote
}

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitRemote>>icon [

	^ nil
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitRemote>>komitOn: aKomitterUI [

	^ aKomitterUI newKomitFor: self
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitRemote>>label [

	^ ''
]
