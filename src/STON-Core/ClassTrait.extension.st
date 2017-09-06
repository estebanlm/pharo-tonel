Extension {
	#name : #ClassTrait
}

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
ClassTrait>>stonName [
	^ #Class
]

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
ClassTrait>>stonOn: stonWriter [
	stonWriter
		writeObject: self 
		listSingleton: self theNonMetaClass name asSymbol
]
