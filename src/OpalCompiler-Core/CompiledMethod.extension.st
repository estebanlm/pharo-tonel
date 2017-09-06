Extension {
	#name : #CompiledMethod
}

{
	#category : #'*opalcompiler-core',
	#timestamp : ' 8/31/2017 07:16:23'
}
CompiledMethod>>decompile [
	^Smalltalk globals 
		at: #FBDDecompiler
		ifPresent: [ :decompiler | decompiler new  decompile: self]  
		ifAbsent: [ RBParser parseMethod: self selector asMethodPreamble, '
	self noSourceAvailable' ]
]

{
	#category : #'*opalcompiler-core',
	#timestamp : ' 8/31/2017 07:16:23'
}
CompiledMethod>>decompileIR [
	
	^ IRBytecodeDecompiler new decompile: self
]

{
	#category : #'*opalcompiler-core',
	#timestamp : ' 8/31/2017 07:16:23'
}
CompiledMethod>>ir [
	"We as the AST for the IR... for decompiling ir from bytecode, look at IRBytecodeDecompiler"
	^ self ast ir
]

{
	#category : #'*opalcompiler-core',
	#timestamp : ' 8/31/2017 07:16:23'
}
CompiledMethod>>irPrimitive [

	| primNode n |
	primNode := IRPrimitive new num: (n := self primitive).
	(n = 117 or: [n = 120]) ifTrue: [
		primNode spec: (self literalAt: 1)].
	^ primNode
]

{
	#category : #'*opalcompiler-core',
	#timestamp : ' 8/31/2017 07:16:23'
}
CompiledMethod>>methodNode [
	"Return the parse tree that represents self"
	| aClass source methodNode |
	
	aClass := self methodClass.
	source := self sourceCode.
	methodNode := aClass compiler parse: source.
	methodNode source: source.
	^methodNode.
			
]

{
	#category : #'*opalcompiler-core',
	#timestamp : ' 8/31/2017 07:16:23'
}
CompiledMethod>>recompile [
	^ self methodClass recompile: self selector
]

{
	#category : #'*opalcompiler-core',
	#timestamp : ' 8/31/2017 07:16:23'
}
CompiledMethod>>reformat [
	self methodClass compile: self ast formattedCode classified:  self category.
]

{
	#category : #'*opalcompiler-core',
	#timestamp : ' 8/31/2017 07:16:23'
}
CompiledMethod>>sourceNode [
	^self ast
]

{
	#category : #'*opalcompiler-core',
	#timestamp : ' 8/31/2017 07:16:23'
}
CompiledMethod>>sourceNodeExecutedForPC: aPC [
	^self sourceNode sourceNodeExecutedForPC: aPC
]

{
	#category : #'*opalcompiler-core',
	#timestamp : ' 8/31/2017 07:16:23'
}
CompiledMethod>>sourceNodeForPC: aPC [
	^self sourceNode sourceNodeForPC: aPC
]
