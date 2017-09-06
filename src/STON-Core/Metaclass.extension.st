Extension {
	#name : #Metaclass
}

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Metaclass class>>fromSton: stonReader [
	| theClassName theClass theMetaclass |
	theClassName := stonReader parseListSingleton.
	theClass := self environment at: theClassName.
	theMetaclass := theClass class.
	^ theMetaclass
]

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Metaclass>>stonName [
	^ #Class
]

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Metaclass>>stonOn: stonWriter [
	stonWriter
		writeObject: self 
		listSingleton: self theNonMetaClass name asSymbol
]
