Extension {
	#name : #Object
}

{
	#category : #'*GT-SUnitDebugger',
	#timestamp : ' 8/31/2017 05:26:37'
}
Object>>gtDebuggerSUnitPrint [
	"I return a textual representation of the object that is used by the SUnit debugger to compare objects using a textual diff."
	
	^ self printString
]
