Extension {
	#name : #Object
}

{
	#category : #'*OSWindow-Core',
	#timestamp : ' 8/31/2017 05:26:40'
}
Object>>inspectInExternalWindow [
	^ GTInspector new openInExternalWindowOn: self
]
