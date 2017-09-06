Extension {
	#name : #Symbol
}

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Symbol>>stonOn: stonWriter [
	stonWriter writeSymbol: self
]
