Extension {
	#name : #DateAndTime
}

{
	#category : #'*GT-SUnitDebugger',
	#timestamp : ' 8/31/2017 05:26:37'
}
DateAndTime>>gtDebuggerSUnitPrint [

	^ String streamContents: [:s | self printSeparateDateAndTimeOn: s]
]
