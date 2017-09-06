Extension {
	#name : #ByteArray
}

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
ByteArray class>>fromSton: stonReader [
	^ self readHexFrom: stonReader parseListSingleton
]

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
ByteArray>>stonContainSubObjects  [
	^ false
]

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
ByteArray>>stonOn: stonWriter [
	"Use a hex representation"
	
	stonWriter writeObject: self listSingleton: self hex
]
