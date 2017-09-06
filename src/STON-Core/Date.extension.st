Extension {
	#name : #Date
}

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Date class>>fromSton: stonReader [
	^ self readFrom: stonReader parseListSingleton readStream
]

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Date>>stonContainSubObjects  [
	^ false
]

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Date>>stonOn: stonWriter [
	"Use an ISO style YYYY-MM-DD representation"
	
	stonWriter writeObject: self listSingleton: self yyyymmdd
]
