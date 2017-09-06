"
SUnit tests for CompiledMethodTrailer
"
Class {
	#name : #CompiledMethodTrailerTest,
	#superclass : #TestCase,
	#category : #Kernel-Tests-Methods,
	#timestamp : 'TorstenBergmann 2/5/2014 08:32'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTrailerTest>>testEmbeddingCompressedSourceCode [

	| trailer newTrailer code |
	
	trailer := CompiledMethodTrailer new.
	
	code := 'foo'.
	trailer compressSourceCode: code.
	newTrailer := trailer testEncoding.
	
	self assert: (trailer kind == #EmbeddedSourceQCompress ).
	self assert: (newTrailer sourceCode = code).

	"the last bytecode index must be at 0"
	self assert: (newTrailer endPC = 0).

	code := 'testEmbeddingSourceCode

	| trailer newTrailer code |
	
	trailer := CompiledMethodTrailer new.
	
	trailer sourceCode: code.
	newTrailer := trailer testEncoding.
	
	self assert: (newTrailer sourceCode = code).'.

	trailer compressSourceCode: code.
	self assert: (trailer kind == #EmbeddedSourceZip ).
	newTrailer := trailer testEncoding.
	
	self assert: (newTrailer sourceCode = code).
	"the last bytecode index must be at 0"
	self assert: (newTrailer endPC = 0).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTrailerTest>>testEmbeddingSourceCode [

	self testEmbeddingSourceCode: 'foo'.
	
	self testEmbeddingSourceCode: 'testEmbeddingSourceCode

	| trailer newTrailer code |
	
	trailer := CompiledMethodTrailer new.
	
	trailer sourceCode: code.
	newTrailer := trailer testEncoding.
	
	self assert: (newTrailer sourceCode = code).'.
	
	"Test a big string"
	self testEmbeddingSourceCode: (String loremIpsum: 30000).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTrailerTest>>testEmbeddingSourceCode: sourceCode [

	| trailer newTrailer |
	
	trailer := CompiledMethodTrailer new.
	trailer embeddedSourceCode: sourceCode.
	newTrailer := trailer testEncoding.
	
	self assert: (trailer kind == #EmbeddedSource ).
	self assert: (newTrailer sourceCode = sourceCode).

	"the last bytecode index must be at 0"
	self assert: (newTrailer endPC = 0).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTrailerTest>>testEncodingNoTrailer [

	| trailer |
	
	trailer := CompiledMethodTrailer new.
	
	"by default it should be a no-trailer, 4 byte wide so it can be used to store a sourcePointer"	
	self assert: (trailer kind == #NoTrailer ).
	self assert: (trailer size = 4).
	
	trailer := trailer testEncoding.
	
	self assert: (trailer kind == #NoTrailer ).
	self assert: (trailer size = 4).
	"the last bytecode index must be at 0"
	self assert: (trailer endPC = 0).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTrailerTest>>testEncodingSourcePointer [

	| trailer |
	
	trailer := CompiledMethodTrailer new.
	
	CompiledMethod allInstancesDo: [:method | | ptr |
		trailer method: method.
		self assert: ( (ptr := method sourcePointer) == trailer sourcePointer).
		"the last bytecode index must be at 0"
		ptr ~= 0 ifTrue: [
			self assert: (method endPC = trailer endPC) ].
	 ].
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTrailerTest>>testEncodingVarLengthSourcePointer [

	| trailer newTrailer |
	
	trailer := CompiledMethodTrailer new.
	
	trailer sourcePointer: 1.
	newTrailer := trailer testEncoding.
	
	self assert: (newTrailer sourcePointer = 1).
	
	trailer sourcePointer: 16r100000000000000.
	newTrailer := trailer testEncoding.
	self assert: (newTrailer sourcePointer = 16r100000000000000).
	"the last bytecode index must be at 0"
	self assert: (newTrailer endPC = 0).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
CompiledMethodTrailerTest>>testEncodingZeroSourcePointer [

	| trailer |
	
	trailer := CompiledMethodTrailer new.

	self assert: 
		(trailer sourcePointer: 0) testEncoding sourcePointer = 0
	
]
