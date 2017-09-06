Extension {
	#name : #Integer
}

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Integer>>stonOn: stonWriter [
	stonWriter writeInteger: self
]
