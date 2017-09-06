Extension {
	#name : #KomitHttpRemote
}

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitHttpRemote>>icon [

	^ 'HTTP'
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitHttpRemote>>label [
	
	^ self remote location
]
