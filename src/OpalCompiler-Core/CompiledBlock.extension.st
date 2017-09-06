Extension {
	#name : #CompiledBlock
}

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
CompiledBlock>>ast [
	^ self sourceNodeInOuter
]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
CompiledBlock>>sourceNode [
	^ self sourceNodeInOuter
]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
CompiledBlock>>sourceNodeExecutedForPC: aPC [
	| blockNode |
	blockNode := self outerCode sourceNodeExecutedForPC: self pcInOuter.
	^blockNode sourceNodeExecutedForPC: aPC
]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
CompiledBlock>>sourceNodeForPC: aPC [
	| blockNode |
	blockNode := self outerCode sourceNodeForPC: self pcInOuter.
	^blockNode sourceNodeForPC: aPC
]

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
CompiledBlock>>sourceNodeInOuter [
	^ self outerCode sourceNodeForPC: self pcInOuter
]
