Extension {
	#name : #AbstractCompiler
}

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
AbstractCompiler>>silentlyDo: aBlock [
	self silentlyDo: aBlock exceptionDo: [ " ignore " ]
]

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
AbstractCompiler>>silentlyDo: aBlock1 exceptionDo: aBlock2 [
	aBlock1
		on: Error, SyntaxErrorNotification, OCSemanticWarning, OCSemanticError
		do: aBlock2
]
