Extension {
	#name : #KomitSmalltalkhubRemote
}

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitSmalltalkhubRemote>>icon [
	^ self iconNamed: #komitterSmalltalkhubRemote
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitSmalltalkhubRemote>>label [
	| url |
	url := self remote location splitOn: '/'.
	
	^ String streamContents: [ :stream | stream << (url at: 6) << ' / ' << (url at: 5) ]
]
