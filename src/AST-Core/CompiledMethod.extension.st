Extension {
	#name : #CompiledMethod
}

{
	#category : #'*AST-Core',
	#timestamp : ' 8/31/2017 07:16:40'
}
CompiledMethod>>ast [
	^ ASTCache at: self
]

{
	#category : #'*AST-Core',
	#timestamp : ' 8/31/2017 07:16:40'
}
CompiledMethod>>parseTree [
	^(RBParser 
		parseMethod: self sourceCode 
		onError: [ :msg :pos | 
			^ self decompile ]) methodClass: self methodClass.
]
