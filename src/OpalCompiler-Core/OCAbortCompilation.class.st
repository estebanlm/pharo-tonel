"
Raises an error that represents that the compilation has been aborted. If not handled, it signals an UnhandledError.
"
Class {
	#name : #OCAbortCompilation,
	#superclass : #Error,
	#instVars : [
		'sourceCode'
	],
	#category : #OpalCompiler-Core-Exception,
	#timestamp : 'AlejandroInfante 3/31/2017 12:15'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbortCompilation class>>sourceCode: code [
	^ self new
		sourceCode: code;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbortCompilation>>sourceCode [
	^ sourceCode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCAbortCompilation>>sourceCode: anObject [
	sourceCode := anObject
]
