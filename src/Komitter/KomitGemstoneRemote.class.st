"
I encapsulate a gemstone repository
"
Class {
	#name : #KomitGemstoneRemote,
	#superclass : #KomitRemote,
	#category : #Komitter-Models,
	#timestamp : '<historical>'
}

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitGemstoneRemote>>icon [
	^ self iconNamed: #komitterGemstoneRemote
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitGemstoneRemote>>label [
	| url |
	url := self remote location splitOn: '/'.
	
	^ String streamContents: [ :stream | stream << (url at: 5) ]
]
