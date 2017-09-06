Extension {
	#name : #InstructionStream
}

{
	#category : #'*OpalCompiler-Core',
	#timestamp : ' 8/31/2017 07:16:23'
}
InstructionStream class>>compiler [
	"The JIT compiler needs to trap all reads to instance variables of contexts. As this check is costly, it is only done
	in the long form of the bytecodes, which are not used often. In this hierarchy we force the compiler to alwasy generate
	long bytecodes"
	^super compiler options: #(+ optionLongIvarAccessBytecodes)
]
