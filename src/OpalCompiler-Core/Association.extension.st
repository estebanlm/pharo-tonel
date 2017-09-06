Extension {
	#name : #Association
}

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
Association>>emitStore: methodBuilder [

	methodBuilder storeIntoLiteralVariable: self.


]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
Association>>emitValue: methodBuilder [

	methodBuilder pushLiteralVariable: self.
]
