Extension {
	#name : #Boolean
}

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Boolean>>stonContainSubObjects  [
	^ false
]

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Boolean>>stonOn: stonWriter [
	stonWriter writeBoolean: self
]
