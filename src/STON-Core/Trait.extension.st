Extension {
	#name : #Trait
}

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Trait>>stonOn: stonWriter [
	stonWriter 
		writeObject: self 
		listSingleton: self name asSymbol
]
