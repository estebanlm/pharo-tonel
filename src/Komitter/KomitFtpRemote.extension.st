Extension {
	#name : #KomitFtpRemote
}

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitFtpRemote>>icon [

	^ 'FTP'
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitFtpRemote>>label [
	
	^ self remote location
]
