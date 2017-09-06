Extension {
	#name : #UndefinedObject
}

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
UndefinedObject>>stonContainSubObjects  [
	^ false
]

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
UndefinedObject>>stonOn: stonWriter [
	stonWriter writeNull
]
