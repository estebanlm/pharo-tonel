Extension {
	#name : #Character
}

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Character class>>fromSton: stonReader [
	^ stonReader parseListSingleton first
]

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Character>>stonOn: stonWriter [
	stonWriter writeObject: self listSingleton: self asString
]
