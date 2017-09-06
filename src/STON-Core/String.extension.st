Extension {
	#name : #String
}

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
String>>stonContainSubObjects  [
	^ false
]

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
String>>stonOn: stonWriter [
	stonWriter writeString: self
]
