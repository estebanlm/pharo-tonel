Extension {
	#name : #Number
}

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Number>>stonContainSubObjects  [
	^ false
]

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Number>>stonOn: stonWriter [
	stonWriter writeFloat: self asFloat
]
