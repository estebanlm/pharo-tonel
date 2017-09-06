Extension {
	#name : #BlockClosure
}

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
BlockClosure>>sourceNode [
	"Return an instance of RBBlockNode representing the receiver's AST."

	"the bytecode just before the first bytecode of the block is a bytecode that creates the complete block"

	^ self method sourceNodeForPC: self startpc - 1
]
