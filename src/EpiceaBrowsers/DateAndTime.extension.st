Extension {
	#name : #DateAndTime
}

{
	#category : #'*EpiceaBrowsers',
	#timestamp : ' 8/31/2017 05:26:27'
}
DateAndTime>>epiceaBrowsersAsString [

	^ String streamContents: [ :stream |
		stream 
			nextPutAll: self asDate epiceaBrowsersAsString;
			nextPutAll: ', '.
		self asTime 
			print24: false
			showSeconds: false 
			on: stream ]
]
