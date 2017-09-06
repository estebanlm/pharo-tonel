Extension {
	#name : #CompiledCode
}

{
	#category : #'*opalcompiler-core',
	#timestamp : ' 8/31/2017 07:16:23'
}
CompiledCode>>compiler [
	^self methodClass 
		ifNil: [Smalltalk compiler] 
		ifNotNil: [:class | class compiler].
]

{
	#category : #'*opalcompiler-core',
	#timestamp : ' 8/31/2017 07:16:23'
}
CompiledCode>>compilerClass [
	^self methodClass 
		ifNil: [Smalltalk compilerClass] 
		ifNotNil: [:class | class compilerClass].
]
