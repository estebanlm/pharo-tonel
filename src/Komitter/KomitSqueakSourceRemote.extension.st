Extension {
	#name : #KomitSqueakSourceRemote
}

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitSqueakSourceRemote>>icon [
	^ self iconNamed: #komitterSqueakSourceRemote
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitSqueakSourceRemote>>label [
	| url |
	url := self remote location splitOn: '/'.
	
	^ String streamContents: [ :stream | stream << (url at: 4) ]
]
