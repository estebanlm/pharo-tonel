Extension {
	#name : #Time
}

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Time class>>fromSton: stonReader [
	^ self readFrom: stonReader parseListSingleton readStream
]

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Time>>stonContainSubObjects  [
	^ false
]

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Time>>stonOn: stonWriter [
	"Use an ISO style HH:MM:SS.N representation (with optional nanoseconds)"
	 
	stonWriter writeObject: self listSingleton: 
		(String streamContents: [ :stream |
			self print24: true showSeconds: true on: stream ])
]
