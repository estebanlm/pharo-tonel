Extension {
	#name : #Collection
}

{
	#category : #'*GT-SUnitDebugger',
	#timestamp : ' 8/31/2017 05:26:37'
}
Collection>>gtDebuggerSUnitPrint [

	^ String streamContents: [:s | self asStringOn: s delimiter: Character cr asString]
]
