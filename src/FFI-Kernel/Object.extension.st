Extension {
	#name : #Object
}

{
	#category : #'*FFI-Kernel',
	#timestamp : ' 8/31/2017 05:26:09'
}
Object>>externalCallFailed [
	"Raise an error after a failed call to an external function"
	| errCode |
	errCode := ExternalFunction getLastError. "this allows us to look at the actual error code"
	^self error: (ExternalFunction errorMessageFor: errCode).
]
