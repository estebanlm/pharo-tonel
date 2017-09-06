Extension {
	#name : #Class
}

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Class class>>fromSton: stonReader [
	| theClassName theClass |
	theClassName := stonReader parseListSingleton.
	theClass := self environment at: theClassName.
	^ theClass
]

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Class>>stonOn: stonWriter [
	stonWriter 
		writeObject: self 
		listSingleton: self name asSymbol
]
