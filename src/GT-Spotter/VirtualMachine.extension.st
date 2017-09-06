Extension {
	#name : #VirtualMachine
}

{
	#category : #'*GT-Spotter',
	#timestamp : ' 8/31/2017 05:26:36'
}
VirtualMachine>>canHandleShiftPressed [
	^ self interpreterSourceDate < 2015 asYear 
]
